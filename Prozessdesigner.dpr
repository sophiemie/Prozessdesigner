program Prozessdesigner;

uses
  Vcl.Forms,
  Designer in 'Designer.pas' {Form1},
  DatenbankUnit in 'DatenbankUnit.pas',
  UNodes in 'UNodes.pas',
  UToolBar in 'UToolBar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
