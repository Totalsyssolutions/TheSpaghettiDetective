#!/bin/sh
for i in $(seq 1 $1)
do
time curl 'http://127.0.0.1:3333//p/?img=http://url_to_an_img' &
done
