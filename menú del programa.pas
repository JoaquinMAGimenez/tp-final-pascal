//menú del programa.pas
uses crt;

BEGIN

begin
archivo:string = 'T_estaincias_turisticas';
 tipo
 registro := registro
     estancias: matriz[1..1000] de registro
     nom_estancia:STRING [60];
     apellidoyNombreD:STRING [60];
     domicilio: STRING [60];
     correo electrónico: STRING [60];
     ESTADO: BOOLEAN;
end;


  var tecla : char;
  var reg : array[1..1000] de registro;
  var h, cont : entero;
  var f : archivo de registro;


procedure alta(A := entero);
   begin
    escribir;
    writeln('Alta[ Pulse Una Tecla ]');
    readln la clave;
    end;
end;
procedure guardar_registros(B := registro);
  begin
     escribir;
     writeln('guardar_registros [ Pulse Una Tecla ]');
     readln la clave;
  end;
end;
procedure carga_registros;
  begin
      escribir;
      writeln(' carga_registros [ Pulse Una Tecla ]');
      readln la clave;
  end;
end;
procedure presenta_registros;
  begin
     escribir;
     writeln('presenta_registros [ Pulse Una Tecla ]');
     readln la clave;
  end;
end;
begin
  clrscr;
	writeln('Ingrese el nombre de la estancia: ');
	readln(disco.estancia);
	writeln('Ingrese dueño');
	readln(disco.autor);
  writeln('--------Informacion Ingresada--------');
	writeln('Nombre de la estancia: ',disco.estancia);
	writeln('Dueño: ',disco.duenios);

end;

var opcion:char;

begin
clrscr;
  writeln('--------Menú Principal---------');
  writeln('-------A-Alta--------');
  writeln('-------B-Baja--------');
  writeln('-------C-Modificar-------');
  writeln('-------D- Consultar-------');
  writeln('-------S- Salir-------');
  readln(opcion);
  begin
    if(opcion:='A'):
	    writeln ( alta);
    if(opcion:='B'):
      writeln(Baja)
    if(opcion:='C'):
	    writeln (modificar);
    if(opcion:='D'):
	    writeln ( consultar);
    if(opcion:='S'):
	    writeln ( salir);
	end;
	readln la clave;
end;	
  
END. 