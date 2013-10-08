unit GameOptionsf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ExtCtrls;

type
  TGameOptions = class(TFrame)
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    Combobox1: TComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit2: TEdit;
    RadioGroup2: TRadioGroup;
    GroupBox4: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button2: TButton;
    Spinedit1: TSpinEdit;
    CheckBox1: TCheckBox;
    SpinEdit2: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Gepbeallf;

{$R *.DFM}

procedure TGameOptions.RadioGroup1Click(Sender: TObject);
begin
  if sender=radiogroup1 then
    radiogroup2.itemindex:=1-radiogroup1.itemindex
  else
    radiogroup1.itemindex:=1-radiogroup2.itemindex;
end;

procedure TGameOptions.Button1Click(Sender: TObject);
begin
  try
    if not assigned(formfilebeall) then formfilebeall:=tformfilebeall.create(application);
    if sender=button1 then
      formfilebeall.tag:=1
    else
      formfilebeall.tag:=2;
    formfilebeall.ShowModal;
  finally
    freeandnil(formfilebeall);
  end;
end;

procedure TGameOptions.RadioButton1Click(Sender: TObject);
begin
  button1.Enabled:=radiobutton2.Checked;
  button2.Enabled:=radiobutton4.Checked;
  if radiobutton2.checked and radiobutton4.checked then
    begin
      checkbox1.enabled:=true;
      label4.enabled:=true;
      spinedit2.enabled:=checkbox1.checked;
    end
  else
    begin
      checkbox1.enabled:=false;
      label4.enabled:=false;
      spinedit2.enabled:=false;
    end;
end;

procedure TGameOptions.CheckBox1Click(Sender: TObject);
begin
  spinedit2.enabled:=checkbox1.checked;
end;

end.
