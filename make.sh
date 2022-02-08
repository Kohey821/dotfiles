#!/bin/bash

cd $(dirname $0)

directories=('main')

for i in ${directories[@]}; do
  for j in $(\ls -a -1 $i); do
    if test \
      $j = '.' \
      -o $j = '..'
    then
      continue
    fi

    if test \
      $j = 'nvim' \
      -o $j = 'fish'
    then
      ln -sfnv $(pwd)/$i/$j ${HOME}/.config/

      continue
    fi

    ln -sfnv $(pwd)/$i/$j ~/
  done
done
