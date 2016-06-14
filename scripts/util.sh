#!/bin/bash

link_file () {
	src=$1 
	dest=$2

	echo "src: $src"
	echo "dest: $dest"

	ln -sf $src $dest
}
