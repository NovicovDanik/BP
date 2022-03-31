Program ListaDublu;
type
  Angajat = Record
    nume: string;
    data: Record
      zi: 1..31;
      luna: 1..12;
      an: integer;
    end;
    domiciliu: string;
    stagiul: byte;
    rol: string;
    salariu: integer;
  end;
  Element = ^Nod;
  Nod = Record
    info: Angajat;
    next: Element;
    pred: Element;
  end;
var
  x: Angajat;
  sant1, sant2, aux: Element;
  raspuns: char;
  key: 1..4;
  numeCaut: string;
  
Procedure AdaugInc(x: Angajat; var sant1: Element);
var y: Element;
begin
  y:= sant1;
  new(sant1);
  y^.info:= x;
  y^.pred:= sant1;
  sant1^.next:=y;
  {x^.pred:= sant1;
  x^.next:= sant1^.next;
  sant1^.next^.pred:= x;
  sant1^.next:= x;}
end;
Procedure AdaugCap(x: Angajat; var sant2: Element);
var y: Element;
begin
  y:= sant2;
  new(sant1);
  y^.info:= x;
  y^.next:= sant2;
  sant2^.pred:=y;
  {x^.pred:= sant2^.pred;
  x^.next:= sant2;
  sant2^.pred^.next:= x;
  sant1^.pred:= x;}
end;
Procedure AdaugIna(x: Angajat; var sant1: Element; var sant2: Element);
var 
  poz, tempPoz: byte;
  temp, parc: Element;
  y: Element;
begin
  writeln('Введите позицию: ');
  readln(poz);
  parc:= sant1^.next;
  tempPoz:= 1;
  while((parc <> sant2) and (tempPoz <> poz)) do begin
    tempPoz:= tempPoz + 1;
    temp:= parc;
    parc:= parc^.next;
  end;
  parc^.pred:= temp^.pred;
  parc^.next:= temp;
  parc^.info:= x;
  temp^.pred^.next:= parc;
  temp^.pred:= parc;
end;
Procedure AdaugDup(x: Angajat; var sant1: Element; var sant2: Element);
var 
  poz, tempPoz: byte;
  temp, parc: Element;
  y: Element;
begin
  writeln('Введите позицию: ');
  readln(poz);
  parc:= sant1^.next;
  tempPoz:= 1;
  while((parc <> sant2) and (tempPoz <> poz)) do begin
    tempPoz:= tempPoz + 1;
    temp:= parc;
    parc:= parc^.next;
  end;
  parc^.pred:= temp;
  parc^.next:= temp^.next;
  parc^.info:= x;
  temp^.next^.pred:= parc;
  temp^.next:= parc;
end;
{Procedure Stergerea(var sant1: Element, nume: string);
var

begin

end;}
begin
  new(sant1);
  new(sant2);
  sant1^.next:= sant2;
  sant1^.pred:= Nil;
  sant1^.next:= Nil;
  sant2^.pred:= sant1;
  writeln('Хотите добавить сотрудника, если ДА - нажите D: ');
  readln(raspuns);
  while((raspuns = 'd') or (raspuns = 'D')) do begin
    //new(x);
    writeln('Введите имя сотрудника: ');
    readln(x.nume);
    writeln('Введите день рождения сотрудника: ');
    readln(x.data.zi);
    writeln('Введите месяц рождения сотрудника: ');
    readln(x.data.luna);
    writeln('Введите год рождения сотрудника: ');
    readln(x.data.an);
    writeln('Введите прописку сотрудника: ');
    readln(x.domiciliu);
    writeln('Введите стаж работы сотрудника: ');
    readln(x.stagiul);
    writeln('Введите должность сотрудника: ');
    readln(x.rol);
    writeln('Введите оклад сотрудника: ');
    readln(x.salariu);
    writeln('Куда добавить информацию: ');
    writeln('1. Начало');
    writeln('2. Конец');
    writeln('3. Перед элементом');
    writeln('4. После элемента');
    readln(key);
    if (key = 1) then AdaugInc(x, sant1)
    else
      if (key = 2) then AdaugCap(x, sant2)
      else
       if (key = 3) then AdaugIna(x, sant1, sant2)
       else AdaugDup(x, sant1, sant2);
       
    writeln('Хотите добавить сотрудника, если ДА - нажите D: ');
    readln(raspuns);
   end;
   {writeln('Introduceti numele studentului: ');
   readln(numeCaut);
   Stergerea(sant1, numeCaut);}
end.  