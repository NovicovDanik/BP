Program Student;
Type
   Student = Record
   Nume: string;
   Prenume: string;
   Nota: 1..10;
   Data: Record
   Zi: 1..31;
   Luna: 1..12;
   An: integer;
  end;
 end;
   Element = ^Nod;
   Nod = Record
   Info: Student;
   Next: Element;
 end;
Var
  stiva, x: Element;
  raspuns: char;
  i: byte;
Begin
  stiva:= Nil;
  writeln('������ �������� ��������, ���� ��, ������ D: ');
  readln(raspuns);
  while((raspuns ='d') or (raspuns = 'D')) do
Begin
  new(x);
  writeln('������� ��� ��������: ');
  readln(x^.Info.Nume);
  writeln('������� ������� ��������: ');
  readln(x^.Info.Prenume);
  writeln('������� ������ ��������: ');
  readln(x^.Info.Nota);
  writeln('������� ���� �������� ��������: ');
  readln(x^.Info.Data.Zi);
  writeln('������� ����� �������� ��������: ');
  readln(x^.Info.Data.Luna);
  writeln('������� ��� �������� ��������: ');
  readln(x^.Info.Data.An);
  x^.next:= stiva;
  stiva:= x;
  writeln('������ �������� ��������, ���� ��, ������ D: ');
  readln(raspuns);
end;
  writeln('���������� ��� ��������� ���������: ');
  //writeln('���������� � ��������: ');
  x:=stiva;
  i:=0;
  while (x<>Nil) and (i < 3) do begin
  writeln('��� � �������: ', x^.Info.Nume, ' ', x^.Info.Prenume);
  writeln('������: ', x^.Info.Nota);
  writeln('���� ��������: ', x^.Info.Data.Zi, ' ', x^.Info.Data.Luna, ' ', x^.Info.Data.An);
  writeln;
  i:= i + 1;
  x:= x^.next;
  end;
  x:=stiva;
  i:= 0;
  while ((x<>Nil) and (i < 1)) do begin
  stiva:= stiva^.Next;
  dispose(x);
  x:= stiva;
  i:= i + 1;
  end;
  writeln;
  writeln('���������� � ���������, ������� ��������: ');
  while (x<>Nil)  do begin
  writeln('��� � �������: ', x^.Info.Nume, ' ', x^.Info.Prenume);
  writeln('������: ', x^.Info.Nota);
  writeln('���� ��������: ', x^.Info.Data.Zi, ' ', x^.Info.Data.Luna, ' ', x^.Info.Data.An);
  writeln;
  x:= x^.next;
  end;
end.