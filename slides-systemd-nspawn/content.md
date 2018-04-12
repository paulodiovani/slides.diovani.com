<!-- .slide: data-background="linear-gradient(rgba(255, 255, 255, 0.6), rgba(255, 255, 255, 0.6)), url(img/nspawn.png)" data-background-size="cover" -->

# SYSTEMD-NSPAWN

_The containers you already have_

<small>Version 0.1.0</small>

<small>by Paulo Diovani</small>

----

## Containers Implementaions

- `chroot`
- `Docker`
- `FreeBSD jail`
- `Linux-VServer`
- `lmctfy`
- `LXC`
- `OpenVZ`
- `rkt`
- `Sandboxie`
- `Solaris Containers`
- `sysjail`
- `Systemd-nspawn`
- `Turbo`
- `Virtuozzo`
- `WPARs`

<!-- .element: class="tag-list" -->

----
<!-- .slide: id="vs" class="bigtext" data-background="linear-gradient(rgba(255, 255, 255, 0.6), rgba(255, 255, 255, 0.6)), url(img/dragon-against-army.jpg)" data-background-size="cover" -->

SystemD

<div>Vs.</div>

System-V

----

## Systemd-nspawn

_chroot on steroids_

Spawn a namespace container for debugging, testing and building.

====
<!-- .slide: id="light-weigth" class="bigtext" -->

**systemd-nspawn** may be used to

run a command or OS in

a light-weight namespace container

====
<!-- .slide: id="tree" class="bigtext" -->

**systemd-nspawn** may be invoked

on any directory tree containing

an operating system tree

====

```bash
systemd-nspawn --help

  -b --boot                 Boot up full system (i.e. invoke init)
  -D --directory=PATH       Root directory for the container
  -i --image=PATH           File system device or disk image for
                            the container
  -M --machine=NAME         Set the machine name for the container
```

====

### Examples

#### Create and boot a minimal Arch Linux distribution in a container

```bash
mkdir ~/MyContainer
pacstrap -i -c -d ~/MyContainer base [additional pkgs/groups]
systemd-nspawn -b -D ~/MyContainer
```

#### Create a Debian or Ubuntu environment

```bash
debootstrap <codename> myContainer <repository-url>
systemd-nspawn -b -D myContainer
```

----

## machinectl

Control the systemd machine manager.

====

```bash
machinectl --help

Machine Commands:
  list                        List running VMs and containers
  status NAME...              Show VM/container details
  login [NAME]                Get a login prompt in a container or
                              on the local host
  shell [[USER@]NAME [COMMAND...]]
                              Invoke a shell (or other command) in a
                              container or on the local host

Image Commands:
  list-images                 Show available container and VM images

Image Transfer Commands:
  pull-tar URL [NAME]         Download a TAR container image
  pull-raw URL [NAME]         Download a RAW container or VM image
```

====

### Example

```bash
machinectl pull-raw \
  https://cloud-images.ubuntu.com/artful/current/artful-server-cloudimg-amd64.img \
  ubuntu1710

systemd-nspawn -b -M ubuntu1710

useradd -m diovani
passwd diovani
exit

machinectl login ubuntu1710
```

----

## ~$ Demo time

![demo](img/devilish.svg) <!-- .element: class="no-border" style="width: 40%" -->

----
<!-- .slide: class="half-slide" data-background="url(img/paulodiovani.jpg)" data-background-size="contain" data-background-repeat="no-repeat" data-background-position="right" -->

### <i class="fa fa-user"></i> Paulo Diovani Gonçalves

<small>Technologist in Internet Systems by Feevale University.
Software Enginer at Codeminer 42.
GNU/Linux user since 2005.</small>

[blog.diovani.com][blog]

[slides.diovani.com][slides]

[@paulodiovani][twitter]

[![codeminer42][code-logo]][code-site] <!-- .element: class="no-border no-background" -->

[blog]: http://blog.diovani.com
[slides]: http://slides.diovani.com
[twitter]: http://twitter.com/paulodiovani
[code-logo]: img/codeminer42.png
[code-site]: http://codeminer42.com/

====
<!-- .slide: data-background="linear-gradient(rgba(255, 255, 255, 0.6), rgba(255, 255, 255, 0.6)), url(img/vod-meetup.jpg)" data-background-size="cover" -->

![vod](img/vod.png) <!-- .element: class="no-border no-background" -->
##  Valley of Developers

[valleyofdevelopers.github.io](https://valleyofdevelopers.github.io/)

<small>18 de Novembro<br>
Universidade Feevale, Novo Hamburgo - RS</small>
====

![insiter](img/insiter.svg) <!-- .element: style="width: 50%" class="no-border" -->

[insiter.io](http://insiter.io/)

<small>02 de Dezembro<br>
Auditório do SENAC POA</small>
