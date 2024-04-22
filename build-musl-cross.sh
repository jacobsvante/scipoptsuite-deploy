#/usr/bin/env sh

set -e

DIRNAME=musl-cross/$(date +%Y-%m-%d-%H.%M.%S)
DOCKERFILE=Dockerfile.musl-cross
DOCKER_IMAGE_NAME=musl-cross-scip-test

mkdir -p $DIRNAME
cp $DOCKERFILE $DIRNAME/
md5 -q $DOCKERFILE > $DIRNAME/$DOCKERFILE.md5
echo "$@" > $DIRNAME/extra-args-passed.txt
docker buildx build --progress=plain -f $DOCKERFILE -t $DOCKER_IMAGE_NAME "$@" . 2>&1 \
    | tee $DIRNAME/build.log
