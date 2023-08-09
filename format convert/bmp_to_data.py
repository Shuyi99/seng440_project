from PIL import Image

def bmp_to_data(bmp_file, data_file):
    # Load the image using PIL
    img = Image.open(bmp_file)
    
    # Ensure the image is in RGB format
    img_rgb = img.convert('RGB')
    
    # Write raw pixel data to a binary file
    with open(data_file, 'wb') as f:
        for y in range(img_rgb.height):
            for x in range(img_rgb.width):
                r, g, b = img_rgb.getpixel((x, y))
                f.write(bytes([r, g, b]))

def main():
    # List all files in the current directory
    files_in_directory = [f for f in os.listdir() if os.path.isfile(f)]

    # Filter list to only BMP files
    bmp_files = [file for file in files_in_directory if file.endswith(".bmp")]

    for bmp_file in bmp_files:
        data_file = bmp_file.replace(".bmp", ".data")
        bmp_to_data(bmp_file, data_file)
        print(f"Converted {bmp_file} to {data_file}")

if __name__ == "__main__":
    import os
    main()
