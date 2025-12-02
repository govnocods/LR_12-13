var
  filetext, tempfile: text;
  line: string;
begin
  assign(filetext, 'C:\Учеба\ОАиП\ЛР 12-13\text6.txt');
  assign(tempfile, 'C:\Учеба\ОАиП\ЛР 12-13\text6_temp.txt');
  
  reset(filetext);
  rewrite(tempfile);
  
  while not eof(filetext) do
  begin
    readln(filetext, line);
    if line <> '' then
      writeln(tempfile, line);
  end;
  
  close(filetext);
  close(tempfile);

  DeleteFile('C:\Учеба\ОАиП\ЛР 12-13\text6.txt');
  RenameFile('C:\Учеба\ОАиП\ЛР 12-13\text6_temp.txt', 'C:\Учеба\ОАиП\ЛР 12-13\text6.txt');
  
  writeln('Все пустые строки удалены из файла!');
end.

