# contact-book-server
voltar para contact-book <br>
https://github.com/gildemberg-santos/contact-book

## Ambiente
~~~ bash
$ ruby -v
2.7.4

$ rails -v
6.1.4.1

$ rbenv --version
1.1.2

$ pg_config --version
12.8
~~~

Preparação do ambiente (Ubunto / Linux Mint)<br>
Instale a ferramenta rbenv
~~~ bash
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
 
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
~~~

Configurando rbenv
~~~ bash
$ rbenv install 2.7.4
$ rbenv global 2.7.4
~~~

Instalar o PostgreSQL
~~~ bash
sudo apt install postgresql postgresql-contrib
~~~

Instalar o bundle para gerenciar os gems do projeto
~~~ bash
$ gem install bundler 
~~~

Instalar os gems do projeto com o bundler
~~~ bash
$ bundle install 
~~~

Execução do projeto
~~~ bash
$ rails s -p 3001
~~~
