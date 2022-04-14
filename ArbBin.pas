Program ArbBin;
type
  Tree = ^Nod;
  Nod = Record
    inf: real;
    ASt: Tree;
    ADr: Tree;
  end;
var
  arb, aux: Tree;
  num, caut: real;
Procedure Inserare(var arb: Tree; n: real);
begin
  if arb = Nil then begin
    new(arb);
    arb^.inf:= n;
    arb^.ASt:= Nil;
    arb^.ADr:= Nil;
  end
  else begin
    if n < arb^.inf then Inserare(arb^.ASt, n)
    else
      if n > arb^.inf then Inserare(arb^.ADr, n);
  end;
end;
Procedure Afisare(arb: Tree);
begin
  if arb <> Nil then begin
    Afisare(arb^.ASt);
    writeln(arb^.inf);
    Afisare(arb^.ADr);
  end;
end;
Function Cautare(arb: Tree; n: real): boolean; 
begin
  if arb = Nil then Cautare:= false
  else
    if n = arb^.inf then Cautare:= true
    else
      Cautare:= Cautare(arb^.ASt, n) or Cautare(arb^.ADr, n);
end;
Function Minim(arb: Tree): real;
begin
  if arb^.ASt = Nil then Minim:= arb^.inf
  else Minim:= Minim(arb^.ASt);
end;
Function Maxim(arb: Tree): real;
begin
  if arb^.ADr = Nil then Maxim:= arb^.inf
  else Maxim:= Maxim(arb^.ADr);
end;
Function Terminal(arb: Tree): integer;
begin
  if arb = Nil then Terminal:= 0
  else begin
    if (arb^.ASt = Nil) and (arb^.ADr = Nil) then Terminal:= 1
    else Terminal:= Terminal(arb^.ASt) + Terminal(arb^.ADr);
  end;
end;
begin
  arb:= Nil;
  writeln('Введите числа: ');
  readln(num);
  while(num <> 0) do begin
    Inserare(arb, num);
    readln(num);
  end;
  writeln('Дерево создано');
  Afisare(arb);
  writeln('Какое значение хотите найти: ');
  readln(caut);
  if (Cautare(arb, caut)) then writeln('Данное число есть в древе')
  else writeln('Данного числа нет в древе');
  writeln('Максимальное значение: ', Minim(arb));
  writeln('Минимальное значение: ', Maxim(arb));
  writeln('Дерево имеет ', Terminal(arb), ' конечных узлов');
end.