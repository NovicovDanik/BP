Program L2EX8;
Type
   Covor = Record
   Lun: integer;
   Lat: integer;
 end;
   Element = ^Nod;
   Nod = Record
   Info: Covor;
   Next: Element;
 end;
Var
  prim, ult, x: Element;
  raspuns: char;
Begin
  writeln('������ �������� ���������� � �����, ���� ��, ������ D: ');
  readln(raspuns);
  while((raspuns ='d') or (raspuns = 'D')) do
Begin
  new(x);
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
  writeln('������ �������� ���������� � �����, ���� ��, ������ D: ');
  readln(raspuns);
  end;
  writeln;
  x:= prim;
  writeln('���������� � ������: ');
  while (x<>Nil)  do begin
  writeln('�����: ', x^.Info.Lun);
  writeln('������: ', x^.Info.Lat);
  writeln;
  x:=x^.Next;
end;
end.