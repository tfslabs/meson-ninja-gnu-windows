import PyInstaller.__main__
import pkg_resources

# Get a list of all installed packages
installed_packages = [pkg.key for pkg in pkg_resources.working_set]

# Construct the list of hidden imports
hidden_imports = []
for pkg_name in installed_packages:
    hidden_imports.extend(['--hidden-import', pkg_name])

PyInstaller.__main__.run([
    'meson.py',        # Replace 'meson.py' with the name of your main Python script
    '--onefile',       # This option creates a single executable file
    '--name=meson',    # Specify the name for your executable (without the extension)
    '--clean',         # Cleans temporary files
    *hidden_imports   # Include all installed packages as hidden imports
])
