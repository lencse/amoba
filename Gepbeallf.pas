unit Gepbeallf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TFormFileBeall = class(TForm)
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    Button3: TButton;
    Label4: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    Bevel2: TBevel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure radioclick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFileBeall: TFormFileBeall;

implementation

{$R *.DFM}

uses LunarStrain, Optionsf;

procedure TFormFileBeall.Button1Click(Sender: TObject);
begin
  if not opendialog1.execute then exit;
  if not fileexists(opendialog1.filename) then
    begin
      dialogwin('Az állomány nem létezik!','Nem létezik',[mbok]);
      exit;
    end;
  edit1.text:=opendialog1.filename;
end;

procedure TFormFileBeall.radioclick(Sender: TObject);
begin
  button1.Enabled:=radiobutton2.Checked;
  if button1.enabled then button1.SetFocus;
end;

procedure TFormFileBeall.Button2Click(Sender: TObject);
begin
  opt0.gt[tag].proc:=radiobutton1.Checked;
  if not opt0.gt[tag].proc then opt0.gt[tag].exefile:=edit1.text;
end;

procedure TFormFileBeall.FormShow(Sender: TObject);
begin
  radiobutton1.Checked:=opt0.gt[tag].proc;
  radiobutton2.Checked:=not opt0.gt[tag].proc;
  edit1.text:=opt0.gt[tag].exefile;
  button1.Enabled:=radiobutton2.Checked;
end;

end.
