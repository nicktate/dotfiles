#!/bin/bash

link_file () {
	src=$1
	dest=$2

    # TODO - friendly linking based on file existance

	ln -sf $src $dest
}
