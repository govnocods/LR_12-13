var
  inputfile, outputfile: text;
  number, maxNum, minNum: integer;
  firstNumber: boolean;
begin
  assign(inputfile, 'C:\Учеба\ОАиП\ЛР 12-13\input.txt');
  assign(outputfile, 'C:\Учеба\ОАиП\ЛР 12-13\output.txt');
  
  reset(inputfile);
  firstNumber := true;
  
  while not eof(inputfile) do
  begin
    readln(inputfile, number);
    
    if firstNumber then
    begin
      maxNum := number;
      minNum := number;
      firstNumber := false;
    end
    else
    begin
      if number > maxNum then
        maxNum := number;
      if number < minNum then
        minNum := number;
    end;
  end;
  
  close(inputfile);
  
  rewrite(outputfile);
  writeln(outputfile, 'Минимальное число: ', minNum);
  writeln(outputfile, 'Максимальное число: ', maxNum);
  close(outputfile);
  
  writeln('Минимальное число: ', minNum);
  writeln('Максимальное число: ', maxNum);
  writeln('Результат записан в output.txt');
end.
