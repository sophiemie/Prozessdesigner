unit UDesigner;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.SqlExpr,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, VCL.TMSFNCUtils,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys.MySQL, System.Classes,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt, FireDAC.Comp.DataSet, VCL.TMSFNCGraphics, VCL.TMSFNCBloxControl,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCBloxCoreTypes, VCL.TMSFNCBloxCoreUtils,
  VCL.TMSFNCBloxCoreLine, VCL.TMSFNCBloxCorePolygon, VCL.TMSFNCCustomControl,
  VCL.TMSFNCBloxCoreTextCell, VCL.TMSFNCBloxCoreLineArrow, VCL.TMSFNCTypes,
  VCL.TMSFNCBloxCoreLinkPoint, VCL.TMSFNCBloxCoreHandle, FireDAC.DApt.Intf,
  VCL.TMSFNCBloxCoreBlock, VCL.TMSFNCBloxCoreElement, VCL.TMSFNCBloxUISnapGrid,
  VCL.TMSFNCBloxUIRenderer, VCL.TMSFNCBloxSelector, FireDAC.Comp.Client,
  VCL.TMSFNCCustomComponent, VCL.TMSFNCCustomScrollControl, Vcl.Buttons,
  VCL.TMSFNCStateManager, VCL.TMSFNCResponsiveManager, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.ComCtrls, FireDAC.Phys, Vcl.ToolWin, VCL.TMSFNCBloxCoreGroup, ShellApi,
  VCL.TMSFNCBloxUIRegistration,UNodes, UNodeSelection, UDatabase, UToolBar,
  UEdge, UDesignerToolbar, UDiagram;  // Datenbank.pas einbinden

type
  TDesignerForm = class(TForm)
    //toolbar: TToolbar; //Zugriffsverletzung?
    {Datenbank-Komponenten}
    FDConnection_forms: TFDConnection;
    FDQuery_forms: TFDQuery;
    FDConnection_wf: TFDConnection;
    FDQuery_wf: TFDQuery;
    FDConnection_maindb: TFDConnection;
    FDQuery_maindb: TFDQuery;
    TMSFNCBloxControl1: TTMSFNCBloxControl;
    FDConnection_wftest: TFDConnection;
    FDQuery_wftest: TFDQuery;
    Panel1: TPanel;
    BitBtnStart: TBitBtn;
    Label1: TLabel;
    BitBtnEnd: TBitBtn;
    BitBtnHD: TBitBtn;
    BitBtnMD: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnHT: TBitBtn;
    BitBtnMT: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel5: TPanel;
    BitBtnEdge: TBitBtn;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    Datei2: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label7: TLabel;
    { Events }
    procedure FormCreate(Sender: TObject);
    procedure BitBtnStartClick(Sender: TObject);
    procedure BitBtnEndClick(Sender: TObject);
    procedure BitBtnHTClick(Sender: TObject);
    procedure BitBtnMTClick(Sender: TObject);
    procedure BitBtnHDClick(Sender: TObject);
    procedure BitBtnMDClick(Sender: TObject);
    procedure createNodeForm();
    procedure TMSFNCBloxControl1ElementRemove(Sender: TObject;
      Element: TTMSFNCBloxElement);
    procedure TMSFNCBloxControl1ElementClick(Sender: TObject;
      Element: TTMSFNCBloxElement);
    procedure BitBtnEdgeClick(Sender: TObject);
    procedure TMSFNCBloxControl1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure ReplaceNodeNames(fileName: String);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    var diagram : TDiagram;
    var IsLoadedDiagram : boolean;
    var LoadedDiagramFileName : String;
  end;

