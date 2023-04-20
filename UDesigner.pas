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
  Vcl.ComCtrls, FireDAC.Phys, Vcl.ToolWin, VCL.TMSFNCBloxCoreGroup,
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
    {Toolbar-Komponenten (aktuell wird noch nicht die vorhandene Klasse
     verwendet)}
    Edit1: TEdit;
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
    Button1: TButton;
    BitBtnEdge: TBitBtn;
    { Events }
    procedure FormCreate(Sender: TObject);
    procedure BitBtnStartClick(Sender: TObject);
    procedure BitBtnEndClick(Sender: TObject);
    procedure BitBtnHTClick(Sender: TObject);
    procedure BitBtnMTClick(Sender: TObject);
    procedure BitBtnHDClick(Sender: TObject);
    procedure BitBtnMDClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure createNodeForm();
    procedure TMSFNCBloxControl1ElementRemove(Sender: TObject;
      Element: TTMSFNCBloxElement);
    procedure TMSFNCBloxControl1ElementClick(Sender: TObject;
      Element: TTMSFNCBloxElement);
    procedure BitBtnEdgeClick(Sender: TObject);
    procedure TMSFNCBloxControl1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private-Deklarationen }

  public
    { Public-Deklarationen }
    var newDiagramName : String;
    var newDiagramDescription : String;
//    var newNodeDescription : String;
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
  diagram : TDiagram;

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
  newMD : TMashineDecision;
  newNodeID : Integer;
begin
  NodeSelectionForm.FillList('TMashineDecision');
  createNodeForm();
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newMD := TMashineDecision.Create(newNodeID,
                                  NodeSelectionForm.getSelectedNodeDescription);
  TMSFNCBloxControl1.Blox.Add(newMD);
  NodeDatabase.addNewNode(diagram, newMD);
end;

procedure TDesignerForm.BitBtnMTClick(Sender: TObject);
var
  newMT : TMashineTask;
  newNodeID : Integer;
begin
  NodeSelectionForm.FillList('TMashineTask');
  createNodeForm();
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newMT := TMashineTask.Create(newNodeID,
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

////////////////////////////// TEST
procedure TDesignerForm.Button1Click(Sender: TObject);
var
  tabelle: String;
begin
  tabelle := 'wf_nodes';
  ShowMessage(NodeDatabase.getDataCount.ToString);
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
end;

{ Event beim neu Laden des Editors }
procedure TDesignerForm.FormShow(Sender: TObject);
var
  I : Integer;
begin
   {Wenn ein neues Diagramm erstellt wurde}
   if not newDiagramName.Equals('') then
   begin
    diagram := TDiagram.Create(DiagramDatabase.getHighestDiagramID+1,
                                    newDiagramName, newDiagramDescription);
    DiagramDatabase.addNewDiagram(diagram);
    {Alle vorherigen Elemente im Editor entfernen}
    TMSFNCBloxControl1.Presenter.SelectAll;
    TMSFNCBloxControl1.Presenter.DeleteSelecteds;
   end
   else {Wenn Diagramm geladen wird}
   begin

   end;
end;

procedure TDesignerForm.Label4Click(Sender: TObject);
begin

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
