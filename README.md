# zettelkasten
son un par de funciones que hacen lo minimo necesario para tener un zettelkasten funcional

si no sabes lo que es un zettelkasten ve a [investigar](https://en.wikipedia.org/wiki/Zettelkasten)

este zettelkasten se basa en el hecho de que puedas acceder a hipervinculos y leer el texto formateado

formato de etiquetas:

#ETIQUETA Y ETIQUETA #OTRA ETIQUETA DISTINTA

los espacios dentro de una etiqueta están permitidos

las etiquetas deben estar seguidas y separadas del resto del texto por 2 \n

el texto va a estar en formato markdown, el primer título en formato 
(# título)
sera tomado como el segundo nombre del documento en etiquetas.md

la funcion analiza.sh va a revisar los documentos que tu le pongas (todos los documentos si es que no pones nada) y los agregará al documento etiquetas.md

la función nueva_entrada.sh le dara un nombre único a cada documento (el segundo en el que la función empezó) y los pasará a la función analiza.sh para agregarlo en el documento etiquetas.md
