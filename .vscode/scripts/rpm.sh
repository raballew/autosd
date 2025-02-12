#!/bin/bash

build() {
    echo $1
    name=$(grep '^Name:' $1 | awk '{print $2}')
    version=$(grep '^Version:' $1 | awk '{print $2}')

    git archive HEAD . --prefix=$name-$version/ --output=$name-$version.tar.gz
    mv $name-$version.tar.gz ~/rpmbuild/SOURCES/

    rpmbuild -ba $1
}

specs="$@"

rpmdev-setuptree

for spec in $specs
do
   build $spec
done

mkdir -p /var/tmp/local_repo
cp -rp ~/rpmbuild/RPMS/* /var/tmp/local_repo
createrepo /var/tmp/local_repo
