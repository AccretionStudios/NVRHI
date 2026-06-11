@echo off
setlocal

REM Build Options

set CONFIG=Debug

set VULKAN=ON
set DX12=ON
set DX11=OFF

set VALIDATION=ON
set EXAMPLES=OFF
set TESTS=OFF

set SHARED=OFF
set NVAPI=OFF
set AFTERMATH=OFF
set RTXMU=OFF

REM Build

mkdir build
cd build

cmake .. ^
    -G "Visual Studio 18 2026" ^
    -A x64 ^
    -DNVRHI_WITH_VULKAN=%VULKAN% ^
    -DNVRHI_WITH_DX12=%DX12% ^
    -DNVRHI_WITH_DX11=%DX11% ^
    -DNVRHI_WITH_VALIDATION=%VALIDATION% ^
    -DNVRHI_BUILD_EXAMPLES=%EXAMPLES% ^
    -DNVRHI_BUILD_TESTS=%TESTS% ^
    -DNVRHI_BUILD_SHARED=%SHARED% ^
    -DNVRHI_WITH_NVAPI=%NVAPI% ^
    -DNVRHI_WITH_AFTERMATH=%AFTERMATH% ^
    -DNVRHI_WITH_RTXMU=%RTXMU% ^
    -DCMAKE_INSTALL_PREFIX=../install

if /I "%CONFIG%"=="Debug" (
    cmake --build . --config Debug
    cmake --install . --config Debug
)

if /I "%CONFIG%"=="Release" (
    cmake --build . --config Release
    cmake --install . --config Release
)

echo Build complete
echo Vulkan:      %VULKAN%
echo DX12:        %DX12%
echo DX11:        %DX11%
echo Validation: %VALIDATION%
echo Examples:   %EXAMPLES%
echo Tests:      %TESTS%
echo Shared:     %SHARED%
echo NVAPI:      %NVAPI%
echo Aftermath:  %AFTERMATH%
echo RTXMU:      %RTXMU%
pause