var
  DesignerForm: TDesignerForm;
  { Variablen der verwendeten Datenbanken }
  NodeDatabase: TNodeDatabase;
  EdgeDatabase: TEdgeDatabase;
  DiagramDatabase: TDiagramDatabase;
  { Variablen fuer die Bestimmung der aktuell ausgewaehlten Komponente }
  selectedID: Integer;
  selectedWorkflowComponent: String;
  newEdgeButtonClicked: boolean;
  newEdgeCreatedWithoutTarget: boolean;
  newEdge : TEdge;

implementation
{$R *.dfm}

{ Event bei Anklicken einer Komponte im Editor }
procedure TDesignerForm.TMSFNCBloxControl1ElementClick(Sender: TObject;
  Element: TTMSFNCBloxElement);
var
//  newEdge : TEdge;
  newEdgeID : Integer;
  component : TObject;
begin
  { Klasse und ID der angeklickten Komponente bestimmen }
  selectedWorkflowComponent :=
    TMSFNCBloxControl1.Presenter.Selecteds[0].GetNamePath;
  selectedID := (TMSFNCBloxControl1.Presenter.Selecteds[0].Id).ToInteger();
  { Wenn eine Kante gesetzt werden will }
  if newEdgeButtonClicked and not selectedWorkflowComponent.Equals('TEdge') then
  begin
    { Und es kein Endknoten ist }
    if selectedWorkflowComponent.Equals('TEnd')
    then ShowMessage('Endknoten kann keine Weiterführung haben.')
    else { Dann soll Kante erstellt und eingetragen werden }
    begin
      newEdgeButtonClicked := false;
      newEdgeCreatedWithoutTarget := true;
      newEdgeID := EdgeDatabase.getHighestEdgeID +1;
      newEdge := TEdge.Create(newEdgeID, selectedID);
      newEdge.SourceLinkPoint.AnchorLink :=
        TMSFNCBloxControl1.Presenter.Selecteds[0].LinkPoints[1];
      TMSFNCBloxControl1.Blox.Add(newEdge);
      EdgeDatabase.addNewEdge(newEdge);
    end;
  end { Kante einem zweiten Knoten zuweisen }
  else if newEdgeCreatedWithoutTarget and not
    selectedWorkflowComponent.Equals('TEdge') then
  begin
    if selectedWorkflowComponent.Equals('TStart')
    then ShowMessage('Startknoten kann keine Weiterführung sein.')
    else
    begin
      newEdgeCreatedWithoutTarget := false;
      newEdge.TargetLinkPoint.AnchorLink :=
        TMSFNCBloxControl1.Presenter.Selecteds[0].LinkPoints[0];
      newEdge.RequiresConnections := true;
      newEdge.setNextNodeID(selectedID);
      EdgeDatabase.addNextNode(newEdge);
    end;
  end;
end;

{ Oeffnen des Formulars fuer die Knotenauswahl }
procedure TDesignerForm.createNodeForm();
begin
  NodeSelectionForm.ShowModal;
end;

///////////////////////// Toolbar-Funktionen ////////////////////////////////
procedure TDesignerForm.BitBtnEndClick(Sender: TObject);
var
  newEnd : TEnd;
  newNodeID : Integer;
begin
  NodeSelectionForm.FillList('TEnd');
  createNodeForm();
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newNodeID := 1;
  newEnd := TEnd.Create(newNodeID,
                          NodeSelectionForm.getSelectedNodeDescription);
  TMSFNCBloxControl1.Blox.Add(newEnd);
  NodeDatabase.addNewNode(diagram, newEnd);
end;

procedure TDesignerForm.BitBtnHDClick(Sender: TObject);
var
  newHD : THumanDecision;
  newNodeID : Integer;
begin
  NodeSelectionForm.FillList('THumanDecision');
  createNodeForm();
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newHD := THumanDecision.Create(newNodeID,
                                  NodeSelectionForm.getSelectedNodeDescription);
  TMSFNCBloxControl1.Blox.Add(newHD);
  NodeDatabase.addNewNode(diagram, newHD);
end;

procedure TDesignerForm.BitBtnHTClick(Sender: TObject);
var
  newHT : THumanTask;
  newNodeID : Integer;
