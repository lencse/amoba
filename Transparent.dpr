program Transparent;
uses
  SysUtils,TablaU,Dialogs;
var f:textfile;
    tabla:TTabla;
    tm,mostjon,i,j:byte;
    s:string[29];
begin
  if not fileexists('amoba0.tmp') then
    begin
      showmessage('Nem létezik: amoba0.tmp');
      exit;
    end;
  assignfile(f,'amoba0.tmp');
  reset(f);
  readln(f,tm,mostjon);
  tabla:=ttabla.create(tm);
  for i:=1 to tm do
    begin
      readln(f,s);
      for j:=1 to tm do
        tabla.t[j,i]:=strtoint(s[j]);
    end;
  closefile(f);
  tabla.gep(mostjon,i,j);
  assignfile(f,'amoba1.tmp');
  rewrite(f);
  write(f,i,' ',j);
  closefile(f);
  tabla.Destroy;
  assignfile(f,'amoba0.tmp');
  erase(f);
end.
