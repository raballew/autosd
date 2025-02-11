[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/raballew/autosd?quickstart=1)

## Usage

### Setup

1.  Once the IDE has started, ensure the Meson root directory is set to `executable/meson.build`.
2.  Run `git submodule update --init --recursive` to initialize unit test dependencies.

### Build OS Image

1.  Press `Ctrl` + `Shift` + `P`.
2.  Select `Tasks: Run Task`.
3.  Choose `Image Builder` and configure the following options:
    *   `cs9`
    *   `package`
    *   `qemu`
    *   `qcow2`
    *   `.aib/debug.aib.yml`
4.  Wait for the OS image to build. This may take a few minutes.

### Run OS Image

1.  Press `Ctrl` + `Shift` + `P`.
2.  Choose `Tasks: Run Task`.
3.  Select `Jumpstarter` and choose the desired OS image.
4.  Wait a few seconds for the OS to start. Once it's running, you should see a terminal prompt: `[root@localhost ~]#`

### Develop

1.  Press `Ctrl` + `Shift` + `P`.
2.  Choose `Meson: Build` and select `All targets`.
3.  Set breakpoints in the following files:
    *   [executable/src/myexec.c](executable/src/myexec.c)
    *   [headeronly/include/headeronly.h](headeronly/include/headeronly.h)
    *   [library/src/library.c](library/src/library.c)
4.  Ensure a [package-based OS image](#build-os-image) is running locally (see [Run OS Image](#run-os-image)).
5.  Press `F5` to start debugging. Choose whether to debug the application in `QM` or `ASIL`.
6.  Use the following shortcuts to control the debugger:
    *   `F5`: Continue
    *   `F10`: Step Over
    *   `F11`: Step Into
    *   `Shift` + `F11`: Step Out
    *   `Ctrl` + `Shift` + `F5`: Restart
    *   `Shift` + `F5`: Stop
7.  Edit the source code and press `F5` again to test your changes.

## Meson

[Meson](http://mesonbuild.com), like many build systems, has extensive documentation that can be overwhelming and lacks practical guidance. Best practices are not always clear, and finding answers to specific questions can require significant research.

The examples in this repository provide fully functional "jump start" projects to help you get started with Meson:

*   Building a library
*   Building a header-only library
*   Building an executable
*   Setting up dependencies between projects
*   Testing with Google Test

### Command Line Usage

To build from the command line, navigate to one of the project directories (e.g., `executable`, `library`, or `headeronly`), then:

1.  Initialize the build environment:

    ```sh
    meson build
    ```

2.  Build the project:

    ```sh
    ninja -C build
    ```

3.  Run the tests:

    ```sh
    ninja -C build test
    ```

4.  Run the tests with detailed Google Test reporting:

    ```sh
    ./build/run_tests
    ```

All build files are placed in the `build` subdirectory, which is ignored by Git.

### Common Features

*   Project files have a "simple config" section at the top for frequently modified settings.
*   Projects follow a consistent and opinionated structure.
*   Public APIs are marked as public or private using `-DMYPROJECT_PUBLIC` defines, which handle visibility specifications for both Windows and Unix-like systems.
*   The project name and version are passed to the compiler as `-DPROJECT_NAME` and `-DPROJECT_VERSION`.
*   Project files are configured for use as dependencies in other projects and as installable packages.
*   Library projects include example tests.