begin
  NodeSelectionForm.FillList('THumanTask');
  createNodeForm();
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newHT := THumanTask.Create(newNodeID,
                              NodeSelectionForm.getSelectedNodeDescription);
  TMSFNCBloxControl1.Blox.Add(newHT);
  NodeDatabase.addNewNode(diagram, newHT);
end;

procedure TDesignerForm.BitBtnMDClick(Sender: TObject);
var
  newMD : TMachineDecision;
  newNodeID : Integer;
begin
  NodeSelectionForm.FillList('TMachineDecision');
  createNodeForm();
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newMD := TMachineDecision.Create(newNodeID,
                                  NodeSelectionForm.getSelectedNodeDescription);
  TMSFNCBloxControl1.Blox.Add(newMD);
  NodeDatabase.addNewNode(diagram, newMD);
end;

procedure TDesignerForm.BitBtnMTClick(Sender: TObject);
var
  newMT : TMachineTask;
  newNodeID : Integer;
begin
  NodeSelectionForm.FillList('TMachineTask');
  createNodeForm();
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newMT := TMachineTask.Create(newNodeID,
                                  NodeSelectionForm.getSelectedNodeDescription);
  TMSFNCBloxControl1.Blox.Add(newMT);
  NodeDatabase.addNewNode(diagram, newMT);
end;

procedure TDesignerForm.BitBtnStartClick(Sender: TObject);
var
  newStart : TStart;
  newNodeID: Integer;
begin
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newStart := TStart.Create(newNodeID);
  TMSFNCBloxControl1.Blox.Add(newStart);
  NodeDatabase.addNewNode(diagram, newStart);
end;

{ Einmaliges Event bei Start der Applikation}
procedure TDesignerForm.FormCreate(Sender: TObject);
begin
   { Initialisierung von Anfrangswerten }
   newEdgeButtonClicked := false;
   newEdgeCreatedWithoutTarget := false;
   //toolbar := TToolbar.Create;
   { Aufrufen von Konstruktoren der Datanbank-Objekte }
   EdgeDatabase := TEdgeDatabase.Create(FDQuery_wftest, 'wf_edges');
   NodeDatabase := TNodeDatabase.Create(FDQuery_wftest, 'wf_nodes');
   DiagramDatabase := TDiagramDatabase.Create(FDQuery_wftest, 'wf_def');
   IsLoadedDiagram := false;
end;

{ Event beim neu Laden des Editors }
procedure TDesignerForm.FormShow(Sender: TObject);
var
  I : Integer;
begin
   {Wenn ein neues Diagramm erstellt wurde}
//   if not newDiagramName.Equals('') then  // VORHER, BITTE TESTEN SOBALD DB IN ORDNUNG
   if not IsLoadedDiagram then
   begin
    //IsLoadedDiagram := false;
    // In Startpage
    //diagram := TDiagram.Create(DiagramDatabase.getHighestDiagramID+1,
    //                                newDiagramName, newDiagramDescription);
    Label7.Caption := diagram.getName;
    //DiagramDatabase.addNewDiagram(diagram);   // In Startpage
    {Alle vorherigen Elemente im Editor entfernen}
    TMSFNCBloxControl1.Presenter.SelectAll;
    TMSFNCBloxControl1.Presenter.DeleteSelecteds;
   end
   else {Wenn Diagramm geladen wird}
   begin
    //IsLoadedDiagram := true;
    TMSFNCBloxControl1.LoadFromFile(OpenDialog1.InitialDir + LoadedDiagramFileName);
   end;
end;

procedure TDesignerForm.Load1Click(Sender: TObject);
var
  I : Integer;
  openFile : TStringList;
  idFromDatafile : String;
  versionFromDatafile : String;
  diagramName : String;
