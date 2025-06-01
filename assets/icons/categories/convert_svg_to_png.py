import os
import cairosvg

PNG_WIDTH  = 48
PNG_HEIGHT = 48

def convert_svg_to_png(svg_path, png_path, width=PNG_WIDTH, height=PNG_HEIGHT):
    cairosvg.svg2png(
        url=svg_path,
        write_to=png_path,
        output_width=width,
        output_height=height
    )


parent_dir = os.path.abspath(os.path.dirname(__file__))
svg_dir = os.path.join(parent_dir, 'svg')
png_dir = os.path.join(parent_dir, 'png')
os.makedirs(png_dir, exist_ok=True)


svg_files = [f for f in os.listdir(svg_dir) if f.endswith('.svg')]
print(svg_files)


for svg_file in svg_files:
    svg_path = os.path.join(svg_dir, svg_file)
    png_file = svg_file.replace('.svg', '.png')
    png_path = os.path.join(png_dir, png_file)
    
    print(f"Converting {svg_path} to {png_path}")
    
    try:
        convert_svg_to_png(svg_path, png_path)
        print(f"Successfully converted {svg_file} to {png_file}")
    except Exception as e:
        print(f"Failed to convert {svg_file}: {e}")