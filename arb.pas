Program Arb;
Type
  Ab = ^Nod;
  Nod = Record
  inf: real;
  ASt, ADr: Ab ;
 end;
Function Creare_Ab: Ab;
var
  n: real;
  Ab: Ab;
begin
  readln(n);
  if n = 0 then Creare_Ab:=Nil
  else
begin
  new(Ab);
  Ab^.inf:=n;
  writeln('������� ������ ������ ����' ,n , ':');
  Ab^.ASt:=Creare_Ab;
  writeln('������� ������� ������ ����' ,n , ':');
  Ab^.ADr:=Creare_Ab;
  Creare_Ab:=Ab;
end;
end;
Function NumNegative(Arb: Ab): integer;
begin
  if Arb = Nil then
  NumNegative:=0
  else begin
  if Arb^.inf < 0 then
  NumNegative:= 1 + NumNegative(Arb^.ASt) + NumNegative(Arb^.ADr)
  else
  NumNegative:= NumNegative(Arb^.ASt) + NumNegative(Arb^.ADr)
  end;
end;
Function Check(Arb: Ab; val: real): boolean;
begin
  if Arb = Nil then Check:= false
  else begin
  if Arb^.inf = val then Check:= true
  else Check:= Check(Arb^.ASt, val) or Check(Arb^.ADr, val);
  end;
end;
Function Minim(Arb: Ab): real;
begin
  if Arb = Nil then
  Minim:=Minim;
  else begin
  if Arb^.inf < 0 then
  Minim:= 1 + NumNegative(Arb^.ASt) + NumNegative(Arb^.ADr)
  else
  Minim:= NumNegative(Arb^.ASt) + NumNegative(Arb^.ADr)
end;
var
  Arbore: Ab;
  val: real;
begin
  writeln('������� ������ �����: ');
  Arbore:= Creare_Ab;
  writeln('���������� ������������� ��������: ', NumNegative(Arbore));
  writeln('������� �������� ������� �����: ');
  readln(val);
  if (Check(Arbore, val)) then writeln('������� ', val, ' ����������� ��������� ������')
  else writeln('������� ', val, ' �� ����������� ��������� ������');
  writeln('����������� ��������: ');
end.




