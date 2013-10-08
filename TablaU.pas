unit TablaU;

interface

type
  arrtabla=array[1..50,1..50] of byte;
  TTabla = class
    private
      ft:arrtabla;
      fm:byte;
      function gett(i, j: byte): byte;
      procedure sett(i, j: byte; const Value: byte);
      function getm: byte;
      procedure setm(const Value: byte);
    public
      property m:byte read getm write setm;
      property t[i,j:byte]:byte read gett write sett;
      constructor create(setm:byte); virtual;
      procedure gep(j0:byte;var x,y:byte);
      function gyoztes(var x1,y1:byte;var x2,y2:shortint):byte;
  end;

implementation

constructor TTabla.create(setm:byte);
begin
  m:=setm;
  randomize;
end;

procedure TTabla.gep(j0:byte;var x,y:byte);
type tomb=array[0..4] of integer;
const h1:tomb=(0,4,70,550,10000);
      h2:tomb=(0,10,150,900,300000);
var i,j,a:byte;
    v1,v2,s,s0,b:integer;
    h:array[1..30,1..30] of integer;
    tx,ty:array[1..900] of byte;
    o:boolean;
begin
  o:=true;
  for i:=1 to m do
    for j:=1 to m do
      if t[i,j]<>0 then
        begin
          o:=false;
          break;
        end;
  if o then
    begin
      x:=random(m div 3)+m div 3+1;
      y:=random(m div 3)+m div 3+1;
      exit;
    end;
  fillchar(h,sizeof(h),0);
  for i:=1 to m-4 do
    for j:=1 to m do
      begin
        v1:=0;
        v2:=0;
        for a:=0 to 4 do
          begin
            if t[i+a,j]=3-j0 then inc(v1);
            if t[i+a,j]=j0 then inc(v2);
          end;
        b:=0;
        if v1=0 then b:=h2[v2];
        if v2=0 then b:=h1[v1];
        for a:=0 to 4 do
          inc(h[i+a,j],b);
      end;
  for i:=1 to m do
    for j:=1 to m-4 do
      begin
        v1:=0;
        v2:=0;
        for a:=0 to 4 do
          begin
            if t[i,j+a]=3-j0 then inc(v1);
            if t[i,j+a]=j0 then inc(v2);
          end;
        b:=0;
        if v1=0 then b:=h2[v2];
        if v2=0 then b:=h1[v1];
        for a:=0 to 4 do
          inc(h[i,j+a],b);
      end;
  for i:=1 to m-4 do
    for j:=1 to m-4 do
      begin
        v1:=0;
        v2:=0;
        for a:=0 to 4 do
          begin
            if t[i+a,j+a]=3-j0 then inc(v1);
            if t[i+a,j+a]=j0 then inc(v2);
          end;
        b:=0;
        if v1=0 then b:=h2[v2];
        if v2=0 then b:=h1[v1];
        for a:=0 to 4 do
          inc(h[i+a,j+a],b);
      end;
  for i:=5 to m do
    for j:=1 to m-4 do
      begin
        v1:=0;
        v2:=0;
        for a:=0 to 4 do
          begin
            if t[i-a,j+a]=3-j0 then inc(v1);
            if t[i-a,j+a]=j0 then inc(v2);
          end;
        b:=0;
        if v1=0 then b:=h2[v2];
        if v2=0 then b:=h1[v1];
        for a:=0 to 4 do
          inc(h[i-a,j+a],b);
      end;
  for i:=1 to m do
    for j:=1 to m do
      if t[i,j]>0 then h[i,j]:=-1;
  s:=1;
  tx[1]:=1;
  ty[1]:=1;
  for i:=1 to m do
    for j:=1 to m do
      if h[i,j]>h[tx[1],ty[1]] then
        begin
          s:=1;
          tx[1]:=i;
          ty[1]:=j;
        end
      else
        if h[i,j]=h[tx[1],ty[1]] then
          begin
            inc(s);
            tx[s]:=i;
            ty[s]:=j;
          end;
  s0:=random(s)+1;
  x:=tx[s0];
  y:=ty[s0];
