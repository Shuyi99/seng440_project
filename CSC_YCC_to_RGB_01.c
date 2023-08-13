// Copyright 2023 Mihai SIMA (mihai.sima@ieee.org).  All rights reserved.
// Color Space Conversion (CSC) in fixed-point arithmetic
// YCC to RGB conversion

//#include <stdio.h>
#include <stdint.h>
#include "CSC_global.h"
#include <stdio.h>

// private data

// private prototypes
// =======
static uint8_t saturation_float( float argument);
static void CSC_YCC_to_RGB_brute_force_float( int row, int col);

// =======
static uint8_t saturation_int( int argument);
static void CSC_YCC_to_RGB_brute_force_int( int row, int col);

// =======
static void chrominance_upsample(
    uint8_t C_pixel_1, uint8_t C_pixel_2,
    uint8_t C_pixel_3, uint8_t C_pixel_4,
    uint8_t *top, uint8_t *left, uint8_t *middle);
// =======
 static void chrominance_array_upsample( void);

// private definitions
// =======
static uint8_t saturation_float( float argument) {
  if( argument > 255.0) { // saturation
    return( (uint8_t)255);
  }
  else if( argument < 0.0) {
    return( (uint8_t)0);
  }
  else {
    return( (uint8_t)argument);
  }
} // END of saturation_float()

// =======
static void CSC_YCC_to_RGB_brute_force_float( int row, int col) {
//
  float R_pixel_00, R_pixel_01, R_pixel_10, R_pixel_11;
  float G_pixel_00, G_pixel_01, G_pixel_10, G_pixel_11;
  float B_pixel_00, B_pixel_01, B_pixel_10, B_pixel_11;

  // Upsample Cb and Cr into Cb_temp and Cr_temp
  //chrominance_array_upsample();

  R_pixel_00 =   1.164*(Y[row+0][col+0] - 16.0)
               + 1.596*(Cr_temp[row+0][col+0] - 128.0);
  R[row+0][col+0] = saturation_float( R_pixel_00);
//
  R_pixel_01 =   1.164*(Y[row+0][col+1] - 16.0)
               + 1.596*(Cr_temp[row+0][col+1] - 128.0);
  R[row+0][col+1] = saturation_float( R_pixel_01);
//
  R_pixel_10 =   1.164*(Y[row+1][col+0] - 16.0)
               + 1.596*(Cr_temp[row+1][col+0] - 128.0);
  R[row+1][col+0] = saturation_float( R_pixel_10);
//
  R_pixel_11 =   1.164*(Y[row+1][col+1] - 16.0)
               + 1.596*(Cr_temp[row+1][col+1] - 128.0);
  R[row+1][col+1] = saturation_float( R_pixel_11);

  G_pixel_00 =   1.164*(Y[row+0][col+0] - 16.0)
               - 0.813*(Cr_temp[row+0][col+0] - 128.0)
               - 0.391*(Cb_temp[row+0][col+0] - 128.0);
  G[row+0][col+0] = saturation_float( G_pixel_00);
//
  G_pixel_01 =   1.164*(Y[row+0][col+1] - 16.0)
               - 0.813*(Cr_temp[row+0][col+1] - 128.0)
               - 0.391*(Cb_temp[row+0][col+1] - 128.0);
  G[row+0][col+1] = saturation_float( G_pixel_01);
//
  G_pixel_10 =   1.164*(Y[row+1][col+0] - 16.0)
               - 0.813*(Cr_temp[row+1][col+0] - 128.0)
               - 0.391*(Cb_temp[row+1][col+0] - 128.0);
  G[row+1][col+0] = saturation_float( G_pixel_10);
//
  G_pixel_11 =   1.164*(Y[row+1][col+1] - 16.0)
               - 0.813*(Cr_temp[row+1][col+1] - 128.0)
               - 0.391*(Cb_temp[row+1][col+1] - 128.0);
  G[row+1][col+1] = saturation_float( G_pixel_11);

  B_pixel_00 =   1.164*(Y[row+0][col+0] - 16.0)
               + 2.018*(Cb_temp[row+0][col+0] - 128.0);
  B[row+0][col+0] = saturation_float( B_pixel_00);
//
  B_pixel_01 =   1.164*(Y[row+0][col+1] - 16.0)
               + 2.018*(Cb_temp[row+0][col+1] - 128.0);
  B[row+0][col+1] = saturation_float( B_pixel_01);
//
  B_pixel_10 =   1.164*(Y[row+1][col+0] - 16.0)
               + 2.018*(Cb_temp[row+1][col+0] - 128.0);
  B[row+1][col+0] = saturation_float( B_pixel_10);
//
  B_pixel_11 =   1.164*(Y[row+1][col+1] - 16.0)
               + 2.018*(Cb_temp[row+1][col+1] - 128.0);
  B[row+1][col+1] = saturation_float( B_pixel_11);
} // END of CSC_YCC_to_RGB_brute_force_float()

// =======
static uint8_t saturation_int( int argument) {
  if( argument > 255) { // saturation
    return( (uint8_t)255);
  }
  else if( argument < 0) {
    return( (uint8_t)0);
  }
  else {
    return( (uint8_t)argument);
  }
} // END of saturation_int()

 // =======

