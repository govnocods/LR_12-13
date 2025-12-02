var
  f_in, f_out: text;
  n, sum: int64;
  p, candidate: int64;
  
function IsPrime(num: int64): boolean;
var
  i: int64;
begin
  if num < 2 then
  begin
    IsPrime := false;
    exit;
  end;
  if num = 2 then
  begin
    IsPrime := true;
    exit;
  end;
  if num mod 2 = 0 then
  begin
    IsPrime := false;
    exit;
  end;
  
  i := 3;
  while i * i <= num do
  begin
    if num mod i = 0 then
    begin
      IsPrime := false;
      exit;
    end;
    i := i + 2;
  end;
  IsPrime := true;
end;

begin
  assign(f_in, 'C:\Учеба\ОАиП\ЛР 12-13\z3.in');
  assign(f_out, 'C:\Учеба\ОАиП\ЛР 12-13\z3.out');
  
  reset(f_in);
  readln(f_in, n);
  close(f_in);
  
  sum := 0;
  p := 2;

  while true do
  begin
    candidate := p;
    if candidate * candidate > n then
      break; 
      
    candidate := candidate * candidate; 
    
    if candidate > n then
      break; 
      
    candidate := candidate * candidate; 
    
    if candidate > n then
      break;

    if IsPrime(p) then
      sum := sum + candidate;
    
    if p = 2 then
      p := 3
    else
      p := p + 2;
  end;
  
  rewrite(f_out);
  writeln(f_out, sum);
  close(f_out);
  
  writeln('Сумма чисел с 5 делителями: ', sum);
end.

