unit Askf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormAsk = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAsk: TFormAsk;

implementation

{$R *.DFM}

end.
