unit ColorOptionsf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Amobaf;

type
  TColorOptions = class(TFrame)
    PaintBox1: TPaintBox;
    ColorDialog1: TColorDialog;
    ListBox1: TListBox;
    Shape1: TShape;
    Button1: TButton;
    procedure PaintBox1Paint(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses optionsf;

const t:array[1..7] of string[10]=('x  o x    ',
                                   '  o o   x ',
                                   'ox oxxxo  ',
                                   '   x  x o ',
                                   'xxooooo xo',
                                   'xo  oxx  o',
                                   '   xx     ');

procedure TColorOptions.PaintBox1Paint(Sender: TObject);
var i,j,x1,y1,x2,y2:integer;
begin
  with paintbox1.canvas do
    begin
      pen.color:=c0.tc;
      brush.color:=pen.color;
      rectangle(0,0,169,119);
      pen.color:=c0.rc;
      for i:=0 to 9 do
        begin
          moveto(11+i*18,0);
          lineto(11+i*18,120);
          if i<6 then
            begin
              moveto(0,15+i*18);
              lineto(170,15+i*18);
            end;
        end;
      pen.color:=c0.hlc;
      brush.color:=pen.color;
      for i:=1 to 5 do
        rectangle(i*18+12,70,i*18+29,87);
      for i:=-1 to 8 do
        for j:=-1 to 5 do
          begin
            x1:=i*18+15;
            y1:=j*18+19;
            x2:=i*18+26;
            y2:=j*18+30;
            if t[j+2,i+2]='x' then
              begin
                Pen.color:=c0.xc;
                MoveTo(x1,y1);
                LineTo(x2,y2);
                MoveTo(x1+1,y1);
                LineTo(x2,y2-1);
                MoveTo(x1,y1+1);
                LineTo(x2-1,y2);
                MoveTo(x1,y2-1);
                LineTo(x2,y1-1);
                MoveTo(x1,y2-2);
                LineTo(x2-1,y1-1);
                MoveTo(x1+1,y2-1);
                LineTo(x2,y1);
              end;
            if t[j+2,i+2]='o' then
              begin
                Pen.color:=c0.oc;
                brush.color:=pen.color;
                Ellipse(x1,y1,x2,y2);
              end;
          end;
    end;
end;

procedure TColorOptions.ListBox1Click(Sender: TObject);
begin
  case listbox1.itemindex of
    0:shape1.brush.color:=c0.tc;
    1:shape1.brush.color:=c0.rc;
    2:shape1.brush.color:=c0.xc;
    3:shape1.brush.color:=c0.oc;
    4:shape1.brush.color:=c0.hlc;
  end;
end;

procedure TColorOptions.Button1Click(Sender: TObject);
begin
  case listbox1.ItemIndex of
    0:colordialog1.color:=c0.tc;
    1:colordialog1.color:=c0.rc;
    2:colordialog1.color:=c0.xc;
    3:colordialog1.color:=c0.oc;
    4:colordialog1.color:=c0.hlc;
  end;
  if colordialog1.execute then
    case listbox1.itemindex of
      0:c0.tc:=colordialog1.color;
      1:c0.rc:=colordialog1.color;
      2:c0.xc:=colordialog1.color;
      3:c0.oc:=colordialog1.color;
      4:c0.hlc:=colordialog1.color;
    end;
  case listbox1.itemindex of
    0:shape1.brush.color:=c0.tc;
    1:shape1.brush.color:=c0.rc;
    2:shape1.brush.color:=c0.xc;
    3:shape1.brush.color:=c0.oc;
    4:shape1.brush.color:=c0.hlc;
  end;
  paintbox1.Invalidate;
end;

procedure TColorOptions.PaintBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var i,j:integer;
begin
  if ((x-11) mod 18=0) or ((y-15) mod 18=0) then
    listbox1.itemindex:=1
  else
    begin
      i:=(x-12) div 18+2;
      j:=(y-16) div 18+2;
      if (j=5) and (i in [3..7]) then
        listbox1.itemindex:=4
      else
        if t[j,i]='x' then
          listbox1.itemindex:=2
        else
          if t[j,i]='o' then
            listbox1.itemindex:=3
          else
            listbox1.itemindex:=0;
    end;
  case listbox1.itemindex of
    0:shape1.brush.color:=c0.tc;
    1:shape1.brush.color:=c0.rc;
    2:shape1.brush.color:=c0.xc;
    3:shape1.brush.color:=c0.oc;
    4:shape1.brush.color:=c0.hlc;
  end;
end;

procedure TColorOptions.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then button1click(self);
end;

end.
