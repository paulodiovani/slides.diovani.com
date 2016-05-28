## Conclusão

====

| &nbsp;               | Vagrant  | LXC      | Docker   |
| --                   | :--:     | :--:     | :--:     |
| Sem dependências     | &#10004; | &#10004; | &#10004; |
| Único comando        | &#10004; |          | &#10004; |
| Reproduzir ambientes | &#10004; |          | &#10004; |
| Fácil distribuição   | &#10004; |          | &#10004; |
| Remover facilmente   | &#10004; | &#10004; | &#10004; |
| Uso transparente     | &#10004; |          | &#10004; |
| Acesso ao _guest_    | &#10004; | &#10004; |          |
| Provisionamento      | &#10004; |          | &#10004; |
| Orquestração         |          |          | &#10004; |
| Menor consumo        |          | &#10004; | &#10004; |

Note:
- Sem dependências ...instaladas no Host
- Único comando ...para iniciar serviços
- Reproduzir ambientes ...facilmente
- Fácil distribuição ...imagens, scripts
- Remover facilmente
- Uso transparente ...para acesso a portas e diretórios
- Acesso ao _guest_ ...via shell
- Provisionamento ...scripts para automação
- Orquestração ...subir serviços e conectá-los
- Menor consumo ...de recursos

====

<!-- .slide: data-background="img/qa.jpg" -->

## Perguntas e respostas

hannacooper.com <!-- .element: class="credits" -->

====
<!-- .slide: class="list-descriptions" -->

### Linux containers em produção, pode?

Sim, claro.

- Heroku

  Usa LXC para seu _Cedar Stack_ juntamente com
  _buildpacks_.

- PayPal

  Após implantar uma estrutura de CI com Docker,
  Mesos e Jenkins, passou a integrar Docker também ao
  ecosistema principal.

====
<!-- .slide: class="list-descriptions" -->

### Não uso Linux, posso usar Docker?

Sim, rodando a partir de uma VM.

- ~~boot2docker~~

- Docker Toolbox

  Disponível para Windows e Mac, instala Docker,
  Docker Machine, Docker Compose (Mac, apenas),
  Kitematic e Virtual Box.

- Vagrant

  Pode usar Docker como _provider_. Em sistemas que não
  suportam Linux Containers nativamente, inicia uma VM
  para rodar Docker de forma transparente.

====

### Existem containers nativos para Mac OSX?

Não.

Mac oferece _chroot_ e _App Sandbox_, mas não uma solução
completa e/ou robusta em containers.

Note:
Talvez no futuro

====
<!-- .slide: class="list-descriptions" -->

### Existem containers nativos para Windows?

Sim, eles existem.

- Windows Server Containers

  Solução muito similar a Linux Containers.

- Hyper-V Containers

  Alternativa à Windows Server Containers.

- Docker

  Funciona sobre Windows Containers com a mesma
  API do Docker para Linux.

Note:
Ao que parece Windows Containers ainda é um projeto
muito jovem (a Internet Archive possui registro da
página apenas a partir de 5/Set/2015).

Hyper-V Containers ainda não são disponíveis para uso.
Esperados ainda para 2015.

====
<!-- .slide: data-background="img/doubts.jpg" -->

# Dúvidas?

readytalk.com <!-- .element: class="credits" -->
