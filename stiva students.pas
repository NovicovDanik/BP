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
  writeln('Хотите добавить студента, если ДА, нажите D: ');
  readln(raspuns);
  while((raspuns ='d') or (raspuns = 'D')) do
Begin
  new(x);
  writeln('Введите имя студента: ');
  readln(x^.Info.Nume);
  writeln('Введите фамилию студента: ');
  readln(x^.Info.Prenume);
  writeln('Введите оценку студента: ');
  readln(x^.Info.Nota);
  writeln('Введите день рождения студента: ');
  readln(x^.Info.Data.Zi);
  writeln('Введите месяц рождения студента: ');
  readln(x^.Info.Data.Luna);
  writeln('Введите год рождения студента: ');
  readln(x^.Info.Data.An);
  x^.next:= stiva;
  stiva:= x;
  writeln('Хотите добавить студента, если ДА, нажите D: ');
  readln(raspuns);
end;
  writeln('Информация трёх послдених студентов: ');
  //writeln('Информация о студенте: ');
  x:=stiva;
  i:=0;
  while (x<>Nil) and (i < 3) do begin
  writeln('Имя и фамилия: ', x^.Info.Nume, ' ', x^.Info.Prenume);
  writeln('Оценка: ', x^.Info.Nota);
  writeln('Дата рождения: ', x^.Info.Data.Zi, ' ', x^.Info.Data.Luna, ' ', x^.Info.Data.An);
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
  writeln('Информация о студентах, которая осталась: ');
  while (x<>Nil)  do begin
  writeln('Имя и фамилия: ', x^.Info.Nume, ' ', x^.Info.Prenume);
  writeln('Оценка: ', x^.Info.Nota);
  writeln('Дата рождения: ', x^.Info.Data.Zi, ' ', x^.Info.Data.Luna, ' ', x^.Info.Data.An);
  writeln;
  x:= x^.next;
  end;
end.