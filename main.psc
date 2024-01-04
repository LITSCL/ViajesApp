Algoritmo main
	
	Definir __cantidad_pasajeros Como Numero
	Definir __cantidad_hombres Como Numero
	Definir __cantidad_mujeres Como Numero
	Definir __cantidad_nacionales Como Numero
	Definir __cantidad_extranjeros Como Numero
	Definir __cantidad_menores Como Numero
	Definir __cantidad_mayores Como Numero
	Definir __edad_acumulada Como Numero
	
	Definir __nombre Como Texto
	Definir __nacionalidad Como Texto
	Definir __genero Como Texto
	Definir __edad Como Texto
	
	__seguir = Verdadero
	Mientras __seguir == Verdadero Hacer
		Escribir "¿Que desea hacer?"
		Escribir "1. Registrar un viaje"
		Escribir "2. Mostrar datos"
		Escribir "0. Salir"
		Leer __opcion
		Segun __opcion Hacer
			Caso, "0":
				__seguir = Falso
			Caso, "1":
				__agregar = Verdadero
				__contador = 0
				Mientras __agregar == Verdadero Hacer
					__validado = Falso
					Mientras __validado == Falso Hacer
						Escribir "Ingrese el nombre del pasajero" , " " , "[" , __contador + 1 , "]" , ":"
						Leer __nombre
						Si 	__simulacion_trim(__nombre) <> "" Entonces
							__validado = Verdadero
						SiNo
							Escribir "ERROR: El nombre ingresado no es valido"
						FinSi
					FinMientras
					
					__validado = Falso
					
					Mientras __validado == Falso Hacer
						Escribir "¿Cual es la nacionalidad del pasajero" , " " , "[" , __contador + 1 , "]" , "?"
						Escribir "1. Nacional"
						Escribir "2. Extranjero"
						Leer __nacionalidad
						Si __nacionalidad == "1" o __nacionalidad == "2" Entonces
							__validado = Verdadero
						SiNo
							Escribir "ERROR: La opcion seleccionada no es valida"
						FinSi
					FinMientras
					
					__validado = Falso
					
					Mientras __validado == Falso Hacer
						Escribir "¿Cual es el genero pasajero" , " " , "[" , __contador + 1 , "]" , "?"
						Escribir "1. Hombre"
						Escribir "2. Mujer"
						Leer __genero
						Si __genero == "1" o __genero == "2" Entonces
							__validado = Verdadero
						SiNo
							Escribir "ERROR: La opcion seleccionada no es valida"
						FinSi
					FinMientras
					
					__validado = Falso
					
					Mientras __validado == Falso Hacer
						Escribir "Ingrese la edad del pasajero" , " " , "[" , __contador + 1 , "]" , ": (0/150)"
						Leer __edad
						Si __validar_numero(__edad) == Verdadero Entonces
							Si ConvertirANumero(__edad) >= 0 y ConvertirANumero(__edad) <= 150 Entonces
								__validado = Verdadero
							SiNo
								Escribir "ERROR: La edad no está dentro del rango"
							FinSi
						SiNo
							Escribir "ERROR: Debe ingresar un número válido"
						FinSi
					FinMientras
					
					__validado = Falso
					
					Si __nacionalidad == "1" Entonces
						__cantidad_nacionales = __cantidad_nacionales + 1
					SiNo
						__cantidad_extranjeros = __cantidad_extranjeros + 1
					FinSi
					
					Si __genero == "1" Entonces
						__cantidad_hombres = __cantidad_hombres + 1
					SiNo
						__cantidad_mujeres = __cantidad_mujeres + 1
					FinSi
					
					Si ConvertirANumero(__edad) >= 18 Entonces
						__cantidad_mayores = __cantidad_mayores + 1
					SiNo
						__cantidad_menores = __cantidad_menores + 1
					FinSi
					
					__edad_acumulada = __edad_acumulada + ConvertirANumero(__edad)
					__cantidad_pasajeros = __cantidad_pasajeros + 1
					
					__contador = __contador + 1
					
					Si __contador == 10 Entonces
						Escribir "!Viaje listo¡"
						__agregar = Falso
					SiNo
						__subir = ""
						Mientras __validado == Falso Hacer
							Escribir "¿Se subirá otro pasajero?"
							Escribir "1. Si"
							Escribir "2. No"
							Leer __subir
							Si __subir == "1" o __subir == "2" Entonces
								__validado = Verdadero
							SiNo
								Escribir "ERROR: La opcion seleccionada no es valida"
							FinSi
						FinMientras
						Si __subir == "2" Entonces
							Escribir "!Viaje listo¡"
							__agregar = Falso
						FinSi
					FinSi
				FinMientras
			Caso, "2":
				Si __cantidad_pasajeros <> 0 Entonces
					Escribir "Cantidad Pasajeros: " , __cantidad_pasajeros
					Escribir "Cantidad Hombres: " , __cantidad_hombres
					Escribir "Promedio Hombres: " , redon((__cantidad_hombres / __cantidad_pasajeros) * 100) , "%"
					Escribir "Cantidad Mujeres: " , __cantidad_mujeres
					Escribir "Promedio Mujeres: " , redon((__cantidad_mujeres / __cantidad_pasajeros) * 100) , "%"
					Escribir "Cantidad Nacionales: " , __cantidad_nacionales
					Escribir "Promedio Nacionales: " , redon((__cantidad_nacionales / __cantidad_pasajeros) * 100) , "%"
					Escribir "Cantidad Extranjeros: " , __cantidad_extranjeros
					Escribir "Promedio Extranjeros: " , redon((__cantidad_extranjeros / __cantidad_pasajeros) * 100) , "%"
					Escribir "Cantidad Menores: " , __cantidad_menores
					Escribir "Promedio Menores: " , redon((__cantidad_menores / __cantidad_pasajeros) * 100) , "%"
					Escribir "Cantidad Mayores: " , __cantidad_mayores
					Escribir "Promedio Mayores: " , redon((__cantidad_mayores / __cantidad_pasajeros) * 100) , "%"
					Escribir "Edad Promedio: " , redon((__edad_acumulada / __cantidad_pasajeros))
				SiNo
					Escribir "ERROR: No hay datos que mostrar"
				FinSi
			De Otro Modo:
				Escribir "ERROR: La opcion seleccionada no es valida"
		FinSegun
	FinMientras
	
FinAlgoritmo

Funcion __validado <- __validar_numero(__numero)
	__validado = Verdadero
	Para i = 1 Hasta Longitud(__numero) Con Paso 1 Hacer
		__v = Subcadena(__numero, i, i)
		Si __v <> "0" y __v <> "1" y __v <> "2" y __v <> "3" y __v <> "4" y __v <> "5" y __v <> "6" y __v <> "7" y __v <> "8" y __v <> "9" Entonces
			__validado = Falso
		FinSi
	FinPara
FinFuncion

Funcion __cadena <- __simulacion_trim(__cadena)
	Mientras Subcadena(__cadena, 1, 1) == " " Hacer
		__cadena = Subcadena(__cadena, 2, Longitud(__cadena))
	FinMientras
	Mientras Subcadena(__cadena, Longitud(__cadena), Longitud(__cadena)) == " " Hacer
		__cadena = Subcadena(__cadena, 1, Longitud(__cadena) - 1)
	FinMientras
FinFuncion