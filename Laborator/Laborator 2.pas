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
  writeln('Хотите добавить информацию о ковре, если ДА, нажите D: ');
  readln(raspuns);
  while((raspuns ='d') or (raspuns = 'D')) do
Begin
  new(x);
  writeln('Введите длину ковра: ');
  readln(x^.Info.Lun);
  writeln('Введите ширину ковра: ');
  readln(x^.Info.Lat);
  x^.Next:=Nil;
  if prim = Nil then 
    prim:=x
  else 
    ult^.Next:= x;
    ult:= x;
  writeln('Хотите добавить информацию о ковре, если ДА, нажите D: ');
  readln(raspuns);
  end;
  writeln;
  x:= prim;
  writeln('Информация о коврах: ');
  while (x<>Nil)  do begin
  writeln('Длина: ', x^.Info.Lun);
  writeln('Ширина: ', x^.Info.Lat);
  writeln;
  x:=x^.Next;
end;
end.