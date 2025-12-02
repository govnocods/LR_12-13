var
  filetext, tempfile: text;
  k, lineNum: integer;
  line: string;
  found: boolean;
begin
  write('Введите номер строки K: ');
  readln(k);
  assign(filetext, 'C:\Учеба\ОАиП\ЛР 12-13\text4.txt');
  assign(tempfile, 'C:\Учеба\ОАиП\ЛР 12-13\text4_temp.txt');
  
  reset(filetext);
  rewrite(tempfile);
  lineNum := 0;
  found := false;
  
  while not eof(filetext) do
  begin
    readln(filetext, line);
    lineNum := lineNum + 1;

    if lineNum = k then
    begin
      writeln(tempfile, '');
      found := true;
    end;
    
    writeln(tempfile, line);
  end;
  
  close(filetext);
  close(tempfile);

  if found then
  begin
    DeleteFile('C:\Учеба\ОАиП\ЛР 12-13\text4.txt');
    RenameFile('C:\Учеба\ОАиП\ЛР 12-13\text4_temp.txt', 'C:\Учеба\ОАиП\ЛР 12-13\text4.txt');
    writeln('Пустая строка вставлена перед строкой ', k, '!');
  end
  else
  begin
    DeleteFile('C:\Учеба\ОАиП\ЛР 12-13\text4_temp.txt');
    writeln('Строки с номером ', k, ' не найдено. Файл не изменен.');
  end;
end.
