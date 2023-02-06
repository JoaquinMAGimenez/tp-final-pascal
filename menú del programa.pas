menú del programa;
utiliza crt;

constante
  archivo:string = 'T_estaincias_turisticas';
tipo
registro = registro
     estancias: matriz[1..1000] de registro
     nom_estancia:STRING [60];
     apellidoyNombreD:STRING [60];
     domicilio:STRING [60];
     correo electrónico: CADENA [60];
     ESTADO: BOOLEAN;
fin;

variable
    tecla : char;
    reg : array[1..1000] de registro;
    h, cont : entero;
    f : archivo de registro;


procedimiento alta(A : entero);
   comenzar
    escribir;
    writeln('Alta[ Pulse Una Tecla ]');
    leer la clave;
    fin;

procedimiento guardar_registros(B : registro);
  comenzar
     escribir;
     writeln('guardar_registros [ Pulse Una Tecla ]');
     leer la clave;
  fin;

procedimiento carga_registros;
  comenzar
      escribir;
      writeln(' carga_registros [ Pulse Una Tecla ]');
      leer la clave;
  fin;

  procedimiento presenta_registros;
  comenzar
     escribir;
     writeln('presenta_registros [ Pulse Una Tecla ]');
     leer la clave;
  fin;

comenzar
clrscr;
	writeln('Ingrese el nombre de la estancia: ');
	readln(disco.estancia);
	writeln('Ingrese dueño');
	readln(disco.autor);
        writeln('--------Informacion Ingresada--------');
	writeln('Nombre de la estancia: ',disco.estancia);
	writeln('Dueño: ',disco.duenios);

fin;

variable
opcion:char;

comenzar
clrscr;
  writeln('--------Menú Principal---------');
  writeln('-------A-Alta--------');
  writeln('-------B-Baja--------');
  writeln('-------C-Modificar-------');
  writeln('-------D- Consultar-------');
  writeln('-------S- Salir-------');
  readln(opcion);

  opción de caso de
	'A': alta;
	'B': bajo;
        'C': modificar;
        'D': consultar;
        'S': salir;
		fin;
	leer la clave;
	fin.  