end;

function TTabla.getm: byte;
begin
  result:=fm;
end;

function TTabla.gett(i,j: byte): byte;
begin
  result:=ft[i,j];
end;

function TTabla.gyoztes;
var i,j,a,x:byte;
    b,d:boolean;
begin
  x1:=0;
  x2:=0;
  y1:=0;
  y2:=0;
  result:=0;
  d:=true;
  for i:=1 to m-4 do
    for j:=1 to m do
      begin
        b:=false;
        x:=t[i,j];
        for a:=1 to 4 do
          if t[i+a,j]<>0 then
            if x=0 then
              x:=t[i+a,j]
            else
              if x<>t[i+a,j] then b:=true;
        if not b then d:=false;
      end;
  for i:=1 to m do
    for j:=1 to m-4 do
      begin
        b:=false;
        x:=t[i,j];
        for a:=1 to 4 do
          if t[i,j+a]<>0 then
            if x=0 then
              x:=t[i,j+a]
            else
              if x<>t[i,j+a] then b:=true;
        if not b then d:=false;
      end;
  for i:=1 to m-4 do
    for j:=1 to m-4 do
      begin
        b:=false;
        x:=t[i,j];
        for a:=1 to 4 do
          if t[i+a,j+a]<>0 then
            if x=0 then
              x:=t[i+a,j+a]
            else
              if x<>t[i+a,j+a] then b:=true;
        if not b then d:=false;
      end;
  for i:=5 to m do
    for j:=1 to m-4 do
      begin
        b:=false;
        x:=t[i,j];
        for a:=1 to 4 do
          if t[i-a,j+a]<>0 then
            if x=0 then
              x:=t[i-a,j+a]
            else
              if x<>t[i-a,j+a] then b:=true;
        if not b then d:=false;
      end;
  if d then
    begin
      result:=3;
      exit;
    end;
  for x:=1 to 2 do
    begin
      for i:=1 to m-4 do
        for j:=1 to m do
          if t[i,j]=x then
            begin
              b:=true;
              for a:=1 to 4 do
                if t[i+a,j]<>x then b:=false;
              if b then
                begin
                  x1:=i;
                  y1:=j;
                  x2:=1;
                  y2:=0;
                  result:=x;
                  exit;
                end;
            end;
      for i:=1 to m do
        for j:=1 to m-4 do
          if t[i,j]=x then
            begin
              b:=true;
              for a:=1 to 4 do
                if t[i,j+a]<>x then b:=false;
              if b then
                begin
                  x1:=i;
                  y1:=j;
                  x2:=0;
                  y2:=1;
                  result:=x;
                  exit;
                end;
            end;
      for i:=1 to m-4 do
        for j:=1 to m-4 do
          if t[i,j]=x then
            begin
              b:=true;
              for a:=1 to 4 do
                if t[i+a,j+a]<>x then b:=false;
              if b then
                begin
                  x1:=i;
                  y1:=j;
                  x2:=1;
                  y2:=1;
                  result:=x;
                  exit;
                end;
            end;
      for i:=5 to m do
        for j:=1 to m-4 do
          if t[i,j]=x then
            begin
              b:=true;
              for a:=1 to 4 do
                if t[i-a,j+a]<>x then b:=false;
              if b then
                begin
                  x1:=i;
                  y1:=j;
                  x2:=-1;
                  y2:=1;
                  result:=x;
                  exit;
                end;
            end;
    end;
end;

procedure TTabla.setm(const Value: byte);
begin
  fm:=value;
  fillchar(ft,sizeof(ft),0);
end;

procedure TTabla.sett(i, j: byte; const Value: byte);
begin
  ft[i,j]:=value;
end;

end.
