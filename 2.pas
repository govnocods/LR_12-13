
var
  sourceFile, resultFile: text;
  line: string;
  maxLen: integer;
  maxLines: array of string;
  i, count: integer;

begin
  Assign(sourceFile, 'C:\Учеба\ОАиП\ЛР 13\text2.txt');
  Assign(resultFile, 'C:\Учеба\ОАиП\ЛР 13\text2out.txt');
  
  Reset(sourceFile);
  maxLen := 0;
  while not Eof(sourceFile) do
  begin
    ReadLn(sourceFile, line);
    if Length(line) > maxLen then
      maxLen := Length(line);
  end;
  Close(sourceFile);
  
  if maxLen = 0 then
  begin
    Rewrite(resultFile);
    Close(resultFile);
  end
  else
  begin
    Reset(sourceFile);
    count := 0;
    SetLength(maxLines, 0); 
    
    while not Eof(sourceFile) do
    begin
      ReadLn(sourceFile, line);
      if Length(line) = maxLen then
      begin
        SetLength(maxLines, count + 1);
        maxLines[count] := line;
        Inc(count);
      end;
    end;
    Close(sourceFile);
    
    Rewrite(resultFile); 
    
    i := count;
    while i > 0 do
    begin
      Dec(i);
      WriteLn(resultFile, maxLines[i]);
    end;
      
    Close(resultFile);
  end;
end.