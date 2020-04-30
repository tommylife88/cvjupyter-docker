# cvjupyter-docker

## Requirements

* 

## Running the container

Using Makefile to simplify docker commands within make commands.

### build image

```bash
$ make build
```

### start container

```bash
$ make start
```

### attach container

```bash
$ make attach
```

### stop container

```bash
$ make stop
```

### clean container and images

```bash
$ make clean
```

## Jupyter notebook example

```bash
$ make build
$ make start
$ make attach
```

Confirm token to access notebook.
```
$ docker logs <containter id>
```
