```
$ docker build .
$ docker run --rm -v (pwd):/opt/app -p 8000:8000 -it wunsh/alpine-elm:latest install
$ docker run --rm -v (pwd):/opt/app -p 8000:8000 -it wunsh/alpine-elm:latest reactor
```

access `http://localhost:8000`