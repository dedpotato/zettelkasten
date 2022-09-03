#!/bin/bash

#formar el nombre unico del documento
identificacion=$(date +'%s')
titulo=[${identificacion}].md

#abrir vim para hacer la nota
edit "$titulo"

bash analiza.sh $titulo

cat "$titulo"
