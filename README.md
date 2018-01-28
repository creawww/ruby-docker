# DOCKER RUBY FOR RUBY ON RAILS

Un entorno docker para trabajar con Ruby e incluso Ruby on Rails, con DB sqlLite

## construir la imagen si no existe

Si construimos la imagen con nombre se quedara en nuestro sistema y podremos usarla para todos los proyectos que la necesitemos

    docker build . -t myruby

## arrancar el contenedor

    docker run -it --rm --name=myapp -p 3000:3000 -v $PWD:/home/myuser/app -v $PWD/_bundle:/usr/local/bundle myruby /bin/bash

Para no tener que escribir un comando tan largo he creado un .sh

create file bash **runDocker.sh**

    docker run -it --rm \
    --name=myapp \
    -p 3000:3000 \
    -v $PWD:/home/myuser/app \
    -v $PWD/_bundle:/usr/local/bundle \
    myruby \
    /bin/bash

darle permisos de ejecucion **chmod +x runDocker.sh**, ya podemos ejecutar simplemente;

    ./runDocker.sh

Cuando ejecutamos el script o el comando se nos abre un terminal y estamos dentro del contenedor en el que tenemos Ruby, y comparte con nuestro equipo la carpeta actual y la carpeta _bundle, donde se le dan persistencia a las gemas.

Tenemos que trabajar los comando Ruby dentro del contenedor

# Ejemplo de iniciar app Ruby on rails

    gem install rails

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

# Para el trabajo con el contenedor Ruby

Cuando tengamos que trabaja tenemos un terminal abierto arrancaremos el contenedor **./runDocker.sh**
 trabajamos los comando de rails dentro de contenedor, y los archivos desde fuera

    rails server
    bundle install
    rake db:migrate
    rspec
    ...

Abriremos con nuestro editor los archivos de la carpeta y los cambios se actualizan impediatamente al tener los volumenes vinculados con el contenedor.
