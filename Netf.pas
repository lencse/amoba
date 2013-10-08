unit Netf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormNet = class(TForm)
    GroupBox1: TGroupBox;
    Combobox1: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Combobox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNet: TFormNet;

implementation

{$R *.DFM}

uses amobaf;

procedure TFormNet.FormCreate(Sender: TObject);
var s:string;
    j0:byte;
begin
  combobox1.itemindex:=0;
  j0:=combobox1.ItemIndex+1;
  s:='Irányító: ';
  if formfo.ir[j0]=1 then
    s:=s+'Ember'
  else
    s:=s+'Számítógép';
  s:=s+#13+'Név: '+formfo.n[j0]+#13+'Figura: ';
  if formfo.iksz=j0 then
    s:=s+'X'
  else
    s:=s+'O';
  label2.caption:=s;
end;

procedure TFormNet.Combobox1Change(Sender: TObject);
var s:string;
    j0:byte;
begin
  j0:=combobox1.ItemIndex+1;
  s:='Irányító: ';
  if formfo.ir[j0]=1 then
    s:=s+'Ember'
  else
    s:=s+'Számítógép';
  s:=s+#13+'Név: '+formfo.n[j0]+#13+'Figura: ';
  if formfo.iksz=j0 then
    s:=s+'X'
  else
    s:=s+'O';
  label2.caption:=s;
end;

end.
