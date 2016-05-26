<!-- .slide: data-background="linear-gradient(rgba(0, 0, 0, 0.65), rgba(0, 0, 0, 0.65)), url(img/railway.jpg)" data-background-size="cover" -->

## Andando sobre trilhos

Uma apresentação sobre o _ecossistema_ de _**Ruby on Rails**_.

<small>Versão 0.1.1</small>

<small>por Paulo Diovani</small>

Note:
Image credits: lemerg.com

====
<!-- .slide: class="half-slide" data-background="url(img/paulodiovani.jpg)" data-background-size="contain" data-background-repeat="no-repeat" data-background-position="right" -->


### <i class="fa fa-user"></i> Paulo Diovani Gonçalves

Tecnólogo em Sistemas para Internet pela Universidade Feevale.
Desenvolvedor na Codeminer 42.
Usuário GNU/Linux.

[blog.diovani.com][blog]

[slides.diovani.com][slides]

[@paulodiovani][twitter]

[![codeminer42][code-logo]][code-site] <!-- .element: class="no-border no-background" -->

[avatar]: img/avatar.jpg
[blog]: http://blog.diovani.com
[slides]: http://slides.diovani.com
[twitter]: http://twitter.com/paulodiovani
[code-logo]: img/codeminer42.png
[code-site]: http://codeminer42.com/

----

![code-main-logo][code-main-logo] <!-- .element: class="no-border no-background" style="width:480px" -->

estamos contratando

[become@codeminer42.com][become]

[code-main-logo]: img/codeminer.svg
[become]: mailto:become@codeminer42.com

====

## <i class="br br-codeminer"></i> Codeminer 42

- Processo ágil
- Foco em qualidade
- Times auto gerenciados
- Consultoria + Desenvolvimento
- Comunicação direta com o cliente

====

## <i class="fa fa-apple"></i> <i class="fa fa-linux"></i> prepare
## <i class="br br-ruby"></i> <i class="br br-rails"></i> develop
## <i class="fa fa-github"></i> <i class="br br-travis-ci"></i> commit/test
## <i class="br br-heroku"></i> <i class="br br-postgresql"></i> deploy

----

# <i class="br br-ruby"></i> <i class="br br-rails"></i>

# Primeiras impressões

Note:
Vindo do PHP, Javascript, Java e C#...

====

## <i class="br br-ruby"></i> Código limpo e legível

```ruby
# Output "I love Ruby"
say = "I love Ruby"
puts say

# Output "I *LOVE* RUBY"
say['love'] = "*love*"
puts say.upcase

# Output "I *love* Ruby"
# five times
5.times { puts say }
```

Note:
A maiorias dos métodos e construção de ruby
se assemelha muito a linguagem natural

====

## <i class="br br-ruby"></i> Repositório de Gems

http://rubygems.org

- Gerenciador de pacotes do Ruby
- Formato padrão para distribuir programas e bibliotecas Ruby

====

## <i class="br br-ruby"></i> Gerenciador de dependências

http://bundler.io

```bash
gem install bundler
vim Gemfile
```

```ruby
source 'https://rubygems.org'
gem 'nokogiri'
gem 'rack', '~>1.1'
gem 'rspec', :require => 'spec'
```

```bash
bundle install
```

====

## <i class="br br-ruby"></i> BDD com rspec

http://rspec.info

http://betterspecs.org

```ruby
describe Calculator do
  let(:calc) { Calculator.new() }

  describe '#sum' do
    subject { calc.sum 2, 8 }

    it 'sums two numbers' do
      is_expected.to eq 10
    end
  end
end
```

----

## <i class="br br-rails"></i> Convenções antes de configuração

Ruby on Rails segue a filosofia _Convention over configuration_

- Reduz o número de decisões do desenvolvedor
- Fácil de obter ajuda da comunidade

```ruby
class Project < ApplicationRecord
  belongs_to :account
  has_many :participants, class_name: ‘Person’
  validates_presence_of :name
end
```

====

## <i class="br br-rails"></i> Você não vai precisar disso

