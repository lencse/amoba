unit Nevjegyf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  Tformnevjegy = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    x1,y1,x2,y2,x3,y3,x4,y4:integer;
    ix1,iy1,ix2,iy2,ix3,iy3,ix4,iy4:shortint;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formnevjegy: Tformnevjegy;

implementation

{$R *.DFM}

procedure Tformnevjegy.FormCreate(Sender: TObject);
begin
  x1:=5;
  y1:=12;
  x2:=33;
  y2:=21;
  x3:=36;
  y3:=41;
  x4:=26;
  y4:=31;
  ix1:=4;
  iy1:=-3;
  ix2:=1;
  iy2:=-3;
  ix3:=2;
  iy3:=-2;
  ix4:=3;
  iy4:=-5;
end;

procedure Tformnevjegy.Timer1Timer(Sender: TObject);
begin
  with paintbox1.Canvas do
    begin
      pen.color:=clbtnface;
      moveto(x1,y1);
      lineto(x2,y2);
      lineto(x3,y3);
      lineto(x4,y4);
      lineto(x1,y1);
      if (x1+ix1>paintbox1.Width) or (x1+ix1<0) then ix1:=-ix1;
      if (y1+iy1>paintbox1.Height) or (y1+iy1<0) then iy1:=-iy1;
      if (x2+ix2>paintbox1.Width) or (x2+ix2<0) then ix2:=-ix2;
      if (y2+iy2>paintbox1.Height) or (y2+iy2<0) then iy2:=-iy2;
      if (x3+ix3>paintbox1.Width) or (x3+ix3<0) then ix3:=-ix3;
      if (y3+iy3>paintbox1.Height) or (y3+iy3<0) then iy3:=-iy3;
      if (x4+ix4>paintbox1.Width) or (x4+ix4<0) then ix4:=-ix4;
      if (y4+iy4>paintbox1.Height) or (y4+iy4<0) then iy4:=-iy4;
      inc(x1,ix1);
      inc(y1,iy1);
      inc(x2,ix2);
      inc(y2,iy2);
      inc(x3,ix3);
      inc(y3,iy3);
      inc(x4,ix4);
      inc(y4,iy4);
      pen.color:=clblack;
      moveto(x1,y1);
      lineto(x2,y2);
      lineto(x3,y3);
      lineto(x4,y4);
      lineto(x1,y1);
    end;
end;

end.
