var
  f: text;
  fileName: string = 'numbers.txt';
  el, el1, el2: real;
  lastLocalMax: real;
  found: boolean;
begin
  assign(f, fileName);
  reset(f);
  
  read(f, el1);
  found := false;
  
  if eof(f) then
  begin
    if el > el1 then
    begin
      lastLocalMax := el;
      found := true;
    end
    else if el1 > el then
    begin
      lastLocalMax := el1;
      found := true;
    end;
  end
  else
  begin
    if el > el1 then
    begin
      lastLocalMax := el;
      found := true;
    end;
    
    read(f, el2);
    while not eof(f) do
    begin
      if (el1 > el) and (el1 > el2) then
      begin
        lastLocalMax := el1;
        found := true;
      end;
      el := el1;
      el1 := el2;
      read(f, el2);
    end;
    
    if (el1 > el) then
    begin
      lastLocalMax := el1;
      found := true;
    end;
  end;
  
  close(f);
  
  if found then
    writeln('Последний локальный максимум: ', lastLocalMax:0:2)
  else
    writeln('Локальный максимум не найден.');
end.

