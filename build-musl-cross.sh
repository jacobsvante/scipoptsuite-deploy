#/usr/bin/env sh
# Script that builds Dockerfile.musl-cross and records the file and Docker' output.
# Useful when trying to optimize the build, to see which flags worked and which didn't.

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
docker run --rm $DOCKER_IMAGE_NAME ls -ahl scip_install/bin > $DIRNAME/ls-ahl-output.txt
docker run --rm $DOCKER_IMAGE_NAME ls -ahl scip_install/lib >> $DIRNAME/ls-ahl-output.txt
docker run --rm $DOCKER_IMAGE_NAME ldd scip_install/bin/soplex > $DIRNAME/ldd-output.txt
docker run --rm $DOCKER_IMAGE_NAME ldd scip_install/bin/scip >> $DIRNAME/ldd-output.txt
docker run --rm $DOCKER_IMAGE_NAME file scip_install/bin/soplex > $DIRNAME/file-output.txt
docker run --rm $DOCKER_IMAGE_NAME file scip_install/bin/scip >> $DIRNAME/file-output.txt
