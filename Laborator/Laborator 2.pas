Program L2EX8;
Type
   Covor = Record
   Lun: integer;
   Lat: integer;
 end;
   Element2 = ^Ar;
   Ar = Record
   Info : integer;
   Next : Element2;
 end;
   Element = ^Nod;
   Nod = Record
   Info: Covor;
   Next: Element;
 end;
Var
  prim, ult, x: Element;
  prim2, ult2, x2: Element2;
  raspuns: char;
Begin
  writeln('������ �������� ���������� � �����, ���� ��, ������ D: ');
  readln(raspuns);
  while((raspuns ='d') or (raspuns = 'D')) do
Begin
  new(x);
  new(x2);
  writeln('������� ����� �����: ');
  readln(x^.Info.Lun);
  writeln('������� ������ �����: ');
  readln(x^.Info.Lat);
  x^.Next:=Nil;
  if prim = Nil then 
    prim:=x
  else 
    ult^.Next:= x;
    ult:= x;
    x2^.Info := x^.Info.Lun * x^.Info.Lat;
    x2^.Next:=Nil;
  if prim2 = Nil then 
    prim2:=x2
  else 
    ult2^.Next:= x2;
    ult2:= x2;
  writeln('������ �������� ���������� � �����, ���� ��, ������ D: ');
  readln(raspuns);
  end;
  writeln;
  x:= prim;
  writeln('���������� � ������: ');
  while (x<>Nil) do begin
  writeln('�����: ', x^.Info.Lun);
  writeln('������: ', x^.Info.Lat);
  writeln;
  x:=x^.Next;
end;
  x2 := prim2;
  while (x2<>Nil) do begin
  writeln('�������: ', x2^.Info);
  x2:=x2^.Next;
end;
end.