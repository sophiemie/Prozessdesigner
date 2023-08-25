{
  Bachelorthesis ueber die Entwicklung einer grafischen Oberflaeche zur
  Erstellung von Workflows am ZMT (Leibniz-Zentrum fuer Marine Tropenforschung)
  Duales Studium Informatik, Hochschule Bremen
  Sophie Miessner 5046830, 2023

  Unit UDesigner: Es handelt sich um das Formular womit Prozesse erstellt und
  bearbeitet werden können.
}
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
  UEdge, UDesignerToolbar, UDiagram, ULanguage, UDiagramController,
  UNodeController, UEdgeController, UFormController;

type
  TDesignerForm = class(TForm)
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
    { Toolbar-Komponenten } // aktuell noch hier, sollen verlagert werden
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
    { Menue-, Open-, und Savedialoge}
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    var diagram : TDiagram;
    var IsLoadedDiagram : boolean;
    var LoadedDiagramFileName : String;
    var diagramIsSaved : boolean;
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
  newEdge : TEdge;

implementation
{$R *.dfm}

{ Event bei Anklicken einer Komponte im Editor }
procedure TDesignerForm.TMSFNCBloxControl1ElementClick(Sender: TObject;
  Element: TTMSFNCBloxElement);
begin
  selectedWorkflowComponent := TMSFNCBloxControl1.Presenter.Selecteds[0].GetNamePath;
  selectedID := (TMSFNCBloxControl1.Presenter.Selecteds[0].Id).ToInteger();
  newEdge := TEdgeController.createNewEdge(TMSFNCBloxControl1, newEdge, EdgeDatabase);
end;

///////////////////////// Toolbar-Funktionen ////////////////////////////////
{ Neuen Endknoten erstellen }
procedure TDesignerForm.BitBtnEndClick(Sender: TObject);
var
  newEnd : TEnd;
begin
  newEnd := TNodeController.createNewNode(NodeDatabase, newEnd);
  TMSFNCBloxControl1.Blox.Add(newEnd);
  NodeDatabase.addNewNode(diagram, newEnd);
end;

{ Neuen menschlichen Entscheidungsknoten erstellen }
procedure TDesignerForm.BitBtnHDClick(Sender: TObject);
var
  newHD : THumanDecision;
begin
  newHD := TNodeController.createNewNode(NodeDatabase, newHD);
  TMSFNCBloxControl1.Blox.Add(newHD);
  NodeDatabase.addNewNode(diagram, newHD);
end;

{ Neuen menschlichen Aufgabenknoten erstellen }
procedure TDesignerForm.BitBtnHTClick(Sender: TObject);
var
  newHT : THumanTask;
begin
  newHT := TNodeController.createNewNode(NodeDatabase, newHT);
  TMSFNCBloxControl1.Blox.Add(newHT);
  NodeDatabase.addNewNode(diagram, newHT);
end;

{ Neuen maschinellen Entscheidungsknoten erstellen }
procedure TDesignerForm.BitBtnMDClick(Sender: TObject);
var
  newMD : TMachineDecision;
begin
  newMD := TNodeController.createNewNode(NodeDatabase, newMD);
  TMSFNCBloxControl1.Blox.Add(newMD);
  NodeDatabase.addNewNode(diagram, newMD);
end;

{ Neuen maschinellen Aufgabenknoten erstellen }
procedure TDesignerForm.BitBtnMTClick(Sender: TObject);
var
  newMT : TMachineTask;
  newNodeID : Integer;
begin
  newMT := TNodeController.createNewNode(NodeDatabase, newMT);
  TMSFNCBloxControl1.Blox.Add(newMT);
  NodeDatabase.addNewNode(diagram, newMT);
end;

{ Neuen Startknoten erstellen }
procedure TDesignerForm.BitBtnStartClick(Sender: TObject);
var
  newStart : TStart;