begin
  OpenDialog1.InitialDir := IncludeTrailingPathDelimiter(GetCurrentDir)
                              + 'Diagramme';
  OpenDialog1.Execute;
  ReplaceNodeNames(OpenDialog1.FileName);
  IsLoadedDiagram := true;
  {Pfad aus Namen entfernen}
  diagramName := OpenDialog1.Files[0].Remove(0,
                                              OpenDialog1.InitialDir.Length+1);
  diagram.setName(diagramName);
  Label7.Caption := diagram.getName;
  I := 0;
  { ID aus Dateinamen bestimmen }
  while diagram.getName.Chars[I] <> '_' do
  begin
    idFromDatafile := idFromDatafile + diagram.getName.Chars[I];
    I := I +1;
  end;
  diagram.setID(idFromDatafile.ToInteger);
  I := I +1;
  { Versionsnummer aus Dateinamen bestimmen }
  // Da I nicht auf 0 gesetzt wird, wird erstes _ im Dateinamen ignoriert
  while diagram.getName.Chars[I] <> '_' do
  begin
    versionFromDatafile := versionFromDatafile + diagram.getName.Chars[I];
    I := I +1;
  end;
  { Buchstaben V entfernen, damit Nummer ueberbleibt und Diagramm uebergeben }
  versionFromDatafile := versionFromDatafile.Remove(0,1);
  diagram.setVersionNumber(versionFromDatafile.ToInteger);

  { Restliche Diagrammdaten aus Datenbank beziehen}
  //diagram := DiagramDatabase.giveDiagramSavedDatas(diagram);
end;

procedure TDesignerForm.ReplaceNodeNames(fileName: String);
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
              'TTMSFNCBloxUMLActionStateBlock', [rfReplaceAll, rfIgnoreCase]);
  end;
  openFile.SaveToFile(OpenDialog1.FileName);
  TMSFNCBloxControl1.LoadFromFile(OpenDialog1.Files[0]);
end;

procedure TDesignerForm.Save1Click(Sender: TObject); // Speichern
var
  stream : TStream;
  fileName : String;
begin
  SaveDialog1.InitialDir := IncludeTrailingPathDelimiter
                      (GetCurrentDir)+ 'Diagramme';

  if not IsLoadedDiagram then
  begin
    fileName := diagram.getID.ToString + '_' + 'v'
                + diagram.getVersionNumber.ToString + '_' + diagram.getName;
    SaveDialog1.FileName := fileName;  // So wird Dateiname vorgeschlagen
    if SaveDialog1.Execute then
    begin
      TMSFNCBloxControl1.SaveToFile(IncludeTrailingPathDelimiter
                      (GetCurrentDir)+ 'Diagramme/' + fileName + '.blox');
    end;
  end
  else TMSFNCBloxControl1.SaveToFile((IncludeTrailingPathDelimiter
                      (GetCurrentDir)+ 'Diagramme/' + LoadedDiagramFileName));
end;


{ Event bei der Entfernung einer Komponente im Editor }
procedure TDesignerForm.TMSFNCBloxControl1ElementRemove(Sender: TObject;
  Element: TTMSFNCBloxElement);
begin
  { Ueberpruefung ob ein Knoten oder eine Kante geloescht wird }
  if selectedWorkflowComponent.Equals('TEdge')
  then EdgeDatabase.deleteEdge(selectedID)
  else NodeDatabase.deleteNode(selectedID);
end;

procedure TDesignerForm.TMSFNCBloxControl1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  point : TTMSFNCBloxPoint;
begin
  point.X := X;
  point.Y := Y;
  if newEdgeCreatedWithoutTarget then newEdge.TargetHandle.ChangePoint(point);
end;


{ Event bei Anklicken des Edge-Buttons }
procedure TDesignerForm.BitBtnEdgeClick(Sender: TObject);
begin
  { Zwischenspeichern vom Betaetigen des Buttons }
  newEdgeButtonClicked := true;
end;

end.
