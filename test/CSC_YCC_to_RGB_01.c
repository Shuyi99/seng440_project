// Copyright 2023 Mihai SIMA (mihai.sima@ieee.org).  All rights reserved.
// Color Space Conversion (CSC) in fixed-point arithmetic
// YCC to RGB conversion

//#include <stdio.h>
#include <stdint.h>
#include "CSC_global.h"
#include <stdio.h>
#include <arm_neon.h>

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


// static void CSC_YCC_to_RGB_brute_force_int( int row, int col) {

//   int Y_offset = 16;
//   int Chroma_offset = 128;

//   // Upsample Cb and Cr into Cb_temp and Cr_temp
//   chrominance_array_upsample();

//   // Pre-calculate common values for Y, Cb and Cr
//   int Y_values[2][2] = {
//     { (int)Y[row+0][col+0] - Y_offset, (int)Y[row+0][col+1] - Y_offset },
//     { (int)Y[row+1][col+0] - Y_offset, (int)Y[row+1][col+1] - Y_offset }
//   };

//   int Cb_values[2][2] = {
//     { (int)Cb_temp[row+0][col+0] - Chroma_offset, (int)Cb_temp[row+0][col+1] - Chroma_offset },
//     { (int)Cb_temp[row+1][col+0] - Chroma_offset, (int)Cb_temp[row+1][col+1] - Chroma_offset }
//   };

//   int Cr_values[2][2] = {
//     { (int)Cr_temp[row+0][col+0] - Chroma_offset, (int)Cr_temp[row+0][col+1] - Chroma_offset },
//     { (int)Cr_temp[row+1][col+0] - Chroma_offset, (int)Cr_temp[row+1][col+1] - Chroma_offset }
//   };

//   // Loop to simplify and eliminate redundancy
//   for (int i = 0; i < 2; ++i) {
//     for (int j = 0; j < 2; ++j) {
//       R[row+i][col+j] = saturation_int(((D1 * Y_values[i][j] + D2 * Cr_values[i][j]) + (1 << (K-1))) >> K);
//       G[row+i][col+j] = saturation_int(((D1 * Y_values[i][j] - D3 * Cr_values[i][j] - D4 * Cb_values[i][j]) + (1 << (K-1))) >> K);
//       B[row+i][col+j] = saturation_int(((D1 * Y_values[i][j] + D5 * Cb_values[i][j]) + (1 << (K-1))) >> K);
//     }
//   }

// } // END of CSC_YCC_to_RGB_brute_force_int()

