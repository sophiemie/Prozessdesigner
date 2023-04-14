unit Designer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.SqlExpr, Data.DB,
  Vcl.StdCtrls, UDatabase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCBloxCoreTypes,
  VCL.TMSFNCBloxCoreUtils, VCL.TMSFNCBloxCoreLine, VCL.TMSFNCBloxCorePolygon,
  VCL.TMSFNCBloxCoreTextCell, VCL.TMSFNCBloxCoreLineArrow,
  VCL.TMSFNCBloxCoreLinkPoint, VCL.TMSFNCBloxCoreHandle,
  VCL.TMSFNCBloxCoreGroup, VCL.TMSFNCBloxUISnapGrid, VCL.TMSFNCBloxCoreBlock,
  VCL.TMSFNCBloxCoreElement, VCL.TMSFNCBloxUIRegistration,
  VCL.TMSFNCBloxUIRenderer, VCL.TMSFNCBloxSelector, UToolBar,
  VCL.TMSFNCCustomControl, VCL.TMSFNCCustomScrollControl, VCL.TMSFNCBloxControl,
  UNodes, UNodeSelection,
  VCL.TMSFNCCustomComponent, VCL.TMSFNCStateManager,
  VCL.TMSFNCResponsiveManager, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.ToolWin, Vcl.ComCtrls;  // Datenbank.pas einbinden

type
  TForm1 = class(TForm)
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
//    procedure TMSFNCBloxControl1RegisterElements(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnStartClick(Sender: TObject);
//    procedure TMSFNCBloxSelector1ItemClick(Sender: TObject; AItemIndex: Integer);
    procedure BitBtnEndClick(Sender: TObject);
    procedure BitBtnHTClick(Sender: TObject);
    procedure BitBtnMTClick(Sender: TObject);
    procedure BitBtnHDClick(Sender: TObject);
    procedure BitBtnMDClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure createNodeForm();
  private
    { Private-Deklarationen }

  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  DatabaseWf: TDatabase;
  NodeDatabase: TNodeDatabase;

implementation
{$R *.dfm}

//uses UNodeSelection;
procedure TForm1.createNodeForm();
begin
  with TForm2.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

///////////////////////// Toolbar-Funktionen
procedure TForm1.BitBtnEndClick(Sender: TObject);
begin
  TMSFNCBloxControl1.Blox.Add(TEnd.Create);
  //NodeDatabase.addNewNode(FDQuery_wftest, 1, 'E');
  NodeDatabase.addNewNode(1, 'E');
  createNodeForm();
end;

procedure TForm1.BitBtnHDClick(Sender: TObject);
begin
  TMSFNCBloxControl1.Blox.Add(THumanDecision.Create);
  NodeDatabase.addNewNode(1, 'HD');
  createNodeForm();
end;

procedure TForm1.BitBtnHTClick(Sender: TObject);
begin
  TMSFNCBloxControl1.Blox.Add(THumanTask.Create);
  NodeDatabase.addNewNode(1, 'HT');
  createNodeForm();
end;

procedure TForm1.BitBtnMDClick(Sender: TObject);
begin
  TMSFNCBloxControl1.Blox.Add(TMashineDecision.Create);
  NodeDatabase.addNewNode(1, 'MD');
  createNodeForm();
end;

procedure TForm1.BitBtnMTClick(Sender: TObject);
begin
  TMSFNCBloxControl1.Blox.Add(TMashineTask.Create);
  NodeDatabase.addNewNode(1, 'MT');
  createNodeForm();
end;

procedure TForm1.BitBtnStartClick(Sender: TObject);
begin
  TMSFNCBloxControl1.Blox.Add(TStart.Create);
  NodeDatabase.addNewNode(1, 'S');
  //DatabaseWf.schreibeDatensatz(FDQuery_wftest, DatabaseWf.gebAnzahlDatensaetze(FDQuery_wftest, 'wf_nodes')+1);
end;

////////////////////////////// TEST
procedure TForm1.Button1Click(Sender: TObject);
var
  tabelle: String;
begin
  tabelle := 'wf_nodes';
  ShowMessage(DatabaseWf.gebAnzahlDatensaetze(FDQuery_wf, tabelle).ToString);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   // https://www.delphipraxis.net/printthread.php?t=115552
   NodeDatabase := TNodeDatabase.Create(FDQuery_wftest); // So ruft man einen Konstruktor auf
end;

end.
