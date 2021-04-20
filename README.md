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

--- 
credenciales en rails
EDITOR=nano rails credentials:edit
...
para acceder a la variable Rails.application.credentials.VALOR

--- 
El asset pipeline
Transformer -> Concatenator-> Compressor -> Fingerprinter
sass -> css1 -> manifest suma (css) -> 1 archivo css-> asignar id unico css

---
Scaffolding
rails g scaffold Book title:string author:string description:text isbn:string pages_count:integer
rails db:migrate

---
Probando HAML https://haml.info/
> "puede generar problemas de rendimiento"
se edita gemfile y se agrega gem 'hamlit'
y en group :development do agregar gem 'hamlit-rails'
bundle install

https://html2haml.herokuapp.com/

---
simple form gem https://github.com/heartcombo/simple_form
se agrega en la rails del Gemfile gem 'simple_form'
bundle install o bi
rails generate simple_form:install
Para probar
rails g scaffold User first_name:string last_name:string address:string about_me:text phone:integer
rails db:migrate

---
Traducciones
Se utiliza i18n que se encuentra en config/local/es.yml
se puede mejorar con una gema llamada i18n-tasks, se utiliza label: t('.value')
gem install i18n-tasks
i18n-tasks add-missing

---

byebug se coloca en los controladores para debug
sirve como debugger pero de lado del servidor
existen otras gemas como pry se agregan al gemfile y se utiliza colocando binding.pry

---
Creando proyecto principal
rails new organizador -T --database=postgresql  
rails new organizador -T -d postgresql
yarn add bootstrap jquery popper.js roboto-fontface
se modifica gemfile y se agregan gemas anteriores
bundle install

---
configurar base de datos postgresql con archivo database.yml
en dev y test se agrega 
  host: localhost
  user: todolist
  password: todolist

rails db:create

---
rails g simple_form:install --bootstrap
rails g scaffold Category name:string description:text
rails g scaffold Task name:string description:text due_date:date category:references
rails db:create
rails db:migrate

Para ver los datos dentro de un modelo se utiliza la gema annotate
al gemfile > gem 'annotate'
bundle exec annotate --models

---
validaciones del modelo para su insert en la base de datos 
https://api.rubyonrails.org/classes/ActiveRecord/Validations/ClassMethods.html

--- 
Gema para usuarios
gem 'devise' > gemfile
bundle install
rails g devise:install
rails g devise User
* para ver todas las rutas -> rails routes o http://localhost:3000/rails/info/routes
http://localhost:3000/users/sign_in

se agrega a ApplicationController 
    before_action :authenticate_user!
y se agrega al application html 
    <%= link_to 'cerrar sesion', destroy_user_session_path, method: :delete %>

