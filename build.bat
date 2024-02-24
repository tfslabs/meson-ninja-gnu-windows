@echo off
cd /d "%~dp0"

:: Prepare environment
md .bin
pip install --upgrade build

::Build Meson
cd meson-1.3.2
python -m build
cd dist
xcopy .\ ..\..\.bin /s /i
cd ..\..\.bin
pip install meson-1.3.2-py3-none-any.whl

::CD
cd /d "%~dp0"

::Build Ninja
cd ninja-1.11.1
md ninja-build
cd ninja-build
cmake -G "Unix Makefiles" -DCMAKE_PREFIX_PATH="../../.bin" ..
make -j4 
make DESTDIR="../../.bin" install
