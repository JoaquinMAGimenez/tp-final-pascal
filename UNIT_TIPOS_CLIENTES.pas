//UNIT_TIPOS_CLIENTES.PAS
UNIT TIPOS_CLIENTES;
INTERFACE
TYPE
T_CLIENTE = RECORD
N_CLIENTE: INTEGER;
APyNOM: STRING[60];
ESTADO: BOOLEAN;
END;
T_ARCHIVO = FILE OF T_CLIENTE;
PROCEDURE CREAR (VAR ARCH:T_ARCHIVO);
PROCEDURE ABRIR(VAR ARCH:T_ARCHIVO);
PROCEDURE CERRAR(VAR ARCH:T_ARCHIVO);
PROCEDURE LEER_REGISTRO(VAR ARCH:T_ARCHIVO; POS:INTEGER;
VAR REG:T_Cliente);
PROCEDURE GUARDAR_REGISTRO(VAR ARCH:T_ARCHIVO;
POS:INTEGER; REG:T_Cliente);
PROCEDURE LISTAR1(VAR ARCH:T_ARCHIVO);
PROCEDURE MOSTRAR_REGISTRO(r: T_Cliente);
PROCEDURE CARGAR_REGISTRO(VAR r: T_Cliente);
PROCEDURE LISTAR2 (VAR ARCH:T_ARCHIVO;pos:Integer);
PROCEDURE ORDEN_BURBUJA (VAR ARCH: T_ARCHIVO);
PROCEDURE BBIN (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR
POS:LONGINT);

//Fundamentos de Programación
IMPLEMENTATION
PROCEDURE CREAR (VAR ARCH: T_ARCHIVO);
BEGIN
ASSIGN(ARCH,'C:\ARCHIVO_CLIENTES.DAT');
REWRITE(ARCH);
END;

PROCEDURE ABRIR (VAR ARCH: T_ARCHIVO);
BEGIN
ASSIGN(ARCH,'C:\ARCHIVO.DAT');
RESET(ARCH);
END;

PROCEDURE CERRAR (VAR ARCH: T_ARCHIVO);
BEGIN
CLOSE(ARCH);
END;

PROCEDURE LEER_REGISTRO (VAR ARCH: T_ARCHIVO; POS:INTEGER;
VAR REG:T_Cliente);
BEGIN
SEEK(ARCH, POS);
READ(ARCH, REG);
END;

//Fundamentos de Programación
PROCEDURE GUARDAR_REGISTRO (VAR ARCH:T_ARCHIVO;
POS:INTEGER; REG:T_Cliente);
BEGIN
SEEK(ARCH, POS);
WRITE(ARCH, REG);
END;

PROCEDURE CARGAR_registro (VAR r: T_Cliente);
begin
with r do
begin
WRITE('INGRESE N_CLIENTE:');
READLN (N_CLIENTE);
WRITE('INGRESE APELLIDO Y NOMBRE: ');
READLN (N_CLIENTE);
ESTADO:= TRUE;
end;
end;

PROCEDURE ORDEN_BURBUJA (VAR ARCH: T_ARCHIVO);
VAR R1, R2:T_CLIENTE;
LIM,I,J:INTEGER;
BEGIN
LIM:= FILESIZE(ARCH)-1;
FOR I:= 0 TO LIM - 1 DO

Fundamentos de Programación
FOR J:= 0 TO LIM - I DO
BEGIN
SEEK (ARCH,J);
READ (ARCH,R1);
SEEK (ARCH,J+1);
READ (ARCH,R2);
IF R1.N_CLIENTE > R2.N_CLIENTE THEN
BEGIN
SEEK (ARCH,J+1);
WRITE(ARCH,R1);
SEEK (ARCH,J);
WRITE(ARCH,R2);
END;
END;
END;

PROCEDURE BBIN (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR
POS:LONGINT);
VAR R1:T_CLIENTE;
PRI,ULT,MED:LONGINT;
BEGIN
PRI:=0;
ULT:= FILESIZE (ARCH)-1;
POS := -1;
WHILE (POS = -1) AND (PRI<= ULT) DO

Fundamentos de Programación
BEGIN
MED:= (PRI + ULT) DIV 2;
SEEK (ARCH,MED);
READ (ARCH,R1);
IF R1.N_CLIENTE = BUSCADO THEN POS:= MED
ELSE
IF R1.N_CLIENTE > BUSCADO THEN ULT:= MED -1
ELSE PRI:= MED +1;
END;
END;

PROCEDURE LISTAR1(VAR ARCH:T_ARCHIVO);
VAR
REG:T_Cliente;
BEGIN
RESET(ARCH);
WHILE NOT(EOF(ARCH)) DO
BEGIN
READ(ARCH, REG);
MOSTRAR_REGISTRO(REG);
END;
END;

PROCEDURE LISTAR2 (VAR ARCH:T_ARCHIVO; pos:Integer);
VAR

Fundamentos de Programación
REG:T_Cliente;
BEGIN
BEGIN
SEEK(ARCH,POS);
READ(ARCH, REG);
if reg.ESTADO = TRUE then MOSTRAR_REGISTRO(REG);
END;
END;
END.