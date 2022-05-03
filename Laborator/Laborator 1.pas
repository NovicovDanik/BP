Program L1EX8;
procedure Cout(n: integer; var s: byte);
begin
if n<10 then s:=1
 else
begin
 Cout( n div 10, s);
 s:=s+1;
end;
end;
var a:integer;
s:byte;
 begin
  write('Введите натуральное число = ');
  readln(a);
  Cout(a,s);
  write('Количество чисел = ',s);
end.