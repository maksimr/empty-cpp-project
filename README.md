# Empty C++ Project

## Prerequisites

```sh
brew install conan cmake
```

## Setup

```sh
conan profile detect
conan config install .conan
```

## Building

```sh
conan install . -pr cpp17 -b missing -s build_type=Debug
cmake --preset conan-debug
cmake --build --preset conan-debug
./build/Debug/EmptyCppProject
```
