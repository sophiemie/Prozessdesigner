unit UDesigner;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.SqlExpr,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, VCL.TMSFNCUtils,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Data.DB,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCBloxCoreTypes,
  VCL.TMSFNCBloxCoreUtils, VCL.TMSFNCBloxCoreLine, VCL.TMSFNCBloxCorePolygon,
  VCL.TMSFNCBloxCoreTextCell, VCL.TMSFNCBloxCoreLineArrow, VCL.TMSFNCBloxCoreGroup,
  VCL.TMSFNCBloxCoreLinkPoint, VCL.TMSFNCBloxCoreHandle, VCL.TMSFNCBloxUISnapGrid,
  VCL.TMSFNCBloxCoreBlock, VCL.TMSFNCBloxCoreElement, VCL.TMSFNCBloxUIRegistration,
  VCL.TMSFNCBloxUIRenderer, VCL.TMSFNCBloxSelector,  FireDAC.Comp.Client,VCL.TMSFNCTypes,
  VCL.TMSFNCCustomControl, VCL.TMSFNCCustomScrollControl, VCL.TMSFNCBloxControl,
  VCL.TMSFNCCustomComponent, VCL.TMSFNCStateManager, VCL.TMSFNCResponsiveManager,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Menus, Vcl.ToolWin, Vcl.ComCtrls,
  UNodes, UNodeSelection, UDatabase, UToolBar, UEdge;  // Datenbank.pas einbinden

type
  TDesignerForm = class(TForm)
    FDConnection_forms: TFDConnection;
    FDQuery_forms: TFDQuery;
    FDConnection_wf: TFDConnection;
    FDQuery_wf: TFDQuery;
    FDConnection_maindb: TFDConnection;
    FDQuery_maindb: TFDQuery;
    TMSFNCBloxControl1: TTMSFNCBloxControl;
    FDConnection_wftest: TFDConnection;
    FDQuery_wftest: TFDQuery;
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
    procedure FormCreate(Sender: TObject);
    procedure BitBtnStartClick(Sender: TObject);
    procedure BitBtnEndClick(Sender: TObject);
    procedure BitBtnHTClick(Sender: TObject);
    procedure BitBtnMTClick(Sender: TObject);
    procedure BitBtnHDClick(Sender: TObject);
    procedure BitBtnMDClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure createNodeForm();
    procedure TMSFNCBloxControl1ElementRemove(Sender: TObject; Element: TTMSFNCBloxElement);
    procedure TMSFNCBloxControl1ElementClick(Sender: TObject; Element: TTMSFNCBloxElement);
    procedure BitBtnEdgeClick(Sender: TObject);
    procedure TMSFNCBloxControl1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    { Private-Deklarationen }

  public
    { Public-Deklarationen }
//    var edgeComponent : TTMSFNCBloxElement;
  end;

var
  DesignerForm: TDesignerForm;
  { Variablen der verwendeten Datenbanken }
  NodeDatabase: TNodeDatabase;
  EdgeDatabase: TEdgeDatabase;
  { Variablen fuer die Bestimmung der aktuell ausgewaehlten Komponente }
  selectedID: Integer;
  selectedWorkflowComponent: String;
  newEdgeButtonClicked: boolean;
  newEdgeCreatedWithoutTarget: boolean;
  newEdge : TEdge;

implementation
{$R *.dfm}

{ Oeffnen des Formulars fuer die Knotenauswahl }
procedure TDesignerForm.createNodeForm();
begin
  with TNodeSelectionForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

///////////////////////// Toolbar-Funktionen
procedure TDesignerForm.BitBtnEndClick(Sender: TObject);
var
  newEnd : TEnd;
  newNodeID : Integer;
begin
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newEnd := TEnd.Create(newNodeID);
  TMSFNCBloxControl1.Blox.Add(newEnd);
  NodeDatabase.addNewNode(1, newNodeID, 'E');
  createNodeForm();
end;

procedure TDesignerForm.BitBtnHDClick(Sender: TObject);
var
  newHD : THumanDecision;
  newNodeID : Integer;
begin
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newHD := THumanDecision.Create(newNodeID);
  TMSFNCBloxControl1.Blox.Add(newHD);
  NodeDatabase.addNewNode(1, newNodeID, 'HD');
  createNodeForm();
end;

procedure TDesignerForm.BitBtnHTClick(Sender: TObject);
var
  newHT : THumanTask;
  newNodeID : Integer;
begin
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newHT := THumanTask.Create(newNodeID);
  TMSFNCBloxControl1.Blox.Add(newHT);
  NodeDatabase.addNewNode(1, newNodeID, 'HT');
  createNodeForm();
end;

