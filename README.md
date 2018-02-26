# docker-qemu-user-static
Qemu user static binaries provider docker images


## How To

1. Create qemu container binaries provider
    ```shell
    docker create --name "qemu-user-static" local/qemu-user-static dummy
    ```
1. Register qemu bin_fmt
    ```shell
    docker run --rm \
        --privileged \
        -e QEMU_BIN_DIR=/usr/bin/qemu \
        multiarch/qemu-user-static:register --reset
    ```
1. Link any existing docker image
    ```shell
    $ docker run \
        --rm \
        -it \
        --volumes-from  "qemu-user-static" \
        alpine:3.7
    ```
    ```shell
    # ls /usr/bin/qemu
    qemu-aarch64-static       qemu-hppa-static          qemu-mips-static          qemu-mipsn32el-static     qemu-ppc64abi32-static    qemu-sparc-static
    qemu-alpha-static         qemu-i386-static          qemu-mips64-static        qemu-nios2-static         qemu-ppc64le-static       qemu-sparc32plus-static
    qemu-arm-static           qemu-m68k-static          qemu-mips64el-static      qemu-or1k-static          qemu-s390x-static         qemu-sparc64-static
    qemu-armeb-static         qemu-microblaze-static    qemu-mipsel-static        qemu-ppc-static           qemu-sh4-static           qemu-x86_64-static
    qemu-cris-static          qemu-microblazeel-static  qemu-mipsn32-static       qemu-ppc64-static         qemu-sh4eb-static
    ```
1. Run aarch64 images
    ```shell
    docker run \
    --rm \
    -it \
    --volumes-from  "qemu-user-static"  \
    arm64v8/alpine uname -a
    ```
    ```
    Linux 0614e4c122b5 4.4.74-boot2docker #1 SMP Mon Jun 26 18:01:14 UTC 2017 aarch64 Linux
    ```