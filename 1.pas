
var
  charFileName: string = 'C:\Учеба\ОАиП\ЛР 13\text1.txt';
  
  f: file of char;
  ch: char;
  data: string;
  lastSpace: integer;
  i: integer;
begin
  assign(f, charFileName);
  reset(f);
  data := '';
  while not eof(f) do
  begin
    read(f, ch);
    data := data + ch;
  end;
  close(f);
  
  lastSpace := Length(data);
  while (lastSpace > 0) and (data[lastSpace] <> ' ') do
    Dec(lastSpace);
  
  if lastSpace = 0 then
  begin
    writeln('В файле нет пробелов.');
  end
  else
  begin
    SetLength(data, lastSpace - 1);
    
    rewrite(f);
    for i := 1 to Length(data) do
    begin
      ch := data[i];
      write(f, ch);
    end;
    close(f);
    
    writeln('Часть после последнего пробела удалена.');
  end;
end.
