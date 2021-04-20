# todolist-rails
Create a todolist with Ruby on Rails


Basado en curso de Platzi

# manual install rails in linux

sudo apt-get update

sudo apt install build-essential curl wget openssl libssl-dev libreadline-dev dirmngr zlib1g-dev libmagickwand-dev imagemagick-6.q16 libffi-dev libpq-dev cmake libwebp-dev

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

Al final de la ejecución del comando deberás ver un texto similar a este, mencionando que a pesar de haber instalado RBENV este no se encuentra en la variable de entorno PATH

'''
Running doctor script to verify installation...

Checking for `rbenv' in PATH: not found

You seem to have rbenv installed in `/home/platzi/.rbenv/bin', but that

directory is not present in PATH. Please add it to PATH by configuring

your `~/.bashrc', `~/.zshrc', or `~/.config/fish/config.fish'.
'''

Para añadir a la variable de entorno PATH los binarios de RBENV y a su vez ejecutarlo cada vez que exista una nueva sesión, debemos agregar dos líneas al archivo .zshrc que habíamos visto antes, pero esta vez solo usaremos la consola para hacerlo, de la siguiente manera:

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source ~/.bashrc

rbenv -v

debe salir la version para confirmar que esta todo bien instalado

rbenv install 2.7.1

rbenv global 2.7.1

gem install bundler

bundle config github.https true

gem install rails

rails -v

Instalando yarm

sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

sudo sh -c "echo 'deb https://dl.yarnpkg.com/debian/ stable main' >> /etc/apt/sources.list"

sudo apt update

sudo apt --no-install-recommends install yarn

#postgresql

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

sudo apt update

sudo apt -y install postgresql-12 postgresql-client-12


sudo -i -u postgres

createuser --pwprompt --interactive todolist


Crear aplicacion de ejemplo con postgresql
rails new *nombre_del_proyecto* -T -d postgresql


Crear aplicacion  de ejemplo con sqlite

sudo apt-get install -y sqlite3 libsqlite3-dev
rails new *nombre_del_proyecto* -T


rails server

---
crear modelos
rails g model Pet name:string breed:string
rails db:migrate

---
para crear registros
rails console
Pet.create name: 'Pandy', breed: 'koker'