*YAGNI* (_You aren't gonna need it_)

- Princípio de _Extreme Programming_
- Não adicionar até ser necessário
- Faça o mais simples possível para que funcione

====

## <i class="br br-rails"></i> Setup rápido

```bash
gem install rails
rails new blog
cd blog
bin/rails server
```

====

## <i class="br br-rails"></i> Fácil subir aplicações

```bash
git clone https://github.com/paulodiovani/rails-example
cd rails-example
bundle install
bundle exec rails server
```

====

## <i class="br br-rails"></i> Asset Pipeline

Dispensa/substitui Grunt, Gulp, etc.

- CSS, SASS
- Javascript, CoffeeScript
- Compila, concatena, minifica

----

## <i class="fa fa-check"></i> O que Ruby on Rails resolve?

- Aplicações web diversas
    + e-commerce
    + portais / redes sociais
    + gerenciamento de conteúdo
- Criação rápida
    + "favorito das _startups_"
- Deploy facilitado

====

### <i class="br br-rails"></i> Sites incríveis usando Ruby on Rails

- Airbnb (http://airbnb.com)
- Ask.fm (http://ask.fm)
- GitHub (http://github.com)
- Goodreads (http://goodreads.com)
- Groupon (http://groupon.com)
- Hulu (http://hulu.com)
- Indiegogo (http://indiegogo.com)
- Kickstarter (http://kickstarter.com)
- Shopify (http://shopify.com)
- SlideShare (http://slideshare.net)
- ThemeForest (http://themeforest.net)
- Twitch (http://twitch.tv)

====

## <i class="fa fa-ban"></i> Onde não usar?

- Sistemas altamente distribuídos / APIs
- Aplicações Desktop
- Servidor de IRC
- Impressora
- Smart TV
- Robótica
- Controlador de elevador
- Exploração espacial
- Na vida
- Etc

====

## <i class="br br-ruby"></i> Outras coisas Ruby

- Sinatra (http://sinatrarb.com)
    + para APIs
- Jekyll (https://jekyllrb.com)
    + sites estáticos, blogs, GitHub pages
- Ruby Motion (http://rubymotion.com)
    + apps mobile multi-plataforma
- Chef (https://chef.io/chef)
    + DevOps
- Vagrant (https://vagrantup.com)
    + infra, ambientes de desenvolvimento

----

# <i class="fa fa-calendar"></i> Eventos

Onde falar/ouvir sobre Ruby on Rails?

====
<!-- .slide: data-background="linear-gradient(rgba(0, 0, 0, 0.65), rgba(0, 0, 0, 0.65)), url(img/gurusorocaba.jpg)" data-background-size="cover" -->

## <i class="br br-ruby"></i> GURU

Grupo de usuário Ruby

<small>Foto: GURU Sorocaba</small>

====
<!-- .slide: data-background="linear-gradient(rgba(0, 0, 0, 0.65), rgba(0, 0, 0, 0.65)), url(img/railsgirlspoa.jpg)" data-background-size="cover" -->

## <i class="br br-rails"></i> Rails Girls <i class="fa fa-heart"></i>

http://railsgirls.com

May 13 & 14, 2016<br>
Hong Kong

May 20 & 21, 2016<br>
Novo Hamburgo

...

<small>Foto: Rails Girls POA 2014</small>

====
<!-- .slide: data-background="linear-gradient(rgba(0, 0, 0, 0.65), rgba(0, 0, 0, 0.65)), url(img/rubyconfbr.jpg)" data-background-size="cover" -->

## <i class="br br-ruby"></i> RubyConf BR

http://www.rubyconf.com.br

September, 23th and 24th<br>
São Paulo

<small>Foto: RubyConf BR 2015</small>

====
<!-- .slide: data-background="url(img/rubyconf.svg)" data-background-size="cover" -->

## <i class="br br-ruby"></i> RubyConf

http://rubyconf.org

November 10-12, 2016<br>
Cincinnati

Note:
Cincinnati, Ohio, USA

====
<!-- .slide: data-background="linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, 0.45)), url(img/railsconf.jpg)" data-background-size="cover" -->

## <i class="br br-rails"></i> RailsConf

http://railsconf.com

~~MAY 4-6TH, 2016~~<br>
~~Kansas City~~

Note:
Kansas City, Kansas, USA

====
<!-- .slide: data-background="linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, 0.45)), url(img/novohamburgo.jpg)" data-background-size="cover" -->

## <i class="fa fa-code"></i> Meetup Vale dos Desenvolvedores

http://meetup.com/Vale-dos-Desenvolvedores

Em breve<br>
Novo Hamburgo

<small>Foto: Novo Hamburgo, por paulodiovani</small>

----
<!-- .slide: class="half-slide" data-background="url(img/feanor.jpg)" data-background-size="contain" data-background-repeat="no-repeat" data-background-position="right" -->

# Perguntas?

Note:
Image credits: Fëanor, por Fabiana Amaral
