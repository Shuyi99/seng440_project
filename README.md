# SENG440 - Color Space Conversion

## Introduction

Welcome to out SENG440 Embedded Systems Final project. This repository contains code for converting between different color spaces. The code currently supports Y'PbPr, and Y'CbCr to RGB color space conversion.

## Project Goal

The aim of this project is to improve the efficiency of the existing color space conversion code. This might involve refining the algorithms used, optimizing resource usage, or implementing more efficient data structures. The goal is not only to make the conversions faster, but also to ensure they are accurate and reliable.

## To run this:
This project is designed to compile and run on arm system. the physical machine this project was running on is an ARM MAC computer. 

To generate assembly code, use command: gcc -S CSC_main.c CSC_RGB_to_YCC_01.c CSC_YCC_to_RGB_01.c 

To compile this program, use command: gcc CSC_main.c CSC_RGB_to_YCC_01.c CSC_YCC_to_RGB_01.c -o CSC.out

Input file of this program: image_input_RGB_640_480_01.data

Output file of this program: image_output_RGB_640_480_02.data

Check the .data files using GIMP, adjust the image size to: 640*480
