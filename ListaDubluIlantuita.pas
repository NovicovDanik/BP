Program ListaDublu;
Type
   Angajat = Record
   Nume: string;
   Data: Record
   Zi: 1..31;
   Luna: 1..12;
   An: integer;
  end;
  Domiciliu: string;
  Stagiul: byte;
  Rol: string;
  Salariu: integer;
 end;
   Element = ^Nod;
   Nod = Record
   Info: Angajat;
   Next: Element;
   Pred: Element;
 end;
Var
  prim, ult, x, sant1, sant2: Element;
  raspuns: char;
  key: 1..4;
Procedure AdaugIn(x: Angajat; var sant1:Element);
var y: Element;
begin
  y:=sant1;
  new(sant1);
  y^.Info:=x;
  y^.Pred:= sant1;
  sant1^.Next:=y;
  {x^.Pred:= sant1;
  x^.Next:= sant1^.Next;
  sant1^.Next^.Pred:= x;
  sant1^.Next:= x;}
end;
Procedure AdaugC(x: Angajat; var sant2:Element);
var y:Element;
begin
  y:=sant1;
  new(sant1);
  y^.Info:=x;
  y^.Pred:= sant2;
  sant1^.Next:=y;
  {x^.Pred:= sant2^.Pred;
  x^.Next:= sant2;
  sant2^.Pred^.Next:= x;
  sant1^.Pred:= x;}
end;
Procedure AdaugInain(x: Element);
var
  p, tempoz: byte;
  temp, parc: Element;
begin
  writeln('Введите позицию: ');
  readln(p);
  parc:= sant1^.Next;
  tempoz:=1;
  while((parc <> sant2) and (tempoz <> p))do
Begin
  tempoz:=tempoz + 1;
  temp:= parc;
  parc:= parc^.Next;
end;
  x^.Pred:= temp^.Pred;
  x^.Next:= temp;
  temp^.Pred^.Next:= x;
  temp^.Pred:= x;
end;
Procedure AdD(x: Element);
var
  p, tempoz: byte;
  temp, parc: Element;
begin
  writeln('Введите позицию: ');
  readln(p);
  parc:= sant1^.Next;
  tempoz:=1;
  while((parc <> sant2) and (tempoz <> p))do
Begin
  tempoz:=tempoz + 1;
  temp:= parc;
  parc:= parc^.Next;
end;
  x^.Pred:= temp^.Pred;
  x^.Next:= temp;
  temp^.Next^.Pred:= x;
  temp^.Next:= x;
end;
Begin
  new(sant1);
  new(sant2);
  sant1^.Next:= sant2;
  sant1^.Pred:= Nil;
  sant1^.Next:= Nil;
  sant2^.Pred:= sant1;
  while((raspuns ='d') or (raspuns = 'D')) do
Begin
  new(x);
  writeln('Введите имя сотрудника: ');
  readln(x.Info.Nume);
  writeln('Введите день рождения сотрудника: ');
  readln(x.Info.Data.Zi);
  writeln('Введите месяц рождения сотрудника: ');
  readln(x.Info.Data.Luna);
  writeln('Введите год рождения сотрудника: ');
  readln(x.Info.Data.An);
  writeln('Введите прописку сотрудника: ');
  readln(x.Info.Data.Domiciliu);
  writeln('Введите стаж работы сотрудника: ');
  readln(x.Info.Data.Stagiul);
  writeln('Введите должность сотрудника: ');
  readln(x.Info.Data.Rol);
  writeln('Введите оклад сотрудника: ');
  readln(x.Info.Data.Salariu);
  writeln('Куда добавить информацию? ');
  writeln('1. Начало');
  writeln('2. Конец');
  writeln('3. Перед элементом');
  writeln('4. После элемента');
  readln(key);
  if (key = 1) then AdIn(x)
  else
  if (key = 2) then AdC(x)
  else
  if (key = 3) then AdInain(x)
  else AdD(x);

  writeln('Хотите добавить студента, если ДА, нажите D: ');
  readln(raspuns);
end;
end.