static void CSC_YCC_to_RGB_brute_force_int( int row, int col) {
    int Y_pixel[2][2], Cb_pixel[2][2], Cr_pixel[2][2];
    int R_pixel[2][2], G_pixel[2][2], B_pixel[2][2];

    // Upsample Cb and Cr into Cb_temp and Cr_temp
    //chrominance_array_upsample();

    // Group the operations to take advantage of cache locality
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            Y_pixel[i][j] = (int)Y[row+i][col+j] - 16;
            Cb_pixel[i][j] = (int)Cb_temp[row+i][col+j] - 128;
            Cr_pixel[i][j] = (int)Cr_temp[row+i][col+j] - 128;
        }
    }

    // Conversion for R pixels
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            R_pixel[i][j] = ((D1 * Y_pixel[i][j] + D2 * Cr_pixel[i][j]) + (1 << (K-1))) >> K;
            R[row+i][col+j] = saturation_int(R_pixel[i][j]);
        }
    }

    // Conversion for G pixels
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            G_pixel[i][j] = ((D1 * Y_pixel[i][j] - D3 * Cr_pixel[i][j] - D4 * Cb_pixel[i][j]) + (1 << (K-1))) >> K;
            G[row+i][col+j] = saturation_int(G_pixel[i][j]);
        }
    }

    // Conversion for B pixels
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            B_pixel[i][j] = ((D1 * Y_pixel[i][j] + D5 * Cb_pixel[i][j]) + (1 << (K-1))) >> K;
            B[row+i][col+j] = saturation_int(B_pixel[i][j]);
        }
    }
}


// =======
static void chrominance_upsample(
    uint8_t C_pixel_00, uint8_t C_pixel_01,
    uint8_t C_pixel_10, uint8_t C_pixel_11,
    uint8_t *top, uint8_t *left, uint8_t *middle) {

  switch (CHROMINANCE_UPSAMPLING_MODE) {
    case 0:
      *top = 0;
      *left = 0;
      *middle = 0;
      break;
    case 1:
      *top = *left = *middle = C_pixel_00;
      break;
    case 2:
      *top = (C_pixel_00 + C_pixel_01 + 1) >> 1;
      *left = (C_pixel_00 + C_pixel_10 + 1) >> 1;
      *middle = (C_pixel_00 + C_pixel_01 + C_pixel_10 + C_pixel_11 + 2) >> 2;
      break;
    default:
      break;
  }
}

static void chrominance_array_upsample(void) {
  int row, col;
  uint8_t top, left, middle;

  for(row=0; row < IMAGE_ROW_SIZE >> 1; row++) {
    for(col=0; col < IMAGE_COL_SIZE >> 1; col++) {
      uint8_t C_pixel_00 = Cb[row][col];
      uint8_t C_pixel_01 = col == (IMAGE_COL_SIZE >> 1) - 1 ? C_pixel_00 : Cb[row][col + 1];
      uint8_t C_pixel_10 = row == (IMAGE_ROW_SIZE >> 1) - 1 ? C_pixel_00 : Cb[row + 1][col];
      uint8_t C_pixel_11 = row == (IMAGE_ROW_SIZE >> 1) - 1 || col == (IMAGE_COL_SIZE >> 1) - 1 ? C_pixel_00 : Cb[row + 1][col + 1];

      chrominance_upsample(C_pixel_00, C_pixel_01, C_pixel_10, C_pixel_11, &top, &left, &middle);

      Cb_temp[row << 1][col << 1] = C_pixel_00;
      Cb_temp[row << 1][(col << 1) + 1] = top;
      Cb_temp[(row << 1) + 1][col << 1] = left;
      Cb_temp[(row << 1) + 1][(col << 1) + 1] = middle;

      C_pixel_00 = Cr[row][col];
      C_pixel_01 = col == (IMAGE_COL_SIZE >> 1) - 1 ? C_pixel_00 : Cr[row][col + 1];
      C_pixel_10 = row == (IMAGE_ROW_SIZE >> 1) - 1 ? C_pixel_00 : Cr[row + 1][col];
      C_pixel_11 = row == (IMAGE_ROW_SIZE >> 1) - 1 || col == (IMAGE_COL_SIZE >> 1) - 1 ? C_pixel_00 : Cr[row + 1][col + 1];

      chrominance_upsample(C_pixel_00, C_pixel_01, C_pixel_10, C_pixel_11, &top, &left, &middle);

      Cr_temp[row << 1][col << 1] = C_pixel_00;
      Cr_temp[row << 1][(col << 1) + 1] = top;
      Cr_temp[(row << 1) + 1][col << 1] = left;
      Cr_temp[(row << 1) + 1][(col << 1) + 1] = middle;
    }
  }
}


// =======
void CSC_YCC_to_RGB( void) {
  int row, col; // indices for row and column
  chrominance_array_upsample();
  for( row=0; row<IMAGE_ROW_SIZE; row+=2) {
    for( col=0; col<IMAGE_COL_SIZE; col+=2) { 
      switch (YCC_to_RGB_ROUTINE) {
        case 0:
          break;
        case 1:
           CSC_YCC_to_RGB_brute_force_float( row, col);
          break;
        case 2:
          CSC_YCC_to_RGB_brute_force_int( row, col);
          break;
        default:
          break;
      }
    }
  }

} // END of CSC_YCC_to_RGB()

