<!-- .slide: data-background="img/containers.jpg" -->

Agora vamos falar sobre

## Containers

cphcontainers.dk <!-- .element: class="credits" -->

====

_Operating-system-level Virtualization_

Note:
É uma forma de virtualização, mas a nível de sistema operacional,
ou melhor, a nível de _kernel_.

====

- Não podem rodar um sistema operacional diferente do _host_
- Permitem várias instâncias isoladas de _userspace_
- Sem emulação de _hardware_
- Consumo de recursos mínimo ou nulo

====
<!-- .slide: data-background="img/yes-baby.jpg" -->

## CONSUMO DE RECURSOS MÍNIMO OU NULO

techebizz.com <!-- .element: class="credits" -->

Note:
Vou repetir

====

![vserver](img/logos/vserver-small.png) <!-- .element: class="no-border no-background" -->
![openvz](img/logos/openvz-small.png) <!-- .element: class="no-border no-background" -->
![lxc](img/logos/lxc-small.png) <!-- .element: class="no-border no-background" -->
![docker](img/logos/docker-small.png) <!-- .element: class="no-border no-background" -->
![rocket](img/logos/rocket-small.png) <!-- .element: class="no-border no-background" -->

- chroot (1982)
- FreeBSD Jails (2000)
- Linux VServer (2001)
- OpenVZ (2005)
- LXC (2008)
- SystemD nspawn (~2010)
- Docker (2013)
- rkt (2014)

Note:
- _chroot_ não é um container, mas apenas um _userspace_
e sistema de arquivos (não muito) isolado.

- SystemD tem release inicial em 2010, mas não encontrei
quando o nspawn foi criado.
