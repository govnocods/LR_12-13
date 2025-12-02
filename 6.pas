
var
  f: file of Char;
  c: Char;
  pos: Integer;

begin
  Assign(f, 'text6.dat');
  Reset(f);

  pos := 0;

  while pos < FileSize(f) do
  begin
    Seek(f, pos);    
    Read(f, c);      

    if (pos + 1) mod 2 = 0 then
    begin
      c := '!';      
      Seek(f, pos);  
      Write(f, c);
    end;

    Inc(pos);
  end;

  Close(f);
end.
