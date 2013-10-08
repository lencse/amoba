unit Optionsf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, GameOptionsf, StdCtrls, ColorOptionsf, Amobaf;

type
  TOptionsForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GameOptions1: TGameOptions;
    Button1: TButton;
    Button2: TButton;
    TabSheet2: TTabSheet;
    ColorOptions1: TColorOptions;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  opt0:toptions;
  c0:tcolopt;
  OptionsForm: TOptionsForm;

implementation

{$R *.DFM}

procedure TOptionsForm.Button1Click(Sender: TObject);
begin
  with opt0,gameoptions1 do
    begin
      if radiobutton1.Checked then
        ir[1]:=1
      else
        ir[1]:=2;
      if radiobutton3.Checked then
        ir[2]:=1
      else
        ir[2]:=2;
      n[1]:=edit1.text;
      n[2]:=edit2.text;
      iksz:=radiogroup1.itemindex+1;
      kezd:=combobox1.itemindex+1;
      tm:=spinedit1.Value;
      gomb:=not checkbox1.checked;
      ido:=spinedit2.value;
      col:=c0;
    end;
end;

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
  pagecontrol1.activepageindex:=0;
end;

procedure TOptionsForm.FormShow(Sender: TObject);
begin
  with opt0,gameoptions1 do
    begin
      radiobutton1.Checked:=ir[1]=1;
      radiobutton2.Checked:=ir[1]=2;
      radiobutton3.Checked:=ir[2]=1;
      radiobutton4.Checked:=ir[2]=2;
      button1.Enabled:=radiobutton2.Checked;
      button2.Enabled:=radiobutton4.Checked;
      edit1.text:=n[1];
      edit2.text:=n[2];
      radiogroup1.itemindex:=iksz-1;
      radiogroup2.itemindex:=2-iksz;
      combobox1.ItemIndex:=kezd-1;
      spinedit1.Value:=tm;
      checkbox1.Checked:=not gomb;
      spinedit2.Value:=ido;
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
  c0:=opt0.col;
  coloroptions1.ListBox1.itemindex:=0;
  coloroptions1.Shape1.Brush.Color:=c0.tc;
end;

procedure TOptionsForm.TabSheet1Show(Sender: TObject);
begin
  clientwidth:=314;
  clientheight:=368;
end;

procedure TOptionsForm.TabSheet2Show(Sender: TObject);
begin
  clientwidth:=189;
  clientheight:=280;
end;

end.
