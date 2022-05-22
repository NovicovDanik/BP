Program L3EX8;
Type
  Element = ^Nod;
  Nod = Record
    val: string;
    link: Element;
  end;
var 
  a: array [1..10] of string;
  b: array [1..10] of integer;
  key, i, n, j, t, count, index: integer;
  str: string;
  stiva, temp: Element;
begin
  stiva:= Nil;
  n:= 1;
  repeat
    writeln('Introduceti culoarea');
    readln(a[n]);
    writeln('Introduceti cantitatea');
    readln(b[n]);
    n:= n+1;
    writeln('Introduceti 1 pentru a adauga');
    writeln('Introduceti 2 pentru a opri');
    readln(key);
  until key = 2;
  for j:=1 to n-2 do
  begin
    for i:=1 to n-2 do
    begin
      if (b[i] > b[i+1]) then
        begin
          t:= b[i];
          b[i]:= b[i+1];
          b[i+1]:= t;
          str:= a[i];
          a[i]:= a[i+1];
          a[i+1]:=str;
    end;
  end;
end;
t:= b[1]*b[1];
n:= n-1;
count:= 1;
while (t <> 0) do
begin
  New(temp);
  index:= count mod n;
  if index = 0 then
       temp^.val:= a[3]
     else
  temp^.val:= a[index];
  temp^.link:= stiva;
  stiva:= temp;
  count:= count+1;
  t:= t-1;
end;
writeln('Rezultat: ');
while (stiva <> Nil) do
    begin
      writeln(stiva^.val);
stiva:= stiva^.link;
end;
end.
