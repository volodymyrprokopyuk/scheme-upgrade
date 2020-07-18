#!/usr/bin/env bash

set -eu

readonly ROOT_DIR=$(pwd)
readonly SOURCE_DIR=$ROOT_DIR/source
readonly SRFI_DIR=$ROOT_DIR/srfi

function scheme_source_upgrade {
    mkdir -p $SOURCE_DIR

    set +e
    read -d "" scheme_sources <<EOF
https://github.com/scheme-requests-for-implementation/srfi-133.git
EOF
    set -e

    while read scheme_source; do
        local scheme_source_dir=${scheme_source##*/}
        scheme_source_dir=${scheme_source_dir%.git}
        local scheme_source_path=$ROOT_DIR/source/$scheme_source_dir
        echo $scheme_source_path
        cd $SOURCE_DIR
        cd $scheme_source_path && git pull || git clone $scheme_source  \
            || printf "FAILURE"
    done <<<$scheme_sources
}

function scheme_source_copy {
    # SRFI-133 Vector library
    local source_path=$SOURCE_DIR/srfi-133
    cp $source_path/vectors/vectors-impl.scm $SRFI_DIR
}

scheme_source_upgrade
scheme_source_copy
