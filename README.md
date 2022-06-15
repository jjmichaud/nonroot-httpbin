nonroot-httpbin
===============

This is based on https://httpbin.org/
- Github: https://github.com/postmanlabs/httpbin
- Docker: https://hub.docker.com/r/kennethreitz/httpbin/

The standard `httpbin` has the container start up on port 80, which requires `root` in order to run.

For OKD/Openshift it is preferable to run containers as an arbitrary user and NOT `root`. We have changed the port to use to be port 8080, which should be allowed to be exposed by any user


Build image
```
docker login
make
```


Prints out commands to push the image
```
make push
```

