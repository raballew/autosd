
# Meson

[Meson](http://mesonbuild.com), like many build systems, has extensive documentation that can be overwhelming and lacks practical guidance. Best practices are not always clear, and finding answers to specific questions can require significant research.

The examples in this repository provide fully functional "jump start" projects to help you get started with Meson:

*   Building a library
*   Building a header-only library
*   Building an executable
*   Setting up dependencies between projects
*   Testing with Google Test

## Command Line Usage

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

## Common Features

*   Project files have a "simple config" section at the top for frequently modified settings.
*   Projects follow a consistent and opinionated structure.
*   Public APIs are marked as public or private using `-DMYPROJECT_PUBLIC` defines, which handle visibility specifications for both Windows and Unix-like systems.
*   The project name and version are passed to the compiler as `-DPROJECT_NAME` and `-DPROJECT_VERSION`.
*   Project files are configured for use as dependencies in other projects and as installable packages.
*   Library projects include example tests.
