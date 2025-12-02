var
  f, f_temp: text;
  fileName: string = 'numbers.txt';
  temp, minVal, maxVal: real;
  minIndex, maxIndex: integer;
  i: integer;
begin
  assign(f, fileName);
  reset(f);
  
  read(f, temp);
  minVal := temp;
  maxVal := temp;
  minIndex := 0;
  maxIndex := 0;
  i := 1;
  
  while not eof(f) do
  begin
    read(f, temp);
    if temp < minVal then
    begin
      minVal := temp;
      minIndex := i;
    end;
    if temp > maxVal then
    begin
      maxVal := temp;
      maxIndex := i;
    end;
    Inc(i);
  end;
  close(f);
  
  if minIndex = maxIndex then
  begin
    writeln('Минимальный и максимальный элементы совпадают.');
    exit;
  end;
  
  assign(f_temp, fileName + '_temp');
  rewrite(f_temp);
  reset(f);
  
  i := 0;
  while not eof(f) do
  begin
    read(f, temp);
    if i = minIndex then
      writeln(f_temp, maxVal)
    else if i = maxIndex then
      writeln(f_temp, minVal)
    else
      writeln(f_temp, temp);
    Inc(i);
  end;
  
  close(f);
  close(f_temp);
  
  erase(f);
  assign(f_temp, fileName + '_temp');
  rename(f_temp, fileName);
  
  writeln('Минимальный и максимальный элементы поменяны местами.');
end.

