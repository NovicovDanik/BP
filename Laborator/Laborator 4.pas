Program L4EX8;
uses crt;
Type
  Carte = Record
    cod: integer;
    tit: string[24];
    autor: string[24];
    total: real;
    disp: real;
  end;
  Tree = ^Nod;
  Nod = Record
    inf: Carte;
    st, dr: Tree;
  end;
Var
  arb: Tree;
  key: 0..6;
  caut: string[24];
Procedure Inserare(var arb: Tree; x: Carte);
begin
  if arb = Nil then
    begin
      new(arb);
      arb^.inf:= x;
      arb^.st:= Nil;
      arb^.dr:= Nil;
    end
  else
   begin
    if x.cod < arb^.inf.cod then Inserare(arb^.st, x)
    else Inserare(arb^.dr, x);
   end;
end;
Procedure Adaugare;
var carte: Carte;
begin
  write('Codul: '); readln(carte.cod);
  write('Carte: '); readln(carte.tit);
  write('Autorul: '); readln(carte.autor);
  write('Total de exemplare: '); readln(carte.total);
  write('Exemplare disponibile: '); readln(carte.disp);
  Inserare(arb, carte);
end;
Procedure Afisare(arb: Tree);
begin
  if arb <> Nil then begin
    Afisare(arb^.st);
    if arb^.inf.disp > 0 then
    writeln(arb^.inf.tit);
    Afisare(arb^.dr);
  end;
end;
Procedure AfisareDes(arb: Tree);
begin
  if arb <> Nil then begin
    AfisareDes(arb^.dr);
    writeln(arb^.inf.tit);
    AfisareDes(arb^.st);
  end;
end;
Function Cautare(arb: Tree; x: string[24]): Tree;
begin
  if arb = Nil then writeln('Titlul nu exista')
  else
    if x = arb^.inf.tit then begin
      writeln(' Codul: ', arb^.inf.cod, ' Carte: ', arb^.inf.tit, ' Autor: ', arb^.inf.autor,
              ' Total: ', arb^.inf.total, ' Disponibil: ', arb^.inf.disp);
      Cautare:= arb;
    end
    else
      if x < arb^.inf.tit then Cautare:= Cautare(arb^.st, x)
      else  Cautare:= Cautare(arb^.dr, x);
end;
Procedure Modificare(var arb: Tree; x: string[24]);
var aux: Tree; dispon: real;
begin
  aux:= Cautare(arb, x);
  write('Introduceti numărul total de exemplare disponibile: ');
  readln(dispon);
  aux^.inf.disp:= dispon;
end;
Procedure ModificareEx(var arb: Tree; x: string[24]);
var aux: Tree; tot: real;
begin
  aux:= Cautare(arb, x);
  write('Introduceti numărul total de exemplare: ');
  readln(tot);
  aux^.inf.total:= tot;
end;
Begin
  arb:= Nil;
  Repeat
    clrscr;
    writeln('1. Regăsirea unei cărți, după titlul, pentru a afișa autorul cărții');
    writeln('2. Adăugarea unui nou titlu');
    writeln('3. Modificarea numărului total de exemplare ');
    writeln('4. Modificarea numărului de exemplare disponibile');
    writeln('5. Afișarea cărților pentru care există exemplare disponibile');
    writeln('6. Afișarea titlurilor în ordine descrescătoare a codurilor');
    writeln('0. Stop');
    write('Indica operatia necesara: ');
    readln(key);
    case key of
      1:
      begin
          write('Introduceti titlul cartii: ');
          readln(caut);
          Cautare(arb, caut);
          readln;
        end;
      2: 
       begin
          Adaugare;
          readln;
        end;
      3: 
        begin
          write('Introduceti titlul cartii: ');
          readln(caut);
          ModificareEx(arb, caut);
          readln;
        end;
      4: 
      begin
        write('Introduceti titlul cartii: ');
          readln(caut);
          Modificare(arb, caut);
          readln;
        end;
      5: 
        begin
          Afisare(arb);
          readln; 
        end;
      6: 
        begin
          AfisareDes(arb);
          readln;
        end;
    end;
  Until key = 0;
End.