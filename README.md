# Web-based IDE for AutoSD

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)]()

## Usage

### Build OS Image

- `Ctrl+Shift+P`, choose `Tasks: Run Task`, select `Image Builder` with the following options:
  - cs9
  - package
  - qemu
  - qcow2
  - .aib/debug.aib.yml
- Wait a few minutes while the OS image is being build.

### Run OS Image

- `Ctrl+Shift+P`, choose `Tasks: Run Task`, select `Jumpstarter` with the desired OS image.
- Wait a few seconds while the OS is being started. Once completed you should see a terminal with `[root@localhost ~]#`

### Develop

- `Ctrl+Shift+P`, choose `Meson: Build` and select `All targets`
- Set breakpoints in [myexec.c](executable/src/myexec.c), [headeronly.h](headeronly/include/headeronly.h) and [library.c](library/src/library.c)
- Make sure a [packages based OS image](#build-os-image) is [still running locally](#run-os-image), then press `F5` to start debugging. Choose whether the application should be debugged in QM or ASIL. Then use the following shortcuts to navigate through the debugger:
  - `F5`: Continue
  - `F10`: Step Over
  - `F11`: Step Into
  - `Shift+F11`: Step Out
  - `Ctrl+Shift+F5`: Restart
  - `Shift+F5`: Stop
- Finally, edit the source code and hit `F5` again.

## Meson

[Meson](http://mesonbuild.com), like many projects, has documentation that is heavy on the detail, but weak on the big picture. There are no best practices offered, and questions like "How do I..." require a lot of digging around in the guts.

The opinionated examples in this repository are designed as fully functional "jump start" projects to get you going:

* Building a library
* Building a header-only library
* Building an executable
* Setting up dependencies to other projects
* Testing via google test

### To build from command line, go into one of the project directories, then:

To initialize the builder:

    meson build

To build the project from then on:

    ninja -C build

To run the tests:

    ninja -C build test

To run the tests with full "google test" reporting:

    ./build/run_tests

All build files will be put in the `build` subdir, which is included in `.gitignore`.

### Common Features

* Project files are split such that they have a "simple config" section at the top for the most common things you'll want to modify.
* Projects are structured in an opinionated way.
* Public APIs are marked public or private (depending on their internal or external use) via `-DMYPROJECT_PUBLIC` defines, which handle windows and unix style visibility specifications.
* The project name and version are passed to the compiler as `-DPROJECT_NAME` and  `-DPROJECT_VERSION`
* Project files are already set up to be used as dependencies of other projects, and as packages.
* The library projects come with example tests.
