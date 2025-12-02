var
  filetext: text;
  s: string;
begin
  write('Введите строку для добавления: ');
  readln(s);
  assign(filetext, 'C:\Учеба\ОАиП\ЛР 12-13\text3.txt');
  append(filetext);
  writeln(filetext, s);
  close(filetext);
  writeln('Строка добавлена в конец файла!');
end.

