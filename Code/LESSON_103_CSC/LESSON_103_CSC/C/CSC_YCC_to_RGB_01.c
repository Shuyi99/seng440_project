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
// static uint8_t saturation_float( float argument);
// static void CSC_YCC_to_RGB_brute_force_float( int row, int col);

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
// static uint8_t saturation_float( float argument) {
//   if( argument > 255.0) { // saturation
//     return( (uint8_t)255);
//   }
//   else if( argument < 0.0) {
//     return( (uint8_t)0);
//   }
//   else {
//     return( (uint8_t)argument);
//   }
// } // END of saturation_float()

// // =======
// static void CSC_YCC_to_RGB_brute_force_float( int row, int col) {
// //
//   float R_pixel_00, R_pixel_01, R_pixel_10, R_pixel_11;
//   float G_pixel_00, G_pixel_01, G_pixel_10, G_pixel_11;
//   float B_pixel_00, B_pixel_01, B_pixel_10, B_pixel_11;

//   // Upsample Cb and Cr into Cb_temp and Cr_temp
//   chrominance_array_upsample();

//   R_pixel_00 =   1.164*(Y[row+0][col+0] - 16.0)
//                + 1.596*(Cr_temp[row+0][col+0] - 128.0);
//   R[row+0][col+0] = saturation_float( R_pixel_00);
// //
//   R_pixel_01 =   1.164*(Y[row+0][col+1] - 16.0)
//                + 1.596*(Cr_temp[row+0][col+1] - 128.0);
//   R[row+0][col+1] = saturation_float( R_pixel_01);
// //
//   R_pixel_10 =   1.164*(Y[row+1][col+0] - 16.0)
//                + 1.596*(Cr_temp[row+1][col+0] - 128.0);
//   R[row+1][col+0] = saturation_float( R_pixel_10);
// //
//   R_pixel_11 =   1.164*(Y[row+1][col+1] - 16.0)
//                + 1.596*(Cr_temp[row+1][col+1] - 128.0);
//   R[row+1][col+1] = saturation_float( R_pixel_11);

//   G_pixel_00 =   1.164*(Y[row+0][col+0] - 16.0)
//                - 0.813*(Cr_temp[row+0][col+0] - 128.0)
//                - 0.391*(Cb_temp[row+0][col+0] - 128.0);
//   G[row+0][col+0] = saturation_float( G_pixel_00);
// //
//   G_pixel_01 =   1.164*(Y[row+0][col+1] - 16.0)
//                - 0.813*(Cr_temp[row+0][col+1] - 128.0)
//                - 0.391*(Cb_temp[row+0][col+1] - 128.0);
//   G[row+0][col+1] = saturation_float( G_pixel_01);
// //
//   G_pixel_10 =   1.164*(Y[row+1][col+0] - 16.0)
//                - 0.813*(Cr_temp[row+1][col+0] - 128.0)
//                - 0.391*(Cb_temp[row+1][col+0] - 128.0);
//   G[row+1][col+0] = saturation_float( G_pixel_10);
// //
//   G_pixel_11 =   1.164*(Y[row+1][col+1] - 16.0)
//                - 0.813*(Cr_temp[row+1][col+1] - 128.0)
//                - 0.391*(Cb_temp[row+1][col+1] - 128.0);
//   G[row+1][col+1] = saturation_float( G_pixel_11);

//   B_pixel_00 =   1.164*(Y[row+0][col+0] - 16.0)
//                + 2.018*(Cb_temp[row+0][col+0] - 128.0);
//   B[row+0][col+0] = saturation_float( B_pixel_00);
// //
//   B_pixel_01 =   1.164*(Y[row+0][col+1] - 16.0)
//                + 2.018*(Cb_temp[row+0][col+1] - 128.0);
//   B[row+0][col+1] = saturation_float( B_pixel_01);
// //
//   B_pixel_10 =   1.164*(Y[row+1][col+0] - 16.0)
//                + 2.018*(Cb_temp[row+1][col+0] - 128.0);
//   B[row+1][col+0] = saturation_float( B_pixel_10);
// //
//   B_pixel_11 =   1.164*(Y[row+1][col+1] - 16.0)
//                + 2.018*(Cb_temp[row+1][col+1] - 128.0);
//   B[row+1][col+1] = saturation_float( B_pixel_11);
// } // END of CSC_YCC_to_RGB_brute_force_float()

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

