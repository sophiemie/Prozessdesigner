unit Designer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.SqlExpr, Data.DB,
  Vcl.StdCtrls, DatenbankUnit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
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
  UNodes,
  VCL.TMSFNCCustomComponent, VCL.TMSFNCStateManager,
  VCL.TMSFNCResponsiveManager;  // Datenbank.pas einbinden

type
  TForm1 = class(TForm)
    Button1: TButton;
    FDConnection_forms: TFDConnection;
    FDQuery_forms: TFDQuery;
    FDConnection_wf: TFDConnection;
    FDQuery_wf: TFDQuery;
    FDConnection_maindb: TFDConnection;
    FDQuery_maindb: TFDQuery;
    TMSFNCBloxSelector1: TTMSFNCBloxSelector;
    TMSFNCBloxControl1: TTMSFNCBloxControl;
    FDConnection_wftest: TFDConnection;
    FDQuery_wftest: TFDQuery;
    TMSFNCResponsiveManager1: TTMSFNCResponsiveManager;
    Button2: TButton;
    procedure TMSFNCBloxControl1RegisterElements(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  TMSFNCBloxControl1.Blox.Add(TStart.Create);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  hideAllItems(TMSFNCBloxSelector1);
end;

procedure TForm1.TMSFNCBloxControl1RegisterElements(Sender: TObject);
begin
  RegisterElement(THumanDecision, '', 'Human', 'ZDecision');
  RegisterElement(TMashineDecision, '', 'Mashine', 'ZDecision');
  RegisterElement(THumanTask, '', 'Human', 'ZTask');
  RegisterElement(TMashineTask, '', 'MaschinelleAktion', 'ZTask');
  RegisterElement(TStart, '', 'Start', 'ZStart and End');
  RegisterElement(TEnd, '', 'End', 'ZStart and End');
  TMSFNCBloxSelector1.Rebuild;
end;

// Datenbank Verbindung herstellen
end.
