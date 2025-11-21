Algoritmo ProcesoTicTacToe
    Definir opc Como Entero;
    Definir dummy Como Caracter; // Variable para esperar Enter
	
    opc <- 0;
	
    Mientras opc <> 3 Hacer
        // Mostrar menú
        Borrar Pantalla;
        Escribir "????????????????????????????";
        Escribir "?      TIC TAC TOE         ?";
        Escribir "????????????????????????????";
        Escribir "? 1. Jugar (2 Jugadores)   ?";
        Escribir "? 2. Instrucciones         ?";
        Escribir "? 3. Salir                 ?";
        Escribir "????????????????????????????";
        Escribir "Seleccione una opción:";
        Leer opc;
		
        Segun opc Hacer
            1:
                // --- Inicio del juego de 2 Jugadores ---
                Dimension tictactoe(3,3);
				
                // Inicializar tablero
                Para i<-1 Hasta 3 Con Paso 1 Hacer
                    Para j<-1 Hasta 3 Con Paso 1 Hacer
                        tictactoe[i,j] <- ' ';
                    FinPara
                FinPara
				
                ganador <- ' ';
                turno_jugador1 <- Verdadero; // True = Jugador 1 (X), False = Jugador 2 (O)
                turnos <- 0;
                max_turnos <- 9;
				
                Mientras turnos < max_turnos Y ganador <> 'X' Y ganador <> 'O' Hacer
                    // Imprimir cuadrícula antes de cada turno
                    Borrar Pantalla;
                    Escribir "      +---+---+---+";
                    Escribir "      | 1 | 2 | 3 |";
                    Escribir "      +---+---+---+";
                    Escribir "";
                    Escribir "+-+   +---+---+---+";
                    Para k<-1 Hasta 3 Con Paso 1 Hacer
                        Si k <> 1 Entonces
                            Escribir "+-+   +---+---+---+";
                        FinSi
                        Escribir Sin Saltar "|", k, "|   |";
                        Para l<-1 Hasta 3 Con Paso 1 Hacer
                            Escribir Sin Saltar " ", tictactoe[k,l], " |";
                        FinPara
                        Escribir "";
                    FinPara
                    Escribir "+-+   +---+---+---+";
                    Escribir "";
					
                    // Turno del jugador
                    Si turno_jugador1 Entonces
                        Escribir "Turno del Jugador 1 (X)";
                        SimularTurnoJugador(tictactoe, 'X');
                    Sino
                        Escribir "Turno del Jugador 2 (O)";
                        SimularTurnoJugador(tictactoe, 'O');
                    FinSi
					
                    // Verificar ganador después del turno
                    ganador <- VerificarGanadorDosJugadores(tictactoe);
					
                    // Cambiar turno
                    turno_jugador1 <- No turno_jugador1;
                    turnos <- turnos + 1;
                FinMientras
				
                // Mostrar tablero final
                Borrar Pantalla;
                Escribir "      +---+---+---+";
                Escribir "      | 1 | 2 | 3 |";
                Escribir "      +---+---+---+";
                Escribir "";
                Escribir "+-+   +---+---+---+";
                Para k<-1 Hasta 3 Con Paso 1 Hacer
                    Si k <> 1 Entonces
                        Escribir "+-+   +---+---+---+";
                    FinSi
                    Escribir Sin Saltar "|", k, "|   |";
                    Para l<-1 Hasta 3 Con Paso 1 Hacer
                        Escribir Sin Saltar " ", tictactoe[k,l], " |";
                    FinPara
                    Escribir "";
                FinPara
                Escribir "+-+   +---+---+---+";
                Escribir "";
				
                // Mostrar resultado
                Segun ganador Hacer
                    'X':
                        Escribir "¡Felicitaciones! Jugador 1 (X) ha ganado.";
                    'O':
                        Escribir "¡Felicitaciones! Jugador 2 (O) ha ganado.";
                    ' ':
                        Escribir "Empate.";
                FinSegun
                // --- Fin del juego ---
				
            2:
                // Mostrar instrucciones
                Borrar Pantalla;
                Escribir "INSTRUCCIONES DEL JUEGO (2 Jugadores)";
                Escribir "";
                Escribir "1. El tablero es una cuadrícula de 3x3.";
                Escribir "2. El Jugador 1 usa X y el Jugador 2 usa 0.";
                Escribir "3. Se turnan para colocar su símbolo.";
                Escribir "4. En su turno, seleccione fila y columna (1-3).";
                Escribir "5. Gana quien alinee 3 símbolos iguales en línea.";
                Escribir "6. Empate si se llenan los 9 espacios sin ganador.";
				
            3:
                Escribir "¡Gracias por jugar! Hasta luego.";
				
            De Otro Modo:
                Escribir "Opción no válida. Intente de nuevo.";
        FinSegun;
		
        Si opcion <> 3 Entonces
            Escribir "";
            Escribir "Presione Enter para continuar...";
            Leer dummy; // Solo LEES la variable, no la defines de nuevo
        FinSi
    FinMientras
