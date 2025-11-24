Algoritmo EdadesPorPromedio
	
    Definir n, i, cantMenores, cantMayores Como Entero
    Definir promedio Como Real
	
    Escribir "Ingrese la cantidad de edades:"
    Leer n
	
    // Dimensionar arreglos (índices de 1 a n)
    Dimension edades[n]
    Dimension menores[n]
    Dimension mayores[n]
	
    llenarVector(edades, n)
	
    Escribir "Vector original:"
    mostrarVector(edades, n)
	
    promedio = calcularPromedio(edades, n)
    Escribir "Promedio de edades: ", promedio
	
    separarPorPromedio(edades, n, promedio, menores, mayores, cantMenores, cantMayores)
	
    Escribir "Edades menores o iguales al promedio:"
    mostrarVector(menores, cantMenores)
	
    Escribir "Edades mayores al promedio:"
    mostrarVector(mayores, cantMayores)
	
FinAlgoritmo

SubProceso llenarVector(vector Por Referencia, n)
    Definir i Como Entero
    Para i = 1 Hasta n Hacer
        Escribir "Ingrese la edad ", i, ":"
        Leer vector[i]
    FinPara
FinSubProceso

SubProceso mostrarVector(vector, n)
    Definir i Como Entero
    Si n <= 0 Entonces
        Escribir "(Vector vacío)"
    Sino
        Para i = 1 Hasta n Hacer
            Escribir Sin Saltar vector[i], " "
        FinPara
        Escribir ""
    FinSi
FinSubProceso

Funcion prom <- calcularPromedio(vector, n)
    Definir i, suma Como Entero
    suma = 0
    Para i = 1 Hasta n Hacer
        suma = suma + vector[i]
    FinPara
    prom = suma / n
FinFuncion

SubProceso separarPorPromedio(vector, n, promedio, menores Por Referencia, mayores Por Referencia, cantMenores Por Referencia, cantMayores Por Referencia)
    Definir i Como Entero
    cantMenores = 0
    cantMayores = 0
	
    Para i = 1 Hasta n Hacer
        Si vector[i] <= promedio Entonces
            cantMenores = cantMenores + 1
            menores[cantMenores] = vector[i]
        Sino
            cantMayores = cantMayores + 1
            mayores[cantMayores] = vector[i]
        FinSi
    FinPara
FinSubProceso