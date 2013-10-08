unit LunarStrain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Trgb=record
    r,g,b:byte;
  end;

function rgbtocol(r,g,b:byte):TColor; overload;
function rgbtocol(rgb:Trgb):TColor; overload;
function coltorgb(c:TColor):Trgb;
procedure line(Canvas:TCanvas;x1,y1,x2,y2:integer);
procedure emptyrect(Canvas:TCanvas;x1,y1,x2,y2:integer);
function dialogwin(const msg,capt:string;buttons:TMsgDlgButtons):word;

implementation

function rgbtocol(r,g,b:byte):TColor; overload;
begin
  result:=r+g*256+b*65536;
end;

function rgbtocol(rgb:Trgb):TColor; overload;
begin
  result:=rgb.r+rgb.g*256+rgb.b*65536;
end;

function coltorgb;
begin
  result.r:=c mod 256;
  c:=c div 256;
  result.g:=c mod 256;
  c:=c div 256;
  result.b:=c mod 256;
end;

procedure line;
begin
  canvas.MoveTo(x1,y1);
  canvas.LineTo(x2,y2);
end;

procedure emptyrect;
begin
  with canvas do
    begin
      moveto(x1,y1);
      lineto(x1,y2);
      lineto(x2,y2);
      lineto(x2,y1);
      lineto(x1,y1);
    end;
end;

function dialogwin;
var btn,kp,i:integer;
    btns:array[1..8] of TMsgDlgBtn;
    label1:tlabel;
    bevel1:tbevel;
    form: TForm;
begin
  form:=tform.create(application);
  form.BorderStyle:=bsDialog;
  bevel1:=tbevel.Create(form);
  label1:=tlabel.create(form);
  bevel1.parent:=form;
  label1.parent:=form;
  form.Position:=poMainFormCenter;
  form.caption:=capt;
  label1.caption:=msg;
  label1.Alignment:=tacenter;
  bevel1.height:=label1.Height+16;
  form.clientheight:=bevel1.height+54;
  btn:=0;
  if mbok in buttons then
    begin
      inc(btn);
      btns[btn]:=mbok;
    end;
  if mbcancel in buttons then
    begin
      inc(btn);
      btns[btn]:=mbcancel;
    end;
  if mbabort in buttons then
    begin
      inc(btn);
      btns[btn]:=mbabort;
    end;
  if mbretry in buttons then
    begin
      inc(btn);
      btns[btn]:=mbretry;
    end;
  if mbignore in buttons then
    begin
      inc(btn);
      btns[btn]:=mbignore;
    end;
  if mbyes in buttons then
    begin
      inc(btn);
      btns[btn]:=mbyes;
    end;
  if mbno in buttons then
    begin
      inc(btn);
      btns[btn]:=mbno;
    end;
  if mball in buttons then
    begin
      inc(btn);
      btns[btn]:=mball;
    end;
  if btn*80>label1.width+21 then
    begin
      form.clientwidth:=btn*80+11;
      kp:=8;
    end
  else
    begin
      form.clientwidth:=label1.Width+32;
      kp:=(form.clientwidth-btn*80+5) div 2;
    end;
  label1.left:=(form.clientwidth-label1.Width) div 2;
  label1.top:=16;
  bevel1.left:=8;
  bevel1.top:=8;
  bevel1.width:=form.clientwidth-16;
  bevel1.Height:=label1.height+16;
  for i:=1 to btn do
    with tbutton.create(form) do
      begin
        parent:=form;
        left:=kp+(i-1)*80;
        top:=bevel1.Height+21;
        case btns[i] of
          mbok:
            begin
              caption:='&OK';
              modalresult:=mrok;
            end;
          mbcancel:
            begin
              caption:='&Mégsem';
              modalresult:=mrcancel;
            end;
          mbabort:
            begin
              caption:='&Befejez';
              modalresult:=mrabort;
            end;
          mbretry:
            begin
              caption:='Ú&jra';
              modalresult:=mrretry;
            end;
          mbignore:
            begin
              caption:='&Kihagy';
              modalresult:=mrignore;
            end;
          mbyes:
            begin
              caption:='&Igen';
              modalresult:=mryes;
            end;
          mbno:
            begin
              caption:='&Nem';
              modalresult:=mrno;
            end;
          mball:
            begin
              caption:='M&ind';
              modalresult:=mrall;
            end;
        end;
      end;
  result:=form.showmodal;
  freeandnil(form);
end;

end.
