program Prozessdesigner;

uses
  Vcl.Forms,
  Designer in 'Designer.pas' {Form1},
  CalcUnit in 'CalcUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
