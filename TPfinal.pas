TPfinal;
uses crt;
interfaz
ESCRIBE
T_estaincias_turisticas=REGISTRO
ID_estancia:integer;
nom_estancia:STRING [60];
apellidoyNombreD:STRING [60];
domicilio:STRING [60];
correo electrónico: CADENA [60];
ESTADO: BOOLEAN;
DNI_duenio:Entero;
numerodecont:Entero;
caracteristica:Entero;
capacidad_maxima:Integer;
tiene_pisina:CADENA[2];
FIN;
T_ARCHIVO = ARCHIVO DE T_estaincias_turisticas;

VAR
estaincias_turisticas:T_ARCHIVO;

IMPLEMENTACIÓN
PROCEDIMIENTO CREAR (VAR ARCO: T_ARCHIVO);
COMENZAR
ASSIGN(ARCH,'C:\ARCHIVO_estancias_turisticas.DAT');
REESCRIBIR(ARCO);
FIN;

PROCEDIMIENTO ABRIR (VAR ARCO: T_ARCHIVO);
COMENZAR
ASSIGN(ARCHIVO,'C:\ARCHIVO.DAT');
REINICIAR (ARCO);
FIN;

PROCEDIMIENTO LEER_REGISTRO (VAR ARCH: T_ARCHIVO; POS:INTEGER; VAR REG:T_estaincias_turisticas);
COMENZAR
BUSCAR(ARCO, POS);
LEER(ARCO, REG);
FIN;

PROCEDIMIENTO GUARDAR_REGISTRO (VAR ARCH:T_ARCHIVO; POS:INTEGER; REG:T_estaincias_turisticas);
COMENZAR
BUSCAR(ARCO, POS);
ESCRIBIR(ARCO, REG);
FIN;

PROCEDIMIENTO CARGAR_REGISTRO (VAR r: T_estaincias_turisticas);
comenzar
con registro do
  comenzar
  WRITE('INGRESE EL NOMBRE DE LA ESTANCIA:');
  READLN (nom_estancia);
  WRITE('INGRESE APELLIDO Y NOMBRE DEL DUENIO: ');
  READLN (apellidoyNombreD);
  WRITE('INGRESO EL DOMICILIO:');
  READLN (domicilio);
  ESCRIBIR('INGRESE EL CORREO ELECTRÓNICO:');
  READLN (correo electrónico);
  WRITE('INGRESO EL DNI DEL DUENIO:');
  READLN (DNI_duenio);
  WRITE('INGRESE EL NUMERO DE CONTACTO:');
  READLN (numerodecont);
  WRITE('INGRESE LAS CARACTERISTICAS: ');
  READLN (característica);
  WRITE('INGRESE LA CAPACIDAD MAXIMA: ');
  READLN (capacidad_maxima);
  ESCRIBIR('¿TIENE PISINA?: ');
  READLN (tiene_pisina);
  ESTADO:= VERDADERO;
  fin;
fin;
PROCEDIMIENTO CERRAR (VAR ARCO: T_ARCHIVO);
COMENZAR
CERRAR(ARCO);
FIN;

PROCEDIMIENTO ORDEN_BURBUJA (VAR ARCO: T_ARCHIVO);
VAR R1, R2:T_estaincias_turisticas;
LIM,I,J:ENTERO;
COMENZAR
LIM:= TAMAÑO DEL ARCHIVO(ARCH)-1;
PARA I:= 0 A LIM - 1 HACER
PARA J:= 0 A LIM - 1 HACER
COMENZAR
BUSCAR (ARCO,J);
LEER (ARCO,R1);
BUSCAR (ARCO,J+1);
LEER (ARCO,R2);
SI R1.N_CLIENTE > R2.N_CLIENTE ENTONCES
COMENZAR
BUSCAR (ARCO,J+1);
ESCRIBIR(ARCO,R1);
BUSCAR (ARCO,J);
ESCRIBIR(ARCO,R2);
FIN;
FIN;
FIN;

