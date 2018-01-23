# DOCKER RUBY ON RAILS WIDTH DATABASE POSTGRES

Un entorno docker para desarrollo de aplicaciones de Ruby on Rails con base de datos Postgres y entorno de test end to end con node webdriveio, nocha y selenium

## construir la imagen si no existe

    docker build . -t myruby

## arrancar el contenedor

    docker run -it --rm --name=myapp -p 3000:3000 -v $PWD:/home/myuser/app -v $PWD/_bundle:/usr/local/bundle myruby /bin/bash

create file bash **runDocker.sh**

    docker run -it --rm \
    --name=myapp \
    -p 3000:3000 \
    -v $PWD:/home/myuser/app \
    -v $PWD/_bundle:/usr/local/bundle \
    myruby \
    /bin/bash

darle permisos de ejecucion **chmod +x runDocker.sh**

# instalar Rails

    gem install rails --pre

create de proyect rails

    rails new . -T

add al .gitignore el directorio _bundle

    _bundle/

ejecutar las migraciones

    rake db:create

Arrancar el servidor de rails

    rails server

y accedemos en el navegador a la url http://localhost:3000

![start_ruby_on_rails](https://image.ibb.co/faMhA6/start_ruby_on_rails.png)


                                      YA TENEMOS NUESTRO RAILS CORRIENDO !!


Para apagar el servidor Ctrl-C

## Para el trabajo con contenedores

Cuando tengamos que trabaja tenemos un terminal abierto arrancaremos el contenedor **./runDocker.sh**
 trabajamos los comando de rails dentro de contenedor, y los archivos desde fuera

    rails server    o    rails s

## Algunos comando de Rails

### Mostrar las rutas creadas

    rake routes

### Ejemplos de scaffold

   rails generate scaffold Post titulo:string contenido:text user_id:integer

## Ejecutar las migraciones

    rake db:migrate
