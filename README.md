# Empty C++ Project

## Prerequisites

```sh
brew install cmake

git clone https://github.com/microsoft/vcpkg --depth 1 --single-branch -b master .vcpkg
.vcpkg/bootstrap-vcpkg.sh
```

## Building

```sh
.vcpkg/vcpkg install
cmake -S . -B build/Debug -DCMAKE_BUILD_TYPE=Debug
cmake --build build/Debug
./build/Debug/EmptyCppProject
```
