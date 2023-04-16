program Prozessdesigner;

uses
  Vcl.Forms,
  UDesigner in 'UDesigner.pas' {DesignerForm},
  UDatabase in 'UDatabase.pas',
  UNodes in 'UNodes.pas',
  UToolBar in 'UToolBar.pas',
  UNodeSelection in 'UNodeSelection.pas' {NodeSelectionForm},
  UEdge in 'UEdge.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDesignerForm, DesignerForm);
  Application.CreateForm(TNodeSelectionForm, NodeSelectionForm);
  Application.Run;
end.