// // =======
// static void CSC_YCC_to_RGB_brute_force_int( int row, int col) {
// //
//   int R_pixel_00, R_pixel_01, R_pixel_10, R_pixel_11;
//   int G_pixel_00, G_pixel_01, G_pixel_10, G_pixel_11;
//   int B_pixel_00, B_pixel_01, B_pixel_10, B_pixel_11;

//   int  Y_pixel_00,  Y_pixel_01,  Y_pixel_10,  Y_pixel_11;
//   int Cb_pixel_00, Cb_pixel_01, Cb_pixel_10, Cb_pixel_11;
//   int Cr_pixel_00, Cr_pixel_01, Cr_pixel_10, Cr_pixel_11;

//   // Upsample Cb and Cr into Cb_temp and Cr_temp
//   chrominance_array_upsample();

//   Y_pixel_00 = (int)Y[row+0][col+0];
//   Y_pixel_01 = (int)Y[row+0][col+1];
//   Y_pixel_10 = (int)Y[row+1][col+0];
//   Y_pixel_11 = (int)Y[row+1][col+1];

//   Cb_pixel_00 = (int)Cb_temp[row+0][col+0];
//   Cb_pixel_01 = (int)Cb_temp[row+0][col+1];
//   Cb_pixel_10 = (int)Cb_temp[row+1][col+0];
//   Cb_pixel_11 = (int)Cb_temp[row+1][col+1];

//   Cr_pixel_00 = (int)Cr_temp[row+0][col+0];
//   Cr_pixel_01 = (int)Cr_temp[row+0][col+1];
//   Cr_pixel_10 = (int)Cr_temp[row+1][col+0];
//   Cr_pixel_11 = (int)Cr_temp[row+1][col+1];

//   Y_pixel_00 = Y_pixel_00 - 16;
//   Y_pixel_01 = Y_pixel_01 - 16;
//   Y_pixel_10 = Y_pixel_10 - 16;
//   Y_pixel_11 = Y_pixel_11 - 16;

//   Cb_pixel_00 = Cb_pixel_00 - 128;
//   Cb_pixel_01 = Cb_pixel_01 - 128;
//   Cb_pixel_10 = Cb_pixel_10 - 128;
//   Cb_pixel_11 = Cb_pixel_11 - 128;

//   Cr_pixel_00 = Cr_pixel_00 - 128;
//   Cr_pixel_01 = Cr_pixel_01 - 128;
//   Cr_pixel_10 = Cr_pixel_10 - 128;
//   Cr_pixel_11 = Cr_pixel_11 - 128;

//   R_pixel_00 = ((D1 * Y_pixel_00 + D2 * Cr_pixel_00) + (1 << (K-1))) >> K;
//   R[row+0][col+0] = saturation_int(R_pixel_00);

//   R_pixel_01 = ((D1 * Y_pixel_01 + D2 * Cr_pixel_01) + (1 << (K-1))) >> K;
//   R[row+0][col+1] = saturation_int(R_pixel_01);

//   R_pixel_10 = ((D1 * Y_pixel_10 + D2 * Cr_pixel_10) + (1 << (K-1))) >> K;
//   R[row+1][col+0] = saturation_int(R_pixel_10);

//   R_pixel_11 = ((D1 * Y_pixel_11 + D2 * Cr_pixel_11) + (1 << (K-1))) >> K;
//   R[row+1][col+1] = saturation_int(R_pixel_11);

//   // Conversion for G pixels
//   G_pixel_00 = ((D1 * Y_pixel_00 - D3 * Cr_pixel_00 - D4 * Cb_pixel_00) + (1 << (K-1))) >> K;
//   G[row+0][col+0] = saturation_int(G_pixel_00);