begin
  newStart := TNodeController.createNewNode(NodeDatabase, newStart);
  TMSFNCBloxControl1.Blox.Add(newStart);
  NodeDatabase.addNewNode(diagram, newStart);
end;

////////////////////////////////////////////////////////////////////////////
{ Event beim Versuch vom Schliessen der Applikation }
procedure TDesignerForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  AMsg: String;
begin
  if not diagramIsSaved then
  begin
    AMsg := NOTSAVED_DE;
    if MessageDlg(AMsg, mtConfirmation, [mbOk, mbCancel], 0) = mrCancel then
      CanClose := false;
  end;
end;

{ Einmaliges Event bei Start der Applikation}
procedure TDesignerForm.FormCreate(Sender: TObject);
begin
   { Initialisierung von Anfrangswerten }
   TEdgeController.newEdgeClick := false;
   TEdgeController.newEdgeWithoutTarget := false;

   { Aufrufen von Konstruktoren der Datanbank-Objekte }
   EdgeDatabase := TEdgeDatabase.Create(FDQuery_wftest, 'wf_edges');
   NodeDatabase := TNodeDatabase.Create(FDQuery_wftest, 'wf_nodes');
   DiagramDatabase := TDiagramDatabase.Create(FDQuery_wftest, 'wf_def');
   IsLoadedDiagram := false;
   diagramIsSaved := false;
   SaveDialog1.InitialDir := IncludeTrailingPathDelimiter(GetCurrentDir)
                                                              + 'Diagramme/';
   OpenDialog1.InitialDir := IncludeTrailingPathDelimiter(GetCurrentDir)
                                                              + 'Diagramme/';
   TNodeController.IDohneDB := 0;
   TEdgeController.IDohneDB := 0;
end;

procedure TDesignerForm.FormResize(Sender: TObject);
begin
  TFormController.changeWindowSize(DesignerForm, Panel1, TMSFNCBloxControl1);
end;

{ Event beim neu Laden des Editors }
procedure TDesignerForm.FormShow(Sender: TObject);
begin
   {Wenn ein neues Diagramm erstellt wurde}
   Label7.Caption := diagram.getGermanName + ' Version:'
                                          + diagram.getVersionNumber.ToString;
   if not IsLoadedDiagram then
   begin
    {Alle vorherigen Elemente im Editor entfernen}
    TMSFNCBloxControl1.Presenter.SelectAll;
    TMSFNCBloxControl1.Presenter.DeleteSelecteds;
   end
   else {Wenn Diagramm geoeffnet wird}
   begin
      TDiagramController.loadDiagramToFile(diagram, TMSFNCBloxControl1,
                                                        LoadedDiagramFileName);
   end;
end;

{ Laden eines Diagrammes ueber MainMenue}
procedure TDesignerForm.Load1Click(Sender: TObject);
begin
  isLoadedDiagram := true;
  TDiagramController.loadDiagramToFile(diagram, OpenDialog1, TMSFNCBloxControl1);
  Label7.Caption := diagram.getGermanName + ' Version:'
                                          + diagram.getVersionNumber.ToString;
  { Restliche Diagrammdaten aus Datenbank beziehen}
  diagram := DiagramDatabase.giveDiagramSavedDatas(diagram);
end;

{ Speichern eines Diagrammes ueber MainMenue}
procedure TDesignerForm.Save1Click(Sender: TObject);
begin
  diagramIsSaved := TDiagramController.saveDiagramToFile(diagram, SaveDialog1,
                                                          TMSFNCBloxControl1);
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
  if TEdgeController.newEdgeWithoutTarget then
                                      newEdge.TargetHandle.ChangePoint(point);
end;

{ Event bei Anklicken des Edge-Buttons }
procedure TDesignerForm.BitBtnEdgeClick(Sender: TObject);
begin
  { Zwischenspeichern vom Betaetigen des Buttons }
  TEdgeController.newEdgeClick := true;
end;

end.
