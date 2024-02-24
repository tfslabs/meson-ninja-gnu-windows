@echo off
cd /d "%~dp0"

:: Prepare environment
md .bin
pip install --upgrade build pyinstaller

::Build Meson
cd meson-1.3.2
python build.py
cd dist
xcopy .\ ..\..\.bin /s /i
cd ..\..\.bin

::CD
cd /d "%~dp0"

::Build Ninja
cd ninja-1.11.1
md ninja-build
cd ninja-build
cmake -G "Unix Makefiles" -DCMAKE_PREFIX_PATH="../../.bin" ..
make -j4 
make DESTDIR="../../.bin" install
