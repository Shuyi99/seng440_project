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
  chrominance_array_upsample();

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
    chrominance_array_upsample();

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

  int temp_top;
  int temp_left;
  int temp_middle;

  switch (CHROMINANCE_UPSAMPLING_MODE) {
    case 0:
      *top = 0;
      *left = 0;
      *middle = 0;
      break;
    case 1:
      *top = (uint8_t)C_pixel_00;
      *left = (uint8_t)C_pixel_00;
      *middle = (uint8_t)C_pixel_00;
      break;
    case 2:
      temp_top = (int)C_pixel_00 + (int)C_pixel_01;
      temp_top += (1 << 0); // rounding
      *top = (uint8_t)(temp_top >> 1);
//
      temp_left = (int)C_pixel_00 + (int)C_pixel_10;
      temp_left += (1 << 0); // rounding
      *left = (uint8_t)(temp_left >> 1);
//
      temp_middle = (int)C_pixel_00 + (int)C_pixel_01 + 
                    (int)C_pixel_10 + (int)C_pixel_11;
      temp_middle += (1 << 1); // rounding
      *middle = (uint8_t)(temp_middle >> 2);
      break;
    default:
      break;
  }
} // END of chrominance_upsample()

// =======

static void chrominance_array_upsample( void) {
    int row, col;
    uint8_t top, left, middle;
    uint8_t current_Cb, next_Cb, bottom_Cb, bottom_next_Cb;
    uint8_t current_Cr, next_Cr, bottom_Cr, bottom_next_Cr;

    for( row=0; row<((IMAGE_ROW_SIZE>>1)-1); row+=1) {
        for( col=0; col<((IMAGE_COL_SIZE>>1)-1); col+=1) {
            // Fetch values in advance
            current_Cb = Cb[row][col];
            next_Cb = Cb[row][col+1];
            bottom_Cb = Cb[row+1][col];
            bottom_next_Cb = Cb[row+1][col+1];
            
            current_Cr = Cr[row][col];
            next_Cr = Cr[row][col+1];
            bottom_Cr = Cr[row+1][col];
            bottom_next_Cr = Cr[row+1][col+1];

            // Processing for Cb
            chrominance_upsample(current_Cb, next_Cb, bottom_Cb, bottom_next_Cb, &top, &left, &middle);
            Cb_temp[(row<<1)+0][(col<<1)+0] = current_Cb;
            Cb_temp[(row<<1)+0][(col<<1)+1] = top;
            Cb_temp[(row<<1)+1][(col<<1)+0] = left;
            Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
            
            // Processing for Cr
            chrominance_upsample(current_Cr, next_Cr, bottom_Cr, bottom_next_Cr, &top, &left, &middle);
            Cr_temp[(row<<1)+0][(col<<1)+0] = current_Cr;
            Cr_temp[(row<<1)+0][(col<<1)+1] = top;
            Cr_temp[(row<<1)+1][(col<<1)+0] = left;
            Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
        }
    }

    // Boundary handling for the rightmost column
    col = (IMAGE_COL_SIZE>>1) - 1;
    for( row=0; row<((IMAGE_ROW_SIZE>>1)-1); row+=1) {
        chrominance_upsample( Cb[row+0][col], Cb[row+0][col],
                              Cb[row+1][col], Cb[row+1][col],
                              &top, &left, &middle);
        Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row+0][col];
        Cb_temp[(row<<1)+0][(col<<1)+1] = top;
        Cb_temp[(row<<1)+1][(col<<1)+0] = left;
        Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
        
        chrominance_upsample( Cr[row+0][col], Cr[row+0][col],
                              Cr[row+1][col], Cr[row+1][col],
                              &top, &left, &middle);
        Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row+0][col];
        Cr_temp[(row<<1)+0][(col<<1)+1] = top;
        Cr_temp[(row<<1)+1][(col<<1)+0] = left;
        Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
    }

    // Boundary handling for the bottommost row
    row = (IMAGE_ROW_SIZE>>1) - 1;
    for( col=0; col<((IMAGE_COL_SIZE>>1)-1); col+=1) {
        chrominance_upsample( Cb[row][col+0], Cb[row][col+1],
                              Cb[row][col+0], Cb[row][col+1],
                              &top, &left, &middle);
        Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row][col+0];
        Cb_temp[(row<<1)+0][(col<<1)+1] = top;
        Cb_temp[(row<<1)+1][(col<<1)+0] = left;
        Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
        
        chrominance_upsample( Cr[row][col+0], Cr[row][col+1],
                              Cr[row][col+0], Cr[row][col+1],
                              &top, &left, &middle);
        Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row][col+0];
        Cr_temp[(row<<1)+0][(col<<1)+1] = top;
        Cr_temp[(row<<1)+1][(col<<1)+0] = left;
        Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
    }
    
    // Last pixel (bottom-right corner)
    row = (IMAGE_ROW_SIZE>>1) - 1;
    col = (IMAGE_COL_SIZE>>1) - 1;
    Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row][col];
    Cb_temp[(row<<1)+0][(col<<1)+1] = Cb[row][col];
    Cb_temp[(row<<1)+1][(col<<1)+0] = Cb[row][col];
    Cb_temp[(row<<1)+1][(col<<1)+1] = Cb[row][col];
    
    Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row][col];
    Cr_temp[(row<<1)+0][(col<<1)+1] = Cr[row][col];
    Cr_temp[(row<<1)+1][(col<<1)+0] = Cr[row][col];
    Cr_temp[(row<<1)+1][(col<<1)+1] = Cr[row][col];
}
// -------





// =======
void CSC_YCC_to_RGB( void) {
  int row, col; // indices for row and column
//
  for( row=0; row<IMAGE_ROW_SIZE; row+=2) {
    for( col=0; col<IMAGE_COL_SIZE; col+=2) { 
      //printf( "\n[row,col] = [%02i,%02i]\n\n", row, col);
      switch (YCC_to_RGB_ROUTINE) {
        case 0:
          break;
        case 1:
           CSC_YCC_to_RGB_brute_force_float( row, col);
          
          break;
        case 2:
          CSC_YCC_to_RGB_brute_force_int( row, col);
          //printf( "here");
          break;
        default:
          break;
      }
//      printf( "Luma_00  = %02hhx\n", Y[row+0][col+0]);
//      printf( "Luma_01  = %02hhx\n", Y[row+0][col+1]);
//      printf( "Luma_10  = %02hhx\n", Y[row+1][col+0]);
//      printf( "Luma_11  = %02hhx\n\n", Y[row+1][col+1]);
    }
  }

} // END of CSC_YCC_to_RGB()

