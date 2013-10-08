unit Tovabblepf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons;

type
  TFormTovabblep = class(TForm)
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTovabblep: TFormTovabblep;

implementation

uses amobaf;

{$R *.DFM}

procedure TFormTovabblep.FormCreate(Sender: TObject);
begin
  clientwidth:=90;
end;

procedure TFormTovabblep.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=false;
end;

procedure TFormTovabblep.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then formfo.setfocus;
end;

end.