int16x8_t bilinear_upsample_neon(int row, int col, uint8_t chroma[IMAGE_ROW_SIZE][IMAGE_COL_SIZE]);
static void CSC_YCC_to_RGB_brute_force_int(int row, int col) {
    // Constants for offsets and coefficients
    //   // Upsample Cb and Cr into Cb_temp and Cr_temp
    //chrominance_array_upsample();

    int16x8_t Y_offset_vec = vdupq_n_s16(16);
    int16x8_t Chroma_offset_vec = vdupq_n_s16(128);
    int16x8_t D1_vec = vdupq_n_s16(D1);
    int16x8_t D2_vec = vdupq_n_s16(D2);
    int16x8_t D3_vec = vdupq_n_s16(D3);
    int16x8_t D4_vec = vdupq_n_s16(D4);
    int16x8_t D5_vec = vdupq_n_s16(D5);
    int16x8_t shift_value_vec = vdupq_n_s16(1 << (K - 1));
    int16x8_t min_val = vdupq_n_s16(0);
    int16x8_t max_val = vdupq_n_s16(255);

    // Load 8-bit data into NEON registers and convert to 16-bit
    // int16x8_t y_values = vmovl_u8(vld1_u8(&Y[row][col]));
    // int16x8_t cb_values = vmovl_u8(vld1_u8(&Cb_temp[row][col]));
    // int16x8_t cr_values = vmovl_u8(vld1_u8(&Cr_temp[row][col]));
        // Load 8-bit data into NEON registers and convert to 16-bit
    uint8_t Cb[IMAGE_ROW_SIZE][IMAGE_COL_SIZE];
    uint8_t Cr[IMAGE_ROW_SIZE][IMAGE_COL_SIZE];
    int16x8_t y_values = vmovl_u8(vld1_u8(&Y[row][col]));

    // Upsample chrominance values using NEON bilinear interpolation
    int16x8_t cb_values = bilinear_upsample_neon(row, col, Cb);
    int16x8_t cr_values = bilinear_upsample_neon(row, col, Cr);

    // Adjust Y, Cb, Cr values with the offsets
    y_values = vsubq_s16(y_values, Y_offset_vec);
    cb_values = vsubq_s16(cb_values, Chroma_offset_vec);  // Cb and Cr are subtracted by 128
    cr_values = vsubq_s16(cr_values, Chroma_offset_vec);

    // Perform YCC to RGB conversion for R, G, B channels using NEON intrinsics
    int16x8_t r_values = vaddq_s16(vmulq_s16(y_values, D1_vec), vmulq_s16(cr_values, D2_vec));
    int16x8_t g_values = vsubq_s16(vsubq_s16(vmulq_s16(y_values, D1_vec), vmulq_s16(cr_values, D3_vec)), 
                                  vmulq_s16(cb_values, D4_vec));
    int16x8_t b_values = vaddq_s16(vmulq_s16(y_values, D1_vec), vmulq_s16(cb_values, D5_vec));

    // Add the shift value and right shift by K bits to finalize fixed-point arithmetic
    r_values = vshrq_n_s16(vaddq_s16(r_values, shift_value_vec), K);
    g_values = vshrq_n_s16(vaddq_s16(g_values, shift_value_vec), K);
    b_values = vshrq_n_s16(vaddq_s16(b_values, shift_value_vec), K);

        // Clamping values between 0 and 255
    r_values = vmaxq_s16(min_val, vminq_s16(r_values, max_val));
    g_values = vmaxq_s16(min_val, vminq_s16(g_values, max_val));
    b_values = vmaxq_s16(min_val, vminq_s16(b_values, max_val));

    // Convert 16-bit results back to 8-bit and store them
    vst1_u8(&R[row][col], vmovn_u16(vreinterpretq_u16_s16(r_values)));
    vst1_u8(&G[row][col], vmovn_u16(vreinterpretq_u16_s16(g_values)));
    vst1_u8(&B[row][col], vmovn_u16(vreinterpretq_u16_s16(b_values)));
}
    int16x8_t bilinear_upsample_neon(int row, int col, uint8_t chroma[IMAGE_ROW_SIZE][IMAGE_COL_SIZE]) {
    uint8_t C00 = chroma[row >> 1][col >> 1];
    uint8_t C01 = chroma[row >> 1][(col >> 1) + 1];
    uint8_t C10 = chroma[(row >> 1) + 1][col >> 1];
    uint8_t C111 = chroma[(row >> 1) + 1][(col >> 1) + 1];

    // Calculate bilinear interpolated value using SIMD
    int16x8_t value = vdupq_n_s16(C00);
    value = vaddq_s16(value, vmulq_n_s16(vsubq_s16(vdupq_n_s16(C01), value), (col & 1)));
    value = vaddq_s16(value, vmulq_n_s16(vsubq_s16(vdupq_n_s16(C10), value), (row & 1)));
    value = vaddq_s16(value, vmulq_n_s16(vsubq_s16(vsubq_s16(vdupq_n_s16(C111), vdupq_n_s16(C01)), vsubq_s16(vdupq_n_s16(C10), vdupq_n_s16(C00))), (row & 1) * (col & 1)));

    return value;
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

  uint8_t top;
  uint8_t left;
  uint8_t middle;

  for( row=0; row<((IMAGE_ROW_SIZE>>1)-1); row+=1) {
    for( col=0; col<((IMAGE_COL_SIZE>>1)-1); col+=1) { 
      chrominance_upsample( Cb[row+0][col+0], Cb[row+0][col+1],
                            Cb[row+1][col+0], Cb[row+1][col+1],
                            &top, &left, &middle);
      Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row+0][col+0];
      Cb_temp[(row<<1)+0][(col<<1)+1] = top;
      Cb_temp[(row<<1)+1][(col<<1)+0] = left;
      Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
      //
      chrominance_upsample( Cr[row+0][col+0], Cr[row+0][col+1],
                            Cr[row+1][col+0], Cr[row+1][col+1],
                            &top, &left, &middle);
      Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row+0][col+0];
      Cr_temp[(row<<1)+0][(col<<1)+1] = top;
      Cr_temp[(row<<1)+1][(col<<1)+0] = left;
      Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
    }
  }

  col = (IMAGE_COL_SIZE>>1) - 1;
  for( row=0; row<((IMAGE_ROW_SIZE>>1)-1); row+=1) {
    chrominance_upsample( Cb[row+0][col], Cb[row+0][col],
                          Cb[row+1][col], Cb[row+1][col],
                          &top, &left, &middle);
    Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row+0][col];
    Cb_temp[(row<<1)+0][(col<<1)+1] = top;
    Cb_temp[(row<<1)+1][(col<<1)+0] = left;
    Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
    //
    chrominance_upsample( Cr[row+0][col], Cr[row+0][col],
                          Cr[row+1][col], Cr[row+1][col],
                          &top, &left, &middle);
    Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row+0][col];
    Cr_temp[(row<<1)+0][(col<<1)+1] = top;
    Cr_temp[(row<<1)+1][(col<<1)+0] = left;
    Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
  }

  row = (IMAGE_ROW_SIZE>>1) - 1;
  for( col=0; row<((IMAGE_COL_SIZE>>1)-1); col+=1) {
    chrominance_upsample( Cb[row][col+0], Cb[row][col+1],
                          Cb[row][col+0], Cb[row][col+1],
                          &top, &left, &middle);
    Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row][col+0];
    Cb_temp[(row<<1)+0][(col<<1)+1] = top;
    Cb_temp[(row<<1)+1][(col<<1)+0] = left;
    Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
    //
    chrominance_upsample( Cr[row][col+0], Cr[row][col+1],
                          Cr[row][col+0], Cr[row][col+1],
                          &top, &left, &middle);
    Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row][col+0];
    Cr_temp[(row<<1)+0][(col<<1)+1] = top;
    Cr_temp[(row<<1)+1][(col<<1)+0] = left;
    Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
  }

  row = (IMAGE_ROW_SIZE>>1) - 1;
  col = (IMAGE_COL_SIZE>>1) - 1;
  Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row][col];
  Cb_temp[(row<<1)+0][(col<<1)+1] = Cb[row][col];
  Cb_temp[(row<<1)+1][(col<<1)+0] = Cb[row][col];
  Cb_temp[(row<<1)+1][(col<<1)+1] = Cb[row][col];
  //
  Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row][col];
  Cr_temp[(row<<1)+0][(col<<1)+1] = Cr[row][col];
  Cr_temp[(row<<1)+1][(col<<1)+0] = Cr[row][col];
  Cr_temp[(row<<1)+1][(col<<1)+1] = Cr[row][col];

} // END of chrominance_array_upsample()
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

