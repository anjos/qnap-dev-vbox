## QNAP build image

This repository contains instructions to build [VirtualBox][] images for
building C/C++ packages for QNAP on x86 (QTS-4.2.x), automatically using
[Packer][].


### Installation

Pre-requisites:

1. Install or upgrade [VirtualBox][]. I'm currently using version 5.1
2. Install or upgrade [Packer][]. I'm currently using version 0.12.2
3. If you'd like to visualize images being built, [Packer][] uses VRDP to
   export an attach-able display while it builds. In the Mac, you can either
   use [CoRD][] (open-source) or [Microsoft Remote Desktop Connection][] (get
   it via the AppStore for free).


### Building

Once the software above is installed, proceed to running:

```sh
$ rm -rf builds/ #to delete previous builds
$ packer build image.json
```

You may control a few things with the image generation step:

1. You may change the Debian version packaged with the image in the header. In
   this case, remember to change the MD5 checksum as well
2. If this is not 2017, change the build name
3. Debian preseeding can be controlled from the file inside the `http`
   directory. Note you cannot move the file from this directory as that is used
   by [Packer][] to web-serve its contents to the image being built
4. By default, the image is kept registered in your [VirtualBox][]
   installation. You may control that by setting to `false` the flag
   `keep_registered` inside `image.json`
5. By default, the image is **not** exported into an OVA file. You may reset
   that to `false`at `skip_export` if you'd like to do it. In this case, the
   image is placed in the `build` directory
6. Scripts that are run after the image is ready live inside the `scripts`
   directory. You may change or add more scripts in this directory, but
   remember to add them (in the correct order) to the `provisioners` section at
   the file `image.json`. A similar comment goes for files in `dotfiles`, which
   are uploaded to the generated image. Changes in this stage have to be
   concerted with the use of `scripts/cmdline.sh`
7. In order to view the display output of the image being built, point your RDP
   client to `127.0.0.1:59XX`. Pay attention to the output of `packer build` to
   get the last two digits right.


### Using

To build components for your QNAP NAS, enter inside the image, open a terminal,
and then:

```sh
$ sudo /usr/sbin/chroot /opt/cross-project/x86/sys-root
```

Use conda normally when inside the chroot environment.


[VirtualBox]: https://www.virtualbox.org
[Packer]: https://www.packer.io
[CoRD]: http://cord.sourceforge.net
[Microsoft Remote Desktop Connection]: https://itunes.apple.com/us/app/microsoft-remote-desktop/id715768417?mt=12#
