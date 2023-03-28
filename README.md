# How to build

```bash
git clone git@github.com:sengulhamza/ticcxx_cmake.git
cd ticcxx_cmake
./build.sh
```
Build script commands:
```bash
./build.sh -f 
```
Deletes old build directory and builds project from start.
```bash
./build.sh -b 
```
Sends make command to build folder.

```bash
./build.sh -fb 
```
-f -b commands runs together. Shortly, clean build.


### ARM Toolchain
```
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
```

## Source hierarchy

- `src` is the main application source directory.
- `src/app` for application related code files.
- `src/drv` for driver code files. ie: i2c_master, uart, rf
---
## Branch workflow
- Before create a new branch follow the below flow
```bash
git checkout master
git pull
git checkout -b feature/branch-name
```
- If your commit fixing a bug branch name will be like `bugfix/branch-name`
- Before push your commit, run `code-format.sh` and write a clear and concise explanation with -m option
---
