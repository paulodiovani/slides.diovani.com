![logo-vagrant](img/logos/vagrant.png) <!-- .element: class="no-border no-background" -->

## Vagrant

[vagrantup.com](https://www.vagrantup.com)

====

> Ambientes de desenvolvimento facilitados

====

- Gerenciado via linha de comando
- _Box_ prontas para diversos fins
- Fácil de configurar
- Roda sobre Virtual Box ou VM Ware

Note:
_Box_ é como são chamadas as imagens do _Vagrant_

====

```
➜  ~  vagrant init hashicorp/precise32
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
```

Note:
Inicializa um ambiente com base no Ubuntu hashicorp/precise32

====

```
➜  ~  vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'hashicorp/precise32'...
==> ...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    ...
==> default: Machine booted and ready!
==> ...
==> default: Mounting shared folders...
    default: /vagrant => /mnt/userdata/diovani/Vagrant/precise32
```

Note:
Sobe o ambiente, baixando a box, se necessário.

====

Configuração feita através de um único arquivo.

`Vagrantfile`

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise32"

# ...
```

====

### Que problemas resolve?

- Reproduzir ambientes facilmente
- Empacotar e distribuir
- Automatizar a instalação de dependências (provisioning)
  + via _bash_, _Chef_, _Puppet_, etc.

====

### Obstáculos

- Exige instalação de um _Hypervisor_
  + _Virtual Box_, _VMWare_
- Ainda reserva de recursos do _Host_ como qualquer _VM_

Note:
Docker pode rodar sobre um provider de containers,
tal como Docker (oficial), o que inclusive facilita
a reprodução em ambiente não Linux.
