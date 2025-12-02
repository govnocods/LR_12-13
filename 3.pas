
var
  sourceFile, oddFile, evenFile: text;
  num: real;
  position: integer;
  sourceFileName: string = 'numbers.txt';
  oddFileName: string = 'odd.txt';
  evenFileName: string = 'even.txt';

begin
  assign(sourceFile, sourceFileName);
  reset(sourceFile);
  
  assign(oddFile, oddFileName);
  rewrite(oddFile);
  
  assign(evenFile, evenFileName);
  rewrite(evenFile);
  
  position := 1;
  while not eof(sourceFile) do
  begin
    read(sourceFile, num);
    if position mod 2 = 1 then
      writeln(oddFile, num)
    else
      writeln(evenFile, num);
    Inc(position);
  end;
  
  close(sourceFile);
  close(oddFile);
  close(evenFile);
  
  writeln('Файлы созданы успешно.');
end.

