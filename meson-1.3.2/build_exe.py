import PyInstaller.__main__

PyInstaller.__main__.run([
    'meson.py',  # Replace 'your_script.py' with the name of your main Python script
    '--onefile',       # This option creates a single executable file
    '--name', './dist/meson.exe',  # Specify the name for your executable
    '--clean',         # Cleans temporary files
])
