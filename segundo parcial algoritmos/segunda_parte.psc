Algoritmo ReporteVentas
	
	Definir v1, v2, v3, total, promedio Como Real
	Definir categoria Como Cadena
	
	// Leer las tres ventas
	v1 <- leer_venta("Primera")
	v2 <- leer_venta("Segunda")
	v3 <- leer_venta("Tercera")
	
	// Calcular total y promedio
	total <- v1 + v2 + v3
	promedio <- total / 3
	
	// Clasificar ventas
	Si total < 300000 Entonces
		categoria <- "Bajas ventas"
	Sino
		Si total <= 700000 Entonces
			categoria <- "Ventas regulares"
		Sino
			categoria <- "Buenas ventas"
		FinSi
	FinSi
	
		// Mostrar resultados
		Escribir "Total de ventas: ", total
		Escribir "Promedio de ventas: ", promedio
		Escribir "Clasificación del día: ", categoria
		
FinAlgoritmo

Funcion valor <- leer_venta(mensaje)
	Escribir "Ingrese el monto de la ", mensaje, " venta:"
	Leer valor
FinFuncion