//   G_pixel_01 = ((D1 * Y_pixel_01 - D3 * Cr_pixel_01 - D4 * Cb_pixel_01) + (1 << (K-1))) >> K;
//   G[row+0][col+1] = saturation_int(G_pixel_01);

//   G_pixel_10 = ((D1 * Y_pixel_10 - D3 * Cr_pixel_10 - D4 * Cb_pixel_10) + (1 << (K-1))) >> K;
//   G[row+1][col+0] = saturation_int(G_pixel_10);

//   G_pixel_11 = ((D1 * Y_pixel_11 - D3 * Cr_pixel_11 - D4 * Cb_pixel_11) + (1 << (K-1))) >> K;
//   G[row+1][col+1] = saturation_int(G_pixel_11);

//   // Conversion for B pixels
//   B_pixel_00 = ((D1 * Y_pixel_00 + D5 * Cb_pixel_00) + (1 << (K-1))) >> K;
//   B[row+0][col+0] = saturation_int(B_pixel_00);

//   B_pixel_01 = ((D1 * Y_pixel_01 + D5 * Cb_pixel_01) + (1 << (K-1))) >> K;
//   B[row+0][col+1] = saturation_int(B_pixel_01);

//   B_pixel_10 = ((D1 * Y_pixel_10 + D5 * Cb_pixel_10) + (1 << (K-1))) >> K;
//   B[row+1][col+0] = saturation_int(B_pixel_10);

//   B_pixel_11 = ((D1 * Y_pixel_11 + D5 * Cb_pixel_11) + (1 << (K-1))) >> K;
//   B[row+1][col+1] = saturation_int(B_pixel_11);
// } // END of CSC_YCC_to_RGB_brute_force_int()

//---------------------------------------------------------------------

static void CSC_YCC_to_RGB_brute_force_int( int row, int col) {

  int Y_offset = 16;
  int Chroma_offset = 128;

  // Upsample Cb and Cr into Cb_temp and Cr_temp
  chrominance_array_upsample();

  // Pre-calculate common values for Y, Cb and Cr
  int Y_values[2][2] = {
    { (int)Y[row+0][col+0] - Y_offset, (int)Y[row+0][col+1] - Y_offset },
    { (int)Y[row+1][col+0] - Y_offset, (int)Y[row+1][col+1] - Y_offset }
  };

  int Cb_values[2][2] = {
    { (int)Cb_temp[row+0][col+0] - Chroma_offset, (int)Cb_temp[row+0][col+1] - Chroma_offset },
    { (int)Cb_temp[row+1][col+0] - Chroma_offset, (int)Cb_temp[row+1][col+1] - Chroma_offset }
  };

  int Cr_values[2][2] = {
    { (int)Cr_temp[row+0][col+0] - Chroma_offset, (int)Cr_temp[row+0][col+1] - Chroma_offset },
    { (int)Cr_temp[row+1][col+0] - Chroma_offset, (int)Cr_temp[row+1][col+1] - Chroma_offset }
  };

  // Loop to simplify and eliminate redundancy
  for (int i = 0; i < 2; ++i) {
    for (int j = 0; j < 2; ++j) {
      R[row+i][col+j] = saturation_int(((D1 * Y_values[i][j] + D2 * Cr_values[i][j]) + (1 << (K-1))) >> K);
      G[row+i][col+j] = saturation_int(((D1 * Y_values[i][j] - D3 * Cr_values[i][j] - D4 * Cb_values[i][j]) + (1 << (K-1))) >> K);
      B[row+i][col+j] = saturation_int(((D1 * Y_values[i][j] + D5 * Cb_values[i][j]) + (1 << (K-1))) >> K);
    }
  }

} // END of CSC_YCC_to_RGB_brute_force_int()

// static void CSC_YCC_to_RGB_brute_force_int( int row, int col) {

//     int Y_offset = 16;
//     int Chroma_offset = 128;
  
//     // Upsample Cb and Cr into Cb_temp and Cr_temp
//     chrominance_array_upsample();

