var
  filetext: text;
  a: string;
begin
  assign(filetext, 'C:\Учеба\ОАиП\ЛР 12-13\text.txt');
  rewrite(filetext);
  for var i := 1 to 10 do
    writeln(filetext, i);
  close(filetext);
  reset(filetext);
  for var i := 1 to 10 do
  begin
    readln(filetext, a);
    writeln(a);
  end;
  close(filetext);
end.

