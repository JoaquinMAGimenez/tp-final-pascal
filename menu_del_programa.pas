// menu_del_programa.pas
program menu_del_programa;

uses UNIT_TIPOS_CLIENTES;
begin

begin
  archivo:string := ' T_estancias_turisticas ' ;
type
  registro := registro
     estancias: matriz [ 1 .. 1000 ] de registro
     nom_estancia:STRING [ 60 ];
     apellidoyNombreD:STRING [ 60 ];
     domicilio: STRING [ 60 ];
     correo electronico: STRING [ 60 ];
     ESTADO: BOOLEAN;
end ;


  var tecla : char;
  var reg : array [ 1 .. 1000 ] de registro;
  var h, cont : integer;
  var f : archivo_de_registro;


procedure  alta (A := integer);
   begin
    writeln;
    writeln( ' Alta[Pulse Una Tecla] ' );
    readln (la_clave);
    end ;
end ;
procedure  guardar_registros (B := registro);
  begin
     writeln;
     writeln( ' guardar_registros [ Pulse Una Tecla ] ' );
     readln (la_clave);
  end ;
end ;
procedure  carga_registros ;
  begin
      writeln;
      writeln( ' carga_registros [ Pulse Una Tecla ] ' );
      readln (la_clave);
  end ;
end ;
procedure  presenta_registros ;
  begin
     writeln;
     writeln( ' presenta_registros [ Pulse Una Tecla ] ' );
     readln (la_clave);
  end ;
end ;
begin
  clrscr;
	writeln( ' Ingrese el nombre de la estancia: ' );
	readln(disco.estancia);
	writeln( ' Ingrese dueño ' );
	readln(disco.autor);
  writeln( ' --------Información Ingresada-------- ' );
	writeln( ' Nombre de la estancia: ' ,disco.estancia);
	writeln( ' Dueño: ' ,disco.duenios);

end ;

var opcion:char;

begin
clrscr;
  writeln( ' --------Menú Principal--------- ' );
  writeln( ' -------A-Alta-------- ' );
  writeln( ' -------B-Baja-------- ' );
  writeln( ' -------C-Modificar------- ' );
  writeln( ' -------D- Consultar------- ' );
  writeln( ' -------S- Salir------- ' );
  readln(opcion);
  begin
    if (opción:= ' A ' ):
	    writeln (alta);
    if (opción:= ' B ' ):
      writeln (Baja)
    if (opción:= ' C ' ):
	    writeln (modificar);
    if (opción:= ' D ' ):
	    writelnln (consultar);
    if (opcion:= ' S ' ):
	    writeln (salir);
	end ;
	readln la_clave;
end ;	
  