//     // Pre-calculate common values for Y, Cb, and Cr
//     int Y_values[2][2] = {
//         { (int)Y[row+0][col+0] - Y_offset, (int)Y[row+0][col+1] - Y_offset },
//         { (int)Y[row+1][col+0] - Y_offset, (int)Y[row+1][col+1] - Y_offset }
//     };

//     int Cb_values[2][2] = {
//         { (int)Cb_temp[row+0][col+0] - Chroma_offset, (int)Cb_temp[row+0][col+1] - Chroma_offset },
//         { (int)Cb_temp[row+1][col+0] - Chroma_offset, (int)Cb_temp[row+1][col+1] - Chroma_offset }
//     };

//     int Cr_values[2][2] = {
//         { (int)Cr_temp[row+0][col+0] - Chroma_offset, (int)Cr_temp[row+0][col+1] - Chroma_offset },
//         { (int)Cr_temp[row+1][col+0] - Chroma_offset, (int)Cr_temp[row+1][col+1] - Chroma_offset }
//     };

//     // Loop unrolling
//     for(int i = 0; i < 2; ++i) {
//         for(int j = 0; j < 2; ++j) {

//             int Y_val = D1 * Y_values[i][j];
//             int Cb_val = Cb_values[i][j];
//             int Cr_val = Cr_values[i][j];
            
//             // Compute RGB values
//             int R_pixel = (Y_val + D2 * Cr_val + (1 << (K-1))) >> K;
//             int G_pixel = (Y_val - D3 * Cr_val - D4 * Cb_val + (1 << (K-1))) >> K;
//             int B_pixel = (Y_val + D5 * Cb_val + (1 << (K-1))) >> K;
            
//             // Store results
//             R[row+i][col+j] = saturation_int(R_pixel);
//             G[row+i][col+j] = saturation_int(G_pixel);
//             B[row+i][col+j] = saturation_int(B_pixel);
//         }
//     }
// }

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
// static void chrominance_array_upsample( void) {
//   int row, col;

//   uint8_t top;
//   uint8_t left;
//   uint8_t middle;

//   for( row=0; row<((IMAGE_ROW_SIZE>>1)-1); row+=1) {
//     for( col=0; col<((IMAGE_COL_SIZE>>1)-1); col+=1) { 
//       chrominance_upsample( Cb[row+0][col+0], Cb[row+0][col+1],
//                             Cb[row+1][col+0], Cb[row+1][col+1],
//                             &top, &left, &middle);
//       Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row+0][col+0];
//       Cb_temp[(row<<1)+0][(col<<1)+1] = top;
//       Cb_temp[(row<<1)+1][(col<<1)+0] = left;
//       Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
//       //
//       chrominance_upsample( Cr[row+0][col+0], Cr[row+0][col+1],
//                             Cr[row+1][col+0], Cr[row+1][col+1],
//                             &top, &left, &middle);
//       Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row+0][col+0];
//       Cr_temp[(row<<1)+0][(col<<1)+1] = top;
//       Cr_temp[(row<<1)+1][(col<<1)+0] = left;
//       Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
//     }
//   }

//   col = (IMAGE_COL_SIZE>>1) - 1;
//   for( row=0; row<((IMAGE_ROW_SIZE>>1)-1); row+=1) {
//     chrominance_upsample( Cb[row+0][col], Cb[row+0][col],
//                           Cb[row+1][col], Cb[row+1][col],
//                           &top, &left, &middle);
//     Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row+0][col];
//     Cb_temp[(row<<1)+0][(col<<1)+1] = top;
//     Cb_temp[(row<<1)+1][(col<<1)+0] = left;
//     Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
//     //
//     chrominance_upsample( Cr[row+0][col], Cr[row+0][col],
//                           Cr[row+1][col], Cr[row+1][col],
//                           &top, &left, &middle);
//     Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row+0][col];
//     Cr_temp[(row<<1)+0][(col<<1)+1] = top;
//     Cr_temp[(row<<1)+1][(col<<1)+0] = left;
//     Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
//   }

//   row = (IMAGE_ROW_SIZE>>1) - 1;
//   for( col=0; row<((IMAGE_COL_SIZE>>1)-1); col+=1) {
//     chrominance_upsample( Cb[row][col+0], Cb[row][col+1],
//                           Cb[row][col+0], Cb[row][col+1],
//                           &top, &left, &middle);
//     Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row][col+0];
//     Cb_temp[(row<<1)+0][(col<<1)+1] = top;
//     Cb_temp[(row<<1)+1][(col<<1)+0] = left;
//     Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
//     //
//     chrominance_upsample( Cr[row][col+0], Cr[row][col+1],
//                           Cr[row][col+0], Cr[row][col+1],
//                           &top, &left, &middle);
//     Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row][col+0];
//     Cr_temp[(row<<1)+0][(col<<1)+1] = top;
//     Cr_temp[(row<<1)+1][(col<<1)+0] = left;
//     Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
//   }

//   row = (IMAGE_ROW_SIZE>>1) - 1;
//   col = (IMAGE_COL_SIZE>>1) - 1;
//   Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row][col];
//   Cb_temp[(row<<1)+0][(col<<1)+1] = Cb[row][col];
//   Cb_temp[(row<<1)+1][(col<<1)+0] = Cb[row][col];
//   Cb_temp[(row<<1)+1][(col<<1)+1] = Cb[row][col];
//   //
//   Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row][col];
//   Cr_temp[(row<<1)+0][(col<<1)+1] = Cr[row][col];
//   Cr_temp[(row<<1)+1][(col<<1)+0] = Cr[row][col];
//   Cr_temp[(row<<1)+1][(col<<1)+1] = Cr[row][col];

// } // END of chrominance_array_upsample()

static void chrominance_array_upsample( void) {
    int row, col;

    uint8_t top;
    uint8_t left;
    uint8_t middle;

    for( row = 0; row < ((IMAGE_ROW_SIZE >> 1) - 1); row++) {
        for( col = 0; col < ((IMAGE_COL_SIZE >> 1) - 2); col+=2) { 
            // Process for Cb
            chrominance_upsample( Cb[row][col], Cb[row][col+1],
                                  Cb[row+1][col], Cb[row+1][col+1],
                                  &top, &left, &middle);

            int r_shifted = row << 1;
            int c_shifted = col << 1;

            Cb_temp[r_shifted][c_shifted] = Cb[row][col];
            Cb_temp[r_shifted][c_shifted + 1] = top;
            Cb_temp[r_shifted + 1][c_shifted] = left;
            Cb_temp[r_shifted + 1][c_shifted + 1] = middle;

            // Process for next column
            chrominance_upsample( Cb[row][col+1], Cb[row][col+2],
                                  Cb[row+1][col+1], Cb[row+1][col+2],
                                  &top, &left, &middle);

            Cb_temp[r_shifted][c_shifted + 2] = Cb[row][col+1];
            Cb_temp[r_shifted][c_shifted + 3] = top;
            Cb_temp[r_shifted + 1][c_shifted + 2] = left;
            Cb_temp[r_shifted + 1][c_shifted + 3] = middle;

            // Process for Cr
            chrominance_upsample( Cr[row][col], Cr[row][col+1],
                                  Cr[row+1][col], Cr[row+1][col+1],
                                  &top, &left, &middle);

            Cr_temp[r_shifted][c_shifted] = Cr[row][col];
            Cr_temp[r_shifted][c_shifted + 1] = top;
            Cr_temp[r_shifted + 1][c_shifted] = left;
            Cr_temp[r_shifted + 1][c_shifted + 1] = middle;

            // Process for next column
            chrominance_upsample( Cr[row][col+1], Cr[row][col+2],
                                  Cr[row+1][col+1], Cr[row+1][col+2],
                                  &top, &left, &middle);

            Cr_temp[r_shifted][c_shifted + 2] = Cr[row][col+1];
            Cr_temp[r_shifted][c_shifted + 3] = top;
            Cr_temp[r_shifted + 1][c_shifted + 2] = left;
            Cr_temp[r_shifted + 1][c_shifted + 3] = middle;
        }
    }
}



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
        //   CSC_YCC_to_RGB_brute_force_float( row, col);
          
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

