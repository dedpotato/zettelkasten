#!/bin/bash
titulo_archivo_etiquetas='etiquetas.md'
if [ -z $1 ]
then
	#si no tiene argumentos
	echo '' > $titulo_archivo_etiquetas
	bash ./analiza.sh [*
	#]este comentario es para asegurarse de que vim  no formatee mal el resto del documento
else

	#define al separador para el grep
	IFS=$'\n'

	#buscar etiquetas y links
	etiquetas=($(grep -HoP '(#\w[\w\s]*\w)|(\[[0-9]*\]\.\w+)' "$@"))
	
	#abre el archivo de etiquetas si no existe
	touch $titulo_archivo_etiquetas

	for i in ${etiquetas[@]}
	do
		#obtiene las conecciones que hay en el documento
		IFS=: read -r archivo_fuente etiquetaolink <<<$i

		#echo $archivo_fuente
		#echo $etiquetaolink
		titulo_ausar=$etiquetaolink
		if [[ $etiquetaolink == [* ]]
		then
			titulo_ausar='['"$etiquetaolink"', '"$(grep -oP --max-count=1 "(?<=\# ).*" $etiquetaolink)"']('"$etiquetaolink"')'
		fi
		catas=$(grep --max-count=1 "$titulo_ausar" $titulo_archivo_etiquetas)
		
		if [ -z $catas ]
		then
			
			echo "$titulo_ausar"' : ['"$archivo_fuente"']('"$archivo_fuente"')  ' >> "$titulo_archivo_etiquetas"
		else
			sed -i "/$titulo_ausar/s/  / [$archivo_fuente]($archivo_fuente)  /" "$titulo_archivo_etiquetas"
		fi

		#busca si el link existe

	done
	#declare -p etiquetas
	#agregarlos a la lista de etiquetas

fi
