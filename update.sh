#!/bin/sh

set -e

ROOT=/var/www/rxr.whitequark.org/

for i in mri jruby rubinius; do
  [ -f $ROOT/ruby/$i/HEAD ] && git fetch -t && git pull
  cat <<END | mysql -u rxr -pXXXXXXXXX rxr_$i
truncate lxr_declarations;
truncate lxr_files;
truncate lxr_indexes;
truncate lxr_releases;
truncate lxr_status;
truncate lxr_symbols;
truncate lxr_usage;
END
  cd $ROOT/lxr && ./genxref --url=http://rxr.whitequark.org/$i --allversions >/dev/null
done
