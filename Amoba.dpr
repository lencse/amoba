program Amoba;

uses
  Forms,
  Amobaf in 'Amobaf.pas' {FormFo};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Am�ba v3.0';
  Application.CreateForm(TFormFo, FormFo);
  Application.Run;
end.