PROCEDIMIENTO modificar (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR POS:LONGINT);
  var respuesta: S or N;
  var nom_estancia_nuevo : STRING [60];
  var apellidoyNombreD_nuevo :STRING [60];
  var domicilio_nuevo:STRING [60];
  var correo electrónico_nuevo: CADENA [60];
  var DNI_duenio_nuevo:Entero;
  var numerodecont_nuevo:Entero;
  var caracteristica_nueva:Entero;
  var capacidad_maxima_nuevo:Integer;
  var tiene_pisina_nuevo:CADENA[2];
  ESCRIBIR('¿Desea modificar alguna estancia?: (S/N)) ');
  READLN (respuesta);
  if (respuesta := S) then
      ESCRIBIR('Ingrese el nombre de la estancia a buscar: ');
      ReadLn(nombre_estancia_a_buscar);
       busqueda_binaria(estancias, limite, nombre_estancia_a_buscar, posi);
       ESCRIBIR ('Ingrese el nuevo nombre a cambiar de la estancia')
       READLN (nom_estancia_nuevo)
       ESCRIBIR ('Ingrese el nuevo apellido y nombre del dueño a cambiar de la estancia')
       READLN (apellidoyNombreD_nuevo)
       ESCRIBIR ('Ingrese el nuevo domicilio a cambiar de la estancia')
       READLN (domicilio_nuevo)
       ESCRIBIR ('Ingrese el nuevo correo electronico a cambiar de la estancia')
       READLN (correo electrónico_nuevo)
       ESCRIBIR ('Ingrese el nuevo DNI del dueño a cambiar de la estancia')
       READLN (DNI_duenio_nuevo)
       ESCRIBIR ('Ingrese el nuevo numero de contacto a cambiar de la estancia')
       READLN (numerodecont_nuevo)
       ESCRIBIR ('Ingrese la nueva caracteristica a cambiar de la estancia')
       READLN (caracteristica_nueva)
       ESCRIBIR ('Ingrese la nueva capacidad maxima a cambiar de la estancia')
       READLN (capacidad_maxima_nuevo)
       ESCRIBIR ('Ingrese si tiene pisina o no a cambiar de la estancia')
       READLN (tiene_pisina_nuevo)

       nom_estancia := nom_estancia_nuevo;
       apellidoyNombreD := apellidoyNombreD_nuevo;
       domicilio := domicilio_nuevo;
       correo electrónico := correo electrónico_nuevo;
       DNI_duenio := DNI_duenio_nuevo;
       numerodecont := numerodecont_nuevo;
       caracteristica := caracteristica_nueva;
       capacidad_maxima := capacidad_maxima_nuevo;
       tiene_pisina := tiene_pisina_nuevo;
  else
    begin
        WriteLn();
        WriteLn('La estancia "', nombre_estancia_a_buscar, '" no se encuentra en el registro...');
        readkey;
    fin;   
  fin;

PROCEDIMIENTO ELIMINAR (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR POS:LONGINT);
  var eliminado: BOOLEAN
  var respuesta: S or N;
  eliminado:=FALSE;
  ESCRIBIR('¿Desea eliminar alguna estancia?: (S/N)) ');
  READLN (respuesta);
  if (respuesta := S) then
      ESCRIBIR('Ingrese el nombre de la estancia que desea eliminar: ');
      ReadLn(nombre_estancia_a_buscar);
       busqueda_binaria(estancias, limite, nombre_estancia_a_buscar, posi);
       if (nombre_estancia_a_buscar = nom_estancia) then
          eliminado:=TRUE;
          ESCRIBIR ('se a eliminado la estancia solicitada:', nombre_estancia_a_buscar);
          
fin;

PROCEDIMIENTO PREGUNTAR (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR POS:LONGINT);
  var respuesta: S or N;
  ESCRIBIR('¿Desea ver los datos de alguna estancia?: (S/N)) ');
  READLN (respuesta);
  if (respuesta := S) then
      ESCRIBIR('Ingrese el nombre de la estancia que desea ver: ');
      ReadLn(nombre_estancia_a_buscar);
       busqueda_binaria(estancias, limite, nombre_estancia_a_buscar, posi);
       if (nombre_estancia_a_buscar = nom_estancia) then
          ESCRIBIR ('el nombre de la estancia es:',nom_estancia);
          ESCRIBIR ('el apellido y nombre del propietario es:',apellidoyNombreD);
          ESCRIBIR ('el domicilio de la estancia es:', domicilio);
          ESCRIBIR ('el correo electronico de la estancia es',correo electrónico);
          ESCRIBIR ('el DNI del dueño de la estancia es:', DNI);
          ESCRIBIR ('el telefono de la estancia es:',numerodecont);
          ESCRIBIR ('las caracteristicas de la estancia son:',caracteristica);
          ESCRIBIR ('tiene una capacidad maxima de:',capacidad_maxima);
          ESCRIBIR ('Tiene pisina,', tiene_pisina);

fin;

PROCEDIMIENTO BBIN (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR POS:LONGINT);
VAR R1:T_estaincias_turisticas;
PRI, ULT, MED: ENTRADA LARGA;
COMENZAR
PRI:=0;
ULT:= TAMAÑO DE ARCHIVO (ARCH)-1;
TPV := -1;
MIENTRAS (POS = -1) Y (PRI<= ULT) HACER

COMENZAR
MED:= (PRI + ULT) DIV 2;
BUSCAR (ARCO, MED);
LEER (ARCO,R1);
SI R1.N_estaincias_turisticas = BUSCADO ENTONCES POS:= MED
MÁS
SI R1.N_estaincias_turisticas > BUSCADO ENTONCES ULT:= MED -1
DE LO CONTRARIO PRI:= MED +1;
FIN;
FIN;

