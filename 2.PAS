var
  filetext: text;
  n, k: integer;
begin
  write('Введите N: ');
  readln(n);
  write('Введите K: ');
  readln(k);
  assign(filetext, 'C:\Учеба\ОАиП\ЛР 12-13\text2.txt');
  rewrite(filetext);
  for var i := 1 to n do
    writeln(filetext, StringOfChar('*', k));
  close(filetext);
  writeln('Файл создан успешно!');
end.

