docker run -it --rm \
--name=myapp \
-p 3000:3000 \
-v $PWD:/home/myuser/app \
-v $PWD/_bundle:/usr/local/bundle \
myruby \
/bin/bash
