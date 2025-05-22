[![Open in GitHub
Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/raballew/autosd?quickstart=1)

## Usage

### Setup

1.  Fork this repository
2.  Add [Jumpstarter's client configuration environment
variables](https://jumpstarter.dev/main/getting-started/configuration/files.html#client-configuration)
(`JMP_ENDPOINT`, `JMP_NAME`, `JMP_NAMESPACE`, `JMP_TOKEN`) to your [GitHub
account](https://github.com/settings/codespaces/secrets). Ensure the fork has
visibility to those.
2.  Once the IDE has started, ensure the Meson root directory is set to
    `executable/meson.build`.

### Build OS Image

1.  Press `Ctrl` + `Shift` + `P`.
2.  Select `Tasks: Run Build Task`.
3.  Choose `OS Builder` and configure the following options:
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
4.  Wait a few seconds for the OS to start. Once it's running, you should see a
    terminal prompt: `[root@localhost ~]#`

### Develop

1.  Press `Ctrl` + `Shift` + `P`.
2.  Choose `Meson: Build` and select `All targets`.
3.  Set breakpoints in the following files:
    *   [executable/src/myexec.c](executable/src/myexec.c)
    *   [headeronly/include/headeronly.h](headeronly/include/headeronly.h)
    *   [library/src/library.c](library/src/library.c)
4.  Ensure a [package-based OS image](#build-os-image) is running locally (see
    [Run OS Image](#run-os-image)).
5.  Press `F5` to start debugging. Choose whether to debug the application in
    `QM` or `ASIL`.
6.  Use the following shortcuts to control the debugger:
    *   `F5`: Continue
    *   `F10`: Step Over
    *   `F11`: Step Into
    *   `Shift` + `F11`: Step Out
    *   `Ctrl` + `Shift` + `F5`: Restart
    *   `Shift` + `F5`: Stop
7.  Edit the source code and press `F5` again to test your changes.

### Build RPM

1.  Press `Ctrl` + `Shift` + `P`.
2.  Select `Tasks: Run Build Task`.
3.  Choose `RPM Builder` and configure the following options:
    *   `executable/myexec.spec`
4.  Wait for the RPM package to build. This may take a few minutes.
5.  Once the build is complete, the RPM package will be available in the local
    repository at `/var/tmp/local_repo`.
6.  Modify [.aib/debug.aib.yml](.aib/debug.aib.yml) to include the following
    lines and then [build the OS image again](#build-os-image):

```
content:
  repos:
    - id: local_repo
      baseurl: file:///var/tmp/local_repo
  rpms:
    - myexec
```

## Next steps

- Learn more about [Meson](docs/meson.md).
- More information about AutoSD can be found at it's [official
  documentation](https://sig.centos.org/automotive/getting-started/).
