Roulette desafío NNodes
==

Se debe realizar una simulación, la cual consiste en un grupo dinámico de personas jugando a la ruleta. El objetivo es crear un sistema para monitorear una mesa de casino, donde los jugadores modifican sus apuestas dependiendo del clima.

Modelo
--

Se construyó un modelo con cuatro entidades: 'Game' para almacenar las partidas, 'Bet' para almacenar las apuestas, 'Player' para manejar los jugadores y 'Forecast' para almacenar el pronóstico del clima.

![alt tag](https://raw.github.com/mariowise/nnodes-roulette-challenge/master/model.png)


Running
--

Para ejecutar el proyecto es necesario tener `ruby@2.1` y `rails@4.2.5`. A partir de ello, y para ejecutarlo en ambiente de desarrollo, 

	$ bundle
	$ rails s

Para ejecutar tareas cada cierta cantidad de tiempo se hizo uso de la herramienta `whenever` que hace uso del `crontab` del sistema operativo. 

Para producción se utilizó `Docker`.


Todo
--

* ~~Deben existir vistas que permitan ingresar jugadores, a los cuales se les pueden modificar sus datos y cantidad de dinero que poseen.~~

* ~~Los jugadores parten con una cantidad de $10.000 por defecto.~~

* ~~Los jugadores participan de una partida de ruleta automáticamente, cada 3 minutos.~~

* ~~En cada ronda los jugadores apuestan entre un 8% y 15% del total de dinero que poseen. Si tienen $1.000 o menos, van All In. Si no les queda dinero, no apuestan.~~

* ~~La apuesta puede variar dependiendo del clima de Santiago de Chile, por lo que se debe consultar alguna API, y en caso de que esté pronosticado lluvia dentro de los próximos 7 días, las apuestas son más conservadoras y cambian a un valor aleatorio entre 4% y 10%.~~

* ~~El modo de apuesta es el siguiente, un jugador puede apostar a Verde, Rojo o Negro con un 2%, 44% y 44% de probabilidad respectivamente.~~

* ~~Un jugador recupera el doble de lo apostado si acierta su apuesta, cuando ésta sea Rojo o Negro, y recupera 15 veces lo apostado en caso de acertar Verde. En caso de perder la apuesta, no recupera nada.~~

* ~~La ruleta entrega resultados con la misma probabilidad que los jugadores hacen apuestas, es decir, Verde 2%, Rojo 44% y Negro 44%.~~

* ~~Al final de cada día,todos los jugadores reciben $10.000.~~

* ~~Debe existir una vista donde se muestren todas las rondas transcurridas, con la apuesta de cada jugador y el resultado de la ruleta.~~

* ~~La URL principal de la aplicación debe ser esta vista.~~

* ~~El diseño no se evaluará.~~

* ~~Cualquier otra funcionalidad no mencionada se considera en la evaluación, pero no es obligatoria.~~

* ~~Cualquier cosa no especificada queda a criterio del desarrollador.~~


Testing
--

Se construyeron 13 test con la herramienta `rspec` para validar el comportamiento de algunos de los modelos.

	$ rspec . # Toma ~15 segundos con un Mac 16 GB RAM y SSD