FinAlgoritmo

// Subproceso auxiliar para manejar la entrada del jugador
SubProceso SimularTurnoJugador(tablero, simbolo_jugador)
    Definir fila, columna Como Entero;
    Definir casilla_valida Como Logico;
    casilla_valida <- Falso;
	
    Mientras No casilla_valida Hacer
        // Leer fila
        Repetir
            Escribir Sin Saltar "Fila (1-3): ";
            Leer fila;
            Si fila<1 O fila>3 Entonces
                Escribir "Número inválido. Intente de nuevo.";
            FinSi
        Hasta Que fila>=1 Y fila<=3;
		
        // Leer columna
        Repetir
            Escribir Sin Saltar "Columna (1-3): ";
            Leer columna;
            Si columna<1 O columna>3 Entonces
                Escribir "Número inválido. Intente de nuevo.";
            FinSi
        Hasta Que columna>=1 Y columna<=3;
		
        // Verificar si la casilla está vacía
        Si tablero[fila, columna] = ' ' Entonces
            tablero[fila, columna] <- simbolo_jugador;
            casilla_valida <- Verdadero;
        Sino
            Escribir "Casilla ocupada. Elija otra.";
            Escribir "";
        FinSi
    FinMientras
FinSubProceso

// Subproceso auxiliar para verificar ganador
Funcion ganador <- VerificarGanadorDosJugadores(tablero)
    Definir ganador Como Caracter;
    Definir i, j Como Entero; // Asegura que i y j estén definidos si no lo están en otro lado
    ganador <- ' '; // Inicializa como empate
	
    // Verificar filas
    Para i<-1 Hasta 3 Con Paso 1 Hacer
        Si tablero[i,1] <> ' ' Y tablero[i,1] = tablero[i,2] Y tablero[i,2] = tablero[i,3] Entonces
            ganador <- tablero[i,1]; // Se encontró un ganador
            // No usamos Retornar aquí, simplemente asignamos y dejamos que el bucle termine
            // Para salir del bucle, podemos usar una bandera o solo dejar que termine
            // Para simplificar, asumimos que solo hay un ganador posible por turno
        FinSi
    FinPara
	
    // Verificar columnas
    Para j<-1 Hasta 3 Con Paso 1 Hacer
        Si ganador = ' ' Y tablero[1,j] <> ' ' Y tablero[1,j] = tablero[2,j] Y tablero[2,j] = tablero[3,j] Entonces
            ganador <- tablero[1,j];
        FinSi
    FinPara
	
    // Verificar diagonal principal (solo si aún no hay ganador)
    Si ganador = ' ' Y tablero[1,1] <> ' ' Y tablero[1,1] = tablero[2,2] Y tablero[2,2] = tablero[3,3] Entonces
        ganador <- tablero[1,1];
    FinSi
	
    // Verificar diagonal secundaria (solo si aún no hay ganador)
    Si ganador = ' ' Y tablero[1,3] <> ' ' Y tablero[1,3] = tablero[2,2] Y tablero[2,2] = tablero[3,1] Entonces
        ganador <- tablero[1,3];
    FinSi
FinFuncion
