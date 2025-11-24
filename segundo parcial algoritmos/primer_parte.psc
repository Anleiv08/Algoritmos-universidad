Algoritmo promedio_notas
		Definir materias, estudiantes_por_materia, i, j, contador_global Como Entero
		Definir calificacion, suma_materia, suma_global, promedio_materia Como Real
		Definir max_materia, min_materia, mejor_promedio, peor_promedio Como Real
		Definir materia_mejor, materia_peor Como Entero
		
		suma_global <- 0
		contador_global <- 0
		
		Escribir "Ingrese el número de materias: "
		Leer materias
		
		Para i <- 1 Hasta materias Hacer
			Escribir "Materia ", i
			Escribir "Ingrese el número de estudiantes: "
			Leer estudiantes_por_materia
			
			suma_materia <- 0
			max_materia <- 0
			min_materia <- 5
			
			Para j <- 1 Hasta estudiantes_por_materia Hacer
				Escribir "Ingrese calificación del estudiante ", j, ": "
				Leer calificacion
				
				// Validar que la calificación esté entre 0 y 5
				Mientras calificacion < 0 O calificacion > 5 Hacer
					Escribir "Calificación inválida. Ingrese un valor entre 0 y 5: "
					Leer calificacion
				Fin Mientras
				
				suma_materia <- suma_materia + calificacion
				
				Si calificacion > max_materia Entonces
					max_materia <- calificacion
				FinSi
				
				Si calificacion < min_materia Entonces
					min_materia <- calificacion
				FinSi
			Fin Para
			
			promedio_materia <- suma_materia / estudiantes_por_materia
			suma_global <- suma_global + suma_materia
			contador_global <- contador_global + estudiantes_por_materia
			
			// Mostrar estadísticas de la materia
			Escribir "--- Estadísticas Materia ", i, " ---"
			Escribir "Promedio: ", promedio_materia
			Escribir "Calificación más alta: ", max_materia
			Escribir "Calificación más baja: ", min_materia
			Escribir ""
			
			// Determinar mejor y peor promedio
			Si i = 1 Entonces
				mejor_promedio <- promedio_materia
				peor_promedio <- promedio_materia
				materia_mejor <- i
				materia_peor <- i
			Sino
				Si promedio_materia > mejor_promedio Entonces
					mejor_promedio <- promedio_materia
					materia_mejor <- i
				FinSi
				Si promedio_materia < peor_promedio Entonces
					peor_promedio <- promedio_materia
					materia_peor <- i
				FinSi
			FinSi
		Fin Para
		
		// Mostrar estadísticas globales
		Escribir "=== ESTADÍSTICAS GLOBALES ==="
		Escribir "Promedio global: ", suma_global / contador_global
		Escribir "Materia con mejor promedio: Materia ", materia_mejor, " (", mejor_promedio, ")"
		Escribir "Materia con peor promedio: Materia ", materia_peor, " (", peor_promedio, ")"
FinAlgoritmo
