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
  writeln('������� �������: ');
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
  writeln('������� �������: ');
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
Procedure Stergerea(var sant1: Element; sant2: Element; nume: string);
var
  temp, parc: Element;
begin
  parc:=sant1^.next;
  while ((parc <> sant2) and (nume <> parc^.info.nume)) do
begin
  parc:=parc^.next;
end;
  if (parc^.next <> Nil) then 
begin

  parc^.pred^.next:= parc^.next;
  parc^.next^.pred:= parc^.pred;
  dispose(parc);
end;
end;
Function CheckStagiul(sant1, sant2: Element): Boolean;
var
  parc: Element;
begin
  parc:=sant1^.next;
  while (parc <> sant2) do
begin
 if (parc^.info.stagiul>=20) then
begin
  CheckStagiul:=True;
  break;
end;
end;
end;
Function Media (sant1: Element; sant2: Element): real;
var
  s,n:integer;
  parc: Element;
begin
  parc:=sant1^.next;
  while(parc <> sant2) do
begin
  s:=s + parc^.info.salariu;
  n:=n+1;
  parc:= parc^.next;
end;
  Media:= s / n;
  end;
begin
  new(sant1);
  new(sant2);
  sant1^.next:= sant2;
  sant1^.pred:= Nil;
  sant1^.next:= Nil;
  sant2^.pred:= sant1;
  writeln('������ �������� ����������, ���� �� - ������ D: ');
  readln(raspuns);
  while((raspuns = 'd') or (raspuns = 'D')) do begin
    //new(x);
    writeln('������� ��� ����������: ');
    readln(x.nume);
    writeln('������� ���� �������� ����������: ');
    readln(x.data.zi);
    writeln('������� ����� �������� ����������: ');
    readln(x.data.luna);
    writeln('������� ��� �������� ����������: ');
    readln(x.data.an);
    writeln('������� �������� ����������: ');
    readln(x.domiciliu);
    writeln('������� ���� ������ ����������: ');
    readln(x.stagiul);
    writeln('������� ��������� ����������: ');
    readln(x.rol);
    writeln('������� ����� ����������: ');
    readln(x.salariu);
    writeln('���� �������� ����������: ');
    writeln('1. ������');
    writeln('2. �����');
    writeln('3. ����� ���������');
    writeln('4. ����� ��������');
    readln(key);
    if (key = 1) then AdaugInc(x, sant1)
    else
      if (key = 2) then AdaugCap(x, sant2)
      else
       if (key = 3) then AdaugIna(x, sant1, sant2)
       else AdaugDup(x, sant1, sant2);
       
    writeln('������ �������� ����������, ���� �� - ������ D: ');
    readln(raspuns);
   end;
   //2
   writeln('������� ��� ����������: ');
   readln(numeCaut);
   //3
   Stergerea(sant1, sant2, numeCaut);
   if(CheckStagiul(sant1, sant2)) then writeln('���� ����� ����������')
   else writeln ('��� ����� �����������');
   //4
   writeln('������� �����: ', Media(sant1, sant2));
end.  