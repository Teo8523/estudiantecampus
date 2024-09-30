//funcionar menu //
funcion opc = menu 
	Escribir "========BIENVENIDO========="
	Escribir "INGRESA LA OPCION QUE QUIERES REALIZAR"
	Escribir " 1. REGISTRO DE ESTUDIANTES "
	Escribir " 2. INGRESO DE NOTAS "
	Escribir " 3. REGISTRO DE ASISTENCIA"
	Escribir " 4. LISTADO DE ESTUDIANTES "
	Escribir " 5. CALCULAR NOTA FINAL"
	Escribir "==========********==============="
	Leer opc 
FinFuncion 

//funcion de resgistrar estudiante 
Funcion registroestudainte(dbestudiante,i)
	
	Repetir
		Escribir "INGRESA EL CODIGO DEL ESTUDIANTE: "
		Leer codigo
		existe = Falso
		Para j=1 Hasta i Hacer //  iniciar busqueda si el codigo existe //
			si dbestudiante[i,1] = codigo Entonces
				Escribir "ERROR:: EL CODIGO YA EXISTE"
				existe = Verdadero
			FinSi
		FinPara
	Hasta Que existe = falso 
	dbestudiante[i,1] = codigo 
	Escribir "INGRESA EL NOMBRE DEL ESTUDIANTE: "
	leer dbestudiante[i,2] = nombre 
	i = i+1 
FinFuncion
//funcion de registrar notas// 
Funcion ingresonotas(dbnotas,dbestudiante,i)
	
	Repetir
		Escribir "ingresa el codigo del estudiante: "
		Leer codigo 
		existe = Falso
		para j=1 hasta i Hacer
			si dbestudiante[i,1]  <> codigo Entonces
				Escribir "ERROR: EL CODIGO INGRESADO NO ESTA"
				existe = Verdadero
			FinSi
		FinPara
	Hasta Que  existe = Falso
	dbestudiante[i,1] = codigo 
	Escribir "INGRESA LA PRIMERA NOTA: "
	Leer dbnotas[i,1] = nota1
	Escribir "INGRESA LA SEGUNDA NOTA: "
	Leer dbnotas[i,2] = nota2
	Escribir "INGRESA LA TERCERA  NOTA: "
	Leer dbnotas[i,3] = nota3
	
	Escribir "=== LA NOTAS INGRESADAS==="
	Escribir " CODIGO: " , dbestudiante[i,1]
	Escribir " NOMBRE: " , dbestudiante[i,2]
	Escribir " NOTA 1: " , dbnotas[i,1]
	Escribir " NOTA 2: " , dbnotas[i,2]
	Escribir " NOTA 3: " , dbnotas[i,3]
	i = i+1
FinFuncion
// Funcion registrar asistencia//
Funcion  registroasistencia(dbestudiante,dbasistencia,i)
	Repetir
		Escribir "ingresa el codigo del estudiante:" 
		Leer codigo
		existe = Falso
		para j=1 Hasta i Hacer
			si dbestudiante[i,1] <> codigo Entonces
				Escribir "ERROR: EL CODIGO INGRESADO NO ESTA"
				existe = Verdadero
			FinSi
		FinPara
	Hasta Que existe = falso 
	dbestudiante[i,1] = codigo 
	Repetir
		Escribir "NOMBRE DEL ESTUDIANTE"
		Leer dbestudiante[i,2] = nombre 
		Parar = "s"
		Escribir "El ESTUDIANTE ASISTIO A CLASES: SI / NO "
		Leer asistencia 
		si asistencia  = "SI" Entonces
			Escribir "ASISTENCIA EXITOSA"
		SiNo
			Escribir "ingresa la falla con un numero: "
			Leer dbasistencia[i,2] = falla 
			i= i+1
		FinSi
		Escribir "QUIERES AGREGAR OTRA : s/n"
		Leer parar 
	Hasta Que parar = "n"
	
	

FinFuncion
//funcion de moostrar lista // 
Funcion listaestudiante(dbnotas,dbestudiante,dbasistencia,i)
	para j = 1 Hasta i Hacer
		Escribir "CODIGO: " ,dbestudiante[i,1] 
		Escribir "NOMBRE: " ,dbestudiante[i,2] 
		Escribir "NOTA 1: " ,dbnotas[i,1] 
		Escribir "NOTA 2: " ,dbnotas[i,2] 
		Escribir "NOTA 3: " ,dbnotas[i,3]
		Escribir "FALLA A CLASES: " , dbasistencia[i,2]
		Escribir "NOTA FINAL " totalnota 
	FinPara
	
FinFuncion
//funcion calcular nota //
Funcion calcularnota(dbnotas,dbestudiante,dbasistencia,i)
	Repetir
		Escribir "INGRES EL CODIGO DEL ESTUDIANTE:"
		Leer codigo 
		encontrado= Falso
		Para j=1 Hasta i Hacer
			si dbestudiante[i,1] <>codigo Entonces
				Escribir "ERROR EL CODIGO NO ESTA REGISTRADO"
				encontrado = Verdadero
			FinSi
		FinPara
	Hasta Que  existe = Falso
	dbestudiante[i,1] = codigo 
	nota1 = dbnotas[i,1]
	nota2 = dbnotas[i,2]
	nota3 = dbnotas[i,3]
	totalnota = (nota1 + nota2 + nota3)/3
	si  dbasistencia[i,2]  > 15 Entonces
		notafinal = (totalnota )- 1 
		Escribir "tu nota final es: " , notafinal 
	FinSi
	Escribir "TU nota final es:" , totalnota 
	Escribir "TU nota total final es:" , notafinal 

	
FinFuncion


Algoritmo estudiante 
	continuar = "s"
	Dimensionar dbestudiante[10,2]
	Dimensionar dbnotas[10,3]
	Dimensionar dbasistencia[10,2]
	i = 1 
 
	Repetir
		opc = menu 
		Segun opc Hacer
			1:
				Escribir "======= REGISTRO DE ESTUDIANTES========="
				registroestudainte(dbestudiante,i)
			2:
				Escribir "======= INGRESO DE NOTAS =============="
				ingresonotas(dbnotas,dbestudiante,i)
			3:
				Escribir "====== INGRESO DE ASISTENCIA============"
				registroasistencia(dbestudiante,dbasistencia,i)
			4:
				Escribir "======= LISTADO DE ESTUDIANTES ========="
				listaestudiante(dbnotas,dbestudiante,dbasistencia,i)
			5:
				Escribir "====== CALCULAR LA NOTA FINAL =========="
				calcularnota(dbnotas,dbestudiante,dbasistencia,i)
				
		FinSegun
		Escribir "Desean continuar con otra opcion: s/n"
		Leer continuar 
	Hasta Que continuar = "n"
	
FinAlgoritmo
