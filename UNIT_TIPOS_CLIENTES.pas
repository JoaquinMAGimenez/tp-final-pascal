//UNIT_TIPOS_CLIENTES
UNIT UNIT_TIPOS_CLIENTES;
INTERFACE
  TYPE
    T_CLIENTE =  RECORD
    ID_estancia:integer;
    nom_estancia:STRING [60];
    apellidoyNombreD:STRING [60];
    domicilio:STRING [60];
    correo_electronico: STRING [60];
    ESTADO: BOOLEAN;
    DNI_duenio:integer;
    numerodecont:integer;
    caracteristica:integer;
    capacidad_maxima:Integer;
    tiene_pisina:STRING[2]; 

  END;


  T_ARCHIVO = FILE OF T_CLIENTE;

    PROCEDURE CREAR (VAR ARCH:T_ARCHIVO);
    PROCEDURE ABRIR(VAR ARCH:T_ARCHIVO);
    PROCEDURE CERRAR(VAR ARCH:T_ARCHIVO);
    PROCEDURE LEER_REGISTRO(VAR ARCH:T_ARCHIVO; POS:INTEGER; VAR REG:T_Cliente);
    PROCEDURE GUARDAR_REGISTRO(VAR ARCH:T_ARCHIVO;
    POS:INTEGER; REG:T_Cliente);
    PROCEDURE LISTAR1(VAR ARCH:T_ARCHIVO);
    PROCEDURE MOSTRAR_REGISTRO(r: T_Cliente);
    PROCEDURE CARGAR_REGISTRO(VAR r: T_Cliente);
    PROCEDURE LISTAR2 (VAR ARCH:T_ARCHIVO;pos:Integer);
    PROCEDURE ORDEN_BURBUJA (VAR ARCH: T_ARCHIVO);
    PROCEDURE BBIN (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR
    POS:LONGINT);
    procedure modificar (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR POS:LONGINT);
    procedure ELIMINAR (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR POS:LONGINT);
    procedure PREGUNTAR (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR POS:LONGINT);

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
      READLN ( ID_estancia);
      WRITE('INGRESE APELLIDO Y NOMBRE: ');
      READLN ( apellidoyNombreD);
      WRITE('INGRESE EL NOMBRE DE LA ESTANCIA:');
      READLN (nom_estancia);
      WRITE('INGRESO EL DOMICILIO:');
      READLN (domicilio);
      WriteLn('INGRESE EL correo_electronico:');
      READLN (correo_electronico);
      WRITE('INGRESO EL DNI DEL DUENIO:');
      READLN (DNI_duenio);
      WRITE('INGRESE EL NUMERO DE CONTACTO:');
      READLN (numerodecont);
      WRITE('INGRESE LAS CARACTERISTICAS: ');
      READLN (caracteristica);
      WRITE('INGRESE LA CAPACIDAD MAXIMA: ');
      READLN (capacidad_maxima);
      WriteLn('¿TIENE PICINA?: ');
      READLN (tiene_pisina);
      ESTADO:= TRUE;
    end;
  end;

  PROCEDURE ORDEN_BURBUJA (VAR ARCH: T_ARCHIVO);
  VAR R1, R2:T_CLIENTE;
  LIM,I,J:INTEGER;
  BEGIN
  LIM:= FILESIZE(ARCH)-1;
  FOR I:= 0 TO LIM - 1 DO

  //Fundamentos de Programación
  FOR J:= 0 TO LIM - I DO
  BEGIN
  SEEK (ARCH,J);
  READ (ARCH,R1);
  SEEK (ARCH,J+1);
  READ (ARCH,R2);
  IF R1.ID_estancia > R2.ID_estancia THEN
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

  //Fundamentos de Programación
  BEGIN
  MED:= (PRI + ULT) DIV 2;
  SEEK (ARCH,MED);
  READ (ARCH,R1);
  IF R1.ID_estancia = BUSCADO THEN POS:= MED
  ELSE
  IF R1.ID_estancia > BUSCADO THEN ULT:= MED -1
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

  //Fundamentos de Programación
  REG:T_Cliente;
  BEGIN
  BEGIN
  SEEK(ARCH,POS);
  READ(ARCH, REG);
  if reg.ESTADO = TRUE then MOSTRAR_REGISTRO(REG);
  END;
  END;
 //
  procedure modificar (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR POS:LONGINT);
    var respuesta : char ;
    var nom_estancia_nuevo : STRING [60] ;
    var apellidoyNombreD_nuevo : STRING [60] ;
    var domicilio_nuevo : STRING [60] ;
    var correo_electronico_nuevo : STRING [60] ;
    var DNI_duenio_nuevo : integer ;
    var numerodecont_nuevo : integer ;
    var caracteristica_nueva : integer ;
    var capacidad_maxima_nuevo : Integer ;
    var tiene_pisina_nuevo : STRING[2] ;
    var nombre_estancia_a_search : String [60] ; 
    begin
      writeln ('¿Desea buscar una estancia en el listado? escriba (S/N)');
      readln (respuesta);
      if (respuesta = 'S') then
        begin
          WriteLn('Ingrese el nombre de la estancia a buscar: ');
          ReadLn(nombre_estancia_a_search);
          BBIN(ARCH,BUSCADO, pos);
          WriteLn ('Ingrese el nuevo nombre a cambiar de la estancia');
          READLN (nom_estancia_nuevo);
          WriteLn ('Ingrese el nuevo apellido y nombre del dueño a cambiar de la estancia');
          READLN (apellidoyNombreD_nuevo);
          WriteLn ('Ingrese el nuevo domicilio a cambiar de la estancia');
          READLN (domicilio_nuevo);
          WriteLn ('Ingrese el nuevo correo electronico a cambiar de la estancia');
          READLN (correo_electronico_nuevo);
          WriteLn ('Ingrese el nuevo DNI del dueño a cambiar de la estancia');
          READLN (DNI_duenio_nuevo);
          WriteLn ('Ingrese el nuevo numero de contacto a cambiar de la estancia');
          READLN (numerodecont_nuevo);
          WriteLn ('Ingrese la nueva caracteristica a cambiar de la estancia');
          READLN (caracteristica_nueva);
          WriteLn ('Ingrese la nueva capacidad maxima a cambiar de la estancia');
          READLN (capacidad_maxima_nuevo);
          WriteLn ('Ingrese si tiene pisina o no a cambiar de la estancia');
          READLN (tiene_pisina_nuevo);
            with T_CLIENTE do
            begin
              nom_estancia := nom_estancia_nuevo;
              apellidoyNombreD := apellidoyNombreD_nuevo;
              domicilio := domicilio_nuevo;
              correo_electronico := correo_electronico_nuevo;
              DNI_duenio := DNI_duenio_nuevo;
              numerodecont := numerodecont_nuevo;
              caracteristica := caracteristica_nueva;
              capacidad_maxima := capacidad_maxima_nuevo;
              tiene_pisina := tiene_pisina_nuevo;
            end; 
        end;    
      ELSE
          begin      
                WriteLn();
                WriteLn('La estancia ', nombre_estancia_a_search, ' no se encuentra en el registro...');
               
          end;       
    END;      
  

  procedure ELIMINAR (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR POS:LONGINT);
    var eliminado: BOOLEAN
    var respuesta: char;
    eliminado:=FALSE;
    WriteLn('¿Desea eliminar alguna estancia?: (S/N)) ');
    READLN (respuesta2);
    if (respuesta2 := 'S') then
        WriteLn('Ingrese el nombre de la estancia que desea eliminar: ');
        ReadLn(nombre_estancia_a_search);
        BBIN(ARCH, BUSCADO, pos);
        if (nombre_estancia_a_search = nom_estancia) then
            eliminado:=TRUE;
            WriteLn ('se a eliminado la estancia solicitada:', nombre_estancia_a_search);
            
  END;

  procedure PREGUNTAR (VAR ARCH:T_ARCHIVO; BUSCADO:INTEGER; VAR POS:LONGINT);
    var respuesta3: char;
    WriteLn('¿Desea ver los datos de alguna estancia?: (S/N)) ');
    READLN (respuesta3);
    if (respuesta = 'S') then
        WriteLn('Ingrese el nombre de la estancia que desea ver: ');
        ReadLn(nombre_estancia_a_search);
        BBIN(ARCH, BUSCADO, pos);
        if (nombre_estancia_a_search = nom_estancia) then
          begin
            WriteLn ('el nombre de la estancia es:',nom_estancia);
            WriteLn ('el apellido y nombre del propietario es:',apellidoyNombreD);
            WriteLn ('el domicilio de la estancia es:', domicilio);
            WriteLn ('el correo electronico de la estancia es',correo_electronico);
            WriteLn ('el DNI del dueño de la estancia es:', DNI);
            WriteLn ('el telefono de la estancia es:',numerodecont);
            WriteLn ('las caracteristicas de la estancia son:',caracteristica);
            WriteLn ('tiene una capacidad maxima de:',capacidad_maxima);
            WriteLn ('Tiene pisina,', tiene_pisina);
          end;
    else
      begin
        writeln ();
        writeln ('La estancia ', nombre_estancia_a_search, ' no se encuentra en el registro...');
      end;  
  END;


END.