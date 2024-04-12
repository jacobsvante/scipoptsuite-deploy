#/usr/bin/env sh
# Script that builds Dockerfile.musl-cross and records the file and Docker' output.
# Useful when trying to optimize the build, to see which flags worked and which didn't.
# Expected to run from scipoptsuite-deploy base dir as such:
#     ./helpers/build-musl-cross.sh
# All arguments passed to the script are forwarded to `docker buildx build`.

set -e

DIRNAME=musl-cross/$(date +%Y-%m-%d-%H.%M.%S)
DOCKERFILE=Dockerfile.musl-cross
DOCKER_IMAGE_NAME=musl-cross-scip-test

mkdir -p $DIRNAME
cp $DOCKERFILE $DIRNAME/
md5 -q $DOCKERFILE > $DIRNAME/$DOCKERFILE.md5
echo "$@" > $DIRNAME/extra-args-passed.txt
docker buildx build --progress=plain -f $DOCKERFILE -t $DOCKER_IMAGE_NAME \
    --output=$DIRNAME/output "$@" . 2>&1 | tee $DIRNAME/build.log
