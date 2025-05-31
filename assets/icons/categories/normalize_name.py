import os

parent_dir = os.path.abspath(os.path.dirname(__file__))
print(parent_dir)

svg_files = [f for f in os.listdir(parent_dir) if f.endswith('.svg')]

for old_filename in svg_files:
    new_filename = old_filename.replace('.svg', '')
    if "=" in new_filename:
        parts = old_filename.split("=")
        new_filename = f"{parts[1]}.svg"
        old_path = os.path.join(parent_dir, old_filename)
        new_path = os.path.join(parent_dir, new_filename)
        try:
            os.rename(old_path, new_path)
        except FileExistsError:
            new_path = os.path.join(parent_dir, f"{parts[1]}_1.svg")
            os.rename(old_path, new_path)