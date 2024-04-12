#!/usr/bin/env sh
#
# [ $(ldd ./soplex | wc -l) -eq 1 ] && [ $(ldd ./soplex) -eq "statically linked" ] || (ldd ./scip && exit 1)
#
set +x
ls -ahl /
ls -ahl /usr/bin/soplex
file /usr/bin/soplex
ldd /usr/bin/soplex
/usr/bin/soplex --help
ls -ahl /usr/bin/scip
file /usr/bin/scip
ldd /usr/bin/scip
/usr/bin/scip --version
