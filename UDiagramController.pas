unit UDiagramController;

interface

uses
  UDiagram, VCL.TMSFNCBloxControl, Vcl.Dialogs, System.Classes, System.SysUtils;

type
  TDiagramController = class abstract
  public
    procedure loadDiagramToFile(diagram : TDiagram; openDialog : TOpenDialog;
                                  control : TTMSFNCBloxControl);
    procedure saveDiagramToFile(diagram : TDiagram; saveDialog : TSaveDialog;
                                  control : TTMSFNCBloxControl);
    var IsLoadesDiagram : boolean;
  private
    procedure replaceNodeNames(fileName : String);
    function filterIDFromFileName(fileName : String) : String;
    function filterNameFromFileName(fileName : String) : String;
    function filterVersionFromFileName(fileName : String) : String;
  end;

implementation

procedure TDiagramController.loadDiagramToFile(diagram : TDiagram;
              openDialog : TOpenDialog; control : TTMSFNCBloxControl);
begin
  openDialog.Execute();
  replaceNodeNames(openDialog.FileName);

end;

procedure TDiagramController.saveDiagramToFile(diagram : TDiagram;
              saveDialog : TSaveDialog; control : TTMSFNCBloxControl);
begin

end;

procedure TDiagramController.replaceNodeNames(fileName : String);
var
  openFile : TStringList;
  I : Integer;
begin
  openFile := TStringList.Create;
  openFile.LoadFromFile(fileName);
  for I := 0 to openFile.Count-1 do
  begin
    openFile[I] := StringReplace(openFile[I], 'TEnd',
              'TTMSFNCBloxUMLFinalStateBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'TStart',
              'TTMSFNCBloxUMLInitialStateBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'THumanTask',
              'TTMSFNCBloxUMLActionStateBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'THumanDecision',
              'TTMSFNCBloxUMLDecisionBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'TMachineTask',
              'TTMSFNCBloxUMLActionStateBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'TMachineDecision',
              'TTMSFNCBloxUMLDecisionBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'TEdge',
              'TTMSFNCBloxDFDDataFlowLine', [rfReplaceAll, rfIgnoreCase]);
  end;
  openFile.SaveToFile(fileName);
end;

function TDiagramController.filterIDFromFileName(fileName : String) : String;
begin

end;

function TDiagramController.filterNameFromFileName(fileName : String) : String;
begin

end;

function TDiagramController.filterVersionFromFileName(fileName : String) : String;
begin

end;

end.
