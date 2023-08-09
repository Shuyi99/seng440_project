from PIL import Image

def data_to_bmp(data_file, bmp_file, width, height):
    # Read raw pixel data from the .data file
    with open(data_file, 'rb') as f:
        raw_data = f.read()
    
    # Create an empty image with the desired dimensions
    img = Image.new('RGB', (width, height))
    pixels = img.load()
    
    # Fill the image with pixel data
    index = 0
    for y in range(height):
        for x in range(width):
            r = raw_data[index]
            g = raw_data[index + 1]
            b = raw_data[index + 2]
            pixels[x, y] = (r, g, b)
            index += 3
    
    # Save the constructed image as a BMP file
    img.save(bmp_file, 'BMP')

def main():
    # List all files in the current directory
    files_in_directory = [f for f in os.listdir() if os.path.isfile(f)]

    # Filter list to only .data files
    data_files = [file for file in files_in_directory if file.endswith(".data")]

    # Define the dimensions of the image. Adjust if needed.
    width = 64
    height = 48

    for data_file in data_files:
        bmp_file = data_file.replace(".data", ".bmp")
        data_to_bmp(data_file, bmp_file, width, height)
        print(f"Converted {data_file} to {bmp_file}")

if __name__ == "__main__":
    import os
    main()