procedure TDesignerForm.BitBtnMDClick(Sender: TObject);
var
  newMD : TMashineDecision;
  newNodeID : Integer;
begin
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newMD := TMashineDecision.Create(newNodeID);
  TMSFNCBloxControl1.Blox.Add(newMD);
  NodeDatabase.addNewNode(1, newNodeID, 'MD');
  createNodeForm();
end;

procedure TDesignerForm.BitBtnMTClick(Sender: TObject);
var
  newMT : TMashineTask;
  newNodeID : Integer;
begin
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newMT := TMashineTask.Create(newNodeID);
  TMSFNCBloxControl1.Blox.Add(newMT);
  NodeDatabase.addNewNode(1, newNodeID, 'MT');
  createNodeForm();
end;

procedure TDesignerForm.BitBtnStartClick(Sender: TObject);
var
  newStart : TStart;
  newNodeID: Integer;
begin
  newNodeID := NodeDatabase.getHighestNodeID +1;
  newStart := TStart.Create(newNodeID);
  TMSFNCBloxControl1.Blox.Add(newStart);
  NodeDatabase.addNewNode(1, newNodeID, 'S'); // Aus den Buchstaben Klassenvariablen machen?
end;

////////////////////////////// TEST
procedure TDesignerForm.Button1Click(Sender: TObject);
var
  tabelle: String;
begin
  tabelle := 'wf_nodes';
  ShowMessage(NodeDatabase.gebAnzahlDatensaetze(tabelle).ToString);
end;

{ Event bei der Erstellung des Designer Formulars }
procedure TDesignerForm.FormCreate(Sender: TObject);
begin
   { Initialisierung von Anfrangswerten }
   newEdgeButtonClicked := false;
   newEdgeCreatedWithoutTarget := false;
   { Aufrufen von Konstruktoren der Datanbank-Objekte }
   EdgeDatabase := TEdgeDatabase.Create(FDQuery_wftest, 'wf_edges');
   NodeDatabase := TNodeDatabase.Create(FDQuery_wftest, 'wf_nodes');
end;


{ Event bei Anklicken einer Komponte im Editor }
procedure TDesignerForm.TMSFNCBloxControl1ElementClick(Sender: TObject;
  Element: TTMSFNCBloxElement);
var
//  newEdge : TEdge;
  newEdgeID : Integer;
  component : TObject;
begin
  { Klasse und ID der angeklickten Komponente bestimmen }
  selectedWorkflowComponent := TMSFNCBloxControl1.Presenter.Selecteds[0].GetNamePath;
  selectedID := (TMSFNCBloxControl1.Presenter.Selecteds[0].Id).ToInteger();
  { Wenn eine Kante gesetzt werden will }
  if newEdgeButtonClicked and not selectedWorkflowComponent.Equals('TEdge') then
  begin
    { Und es kein Endknoten ist }
    if selectedWorkflowComponent.Equals('TEnd')
    then ShowMessage('Endknoten kann keine Weiterf�hrung haben.')
    else { Dann soll Kante erstellt und eingetragen werden }
    begin
      newEdgeButtonClicked := false;
      newEdgeCreatedWithoutTarget := true;
      newEdgeID := EdgeDatabase.getHighestEdgeID +1;
      newEdge := TEdge.Create(newEdgeID, selectedID);
      newEdge.SourceLinkPoint.AnchorLink := TMSFNCBloxControl1.Presenter.Selecteds[0].LinkPoints[1];
      TMSFNCBloxControl1.Blox.Add(newEdge);
      EdgeDatabase.addNewEdge(newEdgeID, selectedID);
    end;
  end
  else if newEdgeCreatedWithoutTarget and not selectedWorkflowComponent.Equals('TEdge') then  { Kante einem zweiten Knoten zuweisen }
  begin
    if selectedWorkflowComponent.Equals('TStart')
    then ShowMessage('Startknoten kann keine Weiterf�hrung sein.')
    else
    begin
    newEdgeCreatedWithoutTarget := false;
    newEdge.TargetLinkPoint.AnchorLink := TMSFNCBloxControl1.Presenter.Selecteds[0].LinkPoints[0];
    newEdge.RequiresConnections := true;
    EdgeDatabase.addNextNode(newEdge.getID, selectedID);
    end;   // FEHLER BEI ZU VIELEM BEWEGEN?
  end;
end;

{ Event bei der Entfernung einer Komponente im Editor }
procedure TDesignerForm.TMSFNCBloxControl1ElementRemove(Sender: TObject;
  Element: TTMSFNCBloxElement);
begin
  { Ueberpruefung ob ein Knoten oder eine Kante geloescht wird }
  if selectedWorkflowComponent.Equals('TEdge') then EdgeDatabase.deleteEdge(selectedID)
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