PROCEDIMIENTO LISTAR1(VAR ARCO:T_ARCHIVO);
VAR
REG:T_estaincias_turisticas;
COMENZAR
REINICIAR (ARCO);
MIENTRAS NO(EOF(ARCH)) HACER
COMENZAR
LEER(ARCO, REG);
MOSTRAR_REGISTRO(REG);
FIN;
FIN;

PROCEDIMIENTO LISTAR2 (VAR ARCH:T_ARCHIVO; pos:Integer);
VAR
REG:T_estaincias_turisticas;
COMENZAR
COMENZAR
BUSCAR(ARCO,POS);
LEER(ARCO, REG);
si reg.ESTADO = TRUE entonces MOSTRAR_REGISTRO(REG);
FIN;
FIN;
INTERFAZ
ESCRIBE
T_CLIENTE = REGISTRO
N_CLIENTE: ENTERO;
APyNOM: CADENA[60];
ESTADO: BOOLEAN;
FIN;
T_ARCHIVO = ARCHIVO DE T_CLIENTE;

IMPLEMENTACIÓN
PROCEDIMIENTO CREAR (VAR ARCO: T_ARCHIVO);
COMENZAR
ASSIGN(ARCHIVO,'C:\ARCHIVO_ESTANCIAS.DAT');
REESCRIBIR(ARCO);
FIN;

PROCEDIMIENTO ABRIR (VAR ARCO: T_ARCHIVO);
COMENZAR
ASSIGN(ARCHIVO,'C:\ARCHIVO.DAT');
REINICIAR (ARCO);
FIN;



PROCEDIMIENTO LEER_REGISTRO (VAR ARCH: T_ARCHIVO; POS:INTEGER; VAR REG:T_Cliente);
COMENZAR
BUSCAR(ARCO, POS);
LEER(ARCO, REG);
FIN;

PROCEDIMIENTO GUARDAR_REGISTRO (VAR ARCH:T_ARCHIVO; POS:INTEGER; REG:T_Cliente);
COMENZAR
BUSCAR(ARCO, POS);
ESCRIBIR(ARCO, REG);
FIN;

PROCEDIMIENTO CARGAR_registro (VAR r: T_Cliente);
comenzar
con r hacer
comenzar
ESCRIBIR('INGRESO N_CLIENTE:');
LEERLN (N_CLIENTE);
WRITE('INGRESE APELLIDO Y NOMBRE: ');
LEERLN (N_CLIENTE);
ESTADO:= VERDADERO;
fin;
fin;

PROCEDIMIENTO CERRAR (VAR ARCO: T_ARCHIVO);
COMENZAR
CERRAR(ARCO);
FIN;

PROCEDIMIENTO ORDEN_BURBUJA (VAR ARCO: T_ARCHIVO);
VAR R1, R2:T_ESTANCIAS;
LIM,I,J:ENTERO;
COMENZAR
LIM:= TAMAÑO DEL ARCHIVO(ARCH)-1;
PARA I:= 0 A LIM - 1 HACER
PARA J:= 0 A LIM - HAGO
COMENZAR
BUSCAR (ARCO,J);
LEER (ARCO,R1);
BUSCAR (ARCO,J+1);
LEER (ARCO,R2);
SI R1.N_ESTANCIAS > R2.N_ESTANCIAS ENTONCES
COMENZAR
BUSCAR (ARCO,J+1);
ESCRIBIR(ARCO,R1);
BUSCAR (ARCO,J);
ESCRIBIR(ARCO,R2);
FIN;
FIN;
FIN;

PROCEDIMIENTO BBIN (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR POS:LONGINT);
VAR R1:T_ESTANCIAS;
PRI, ULT, MED: ENTRADA LARGA;
COMENZAR
PRI:=0;
ULT:= TAMAÑO DE ARCHIVO (ARCH)-1;
TPV := -1;
MIENTRAS (POS = -1) Y (PRI<= ULT) HACER
COMENZAR
MED:= (PRI + ULT) DIV 2;
BUSCAR (ARCO, MED);
LEER (ARCO,R1);
SI R1.N_CLIENTE = BUSCADO ENTONCES POS:= MED
MÁS
SI R1.N_CLIENTE > BUSCADO ENTONCES ULT:= MED -1
DE LO CONTRARIO PRI:= MED +1;
FIN;
FIN;

PROCEDIMIENTO LISTAR1(VAR ARCO:T_ARCHIVO);
VAR
REG:T_ESTANCIAS;
COMENZAR
REINICIAR (ARCO);
MIENTRAS NO(EOF(ARCH)) HACER
COMENZAR
LEER(ARCO, REG);
MOSTRAR_REGISTRO(REG);
FIN;
FIN;

PROCEDIMIENTO LISTAR2 (VAR ARCH:T_ARCHIVO; pos:Integer);
VAR
REG:T_ESTANCIAS;
COMENZAR
COMENZAR
BUSCAR(ARCO,POS);
LEER(ARCO, REG);
si reg.ESTADO = TRUE entonces MOSTRAR_REGISTRO(REG);
FIN;
FIN;
FIN. 