program Prozessdesigner;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {Form1},
  UDatabase in 'UDatabase.pas',
  UNodes in 'UNodes.pas',
  UToolBar in 'UToolBar.pas',
  UNodeSelection in 'UNodeSelection.pas' {Form2},
  UEdge in 'UEdge.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
