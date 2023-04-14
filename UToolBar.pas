unit UToolBar;

interface

uses
  VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCBloxCoreTypes,
  VCL.TMSFNCBloxCoreUtils, VCL.TMSFNCBloxCoreLine, VCL.TMSFNCBloxCorePolygon,
  VCL.TMSFNCBloxCoreTextCell, VCL.TMSFNCBloxCoreLineArrow,
  VCL.TMSFNCBloxCoreLinkPoint, VCL.TMSFNCBloxCoreHandle,
  VCL.TMSFNCBloxCoreGroup, VCL.TMSFNCBloxUISnapGrid, VCL.TMSFNCBloxCoreBlock,
  VCL.TMSFNCBloxCoreElement, VCL.TMSFNCBloxUIRegistration,
  VCL.TMSFNCBloxUIRenderer, VCL.TMSFNCBloxSelector,
  VCL.TMSFNCBloxShapesUML,   // VCL.TMSFNCBloxShapesUML fuer UML-Formen
  UNodes,
  VCL.TMSFNCCustomControl, VCL.TMSFNCCustomScrollControl, VCL.TMSFNCBloxControl;

const
  anzahlItems = 137;
  anzahlNeueItems = 13;

procedure hideAllItems(Selector: TTMSFNCBloxSelector);
procedure initToolBar(Selector: TTMSFNCBloxSelector);
//procedure itemClick(Selector: TTMSFNCBloxSelector; Control: TTMSFNCBloxControl;Index: Integer);

implementation

procedure hideAllItems(Selector: TTMSFNCBloxSelector);
var
  i: Integer;
begin
  for i := 0 to anzahlItems do
  begin
    Selector.Items[i].Visible := false;
    //Selector.Items[i].Enabled := false;
    //Selector.Items.Destroy;
  end;
end;

procedure initToolBar(Selector: TTMSFNCBloxSelector);
var
  i: Integer;
begin
  for i := anzahlItems to anzahlItems+anzahlNeueItems do
  begin
    Selector.Items[i].SeparatorHeight := 80;
    Selector.Items[i].SeparatorLine := true;
  end;
  Selector.Appearance.ItemHeight := 150;
  Selector.Appearance.ItemWidth := 250;
  Selector.Appearance.Font.Size := 10;
end;

//procedure itemClick(Selector: TTMSFNCBloxSelector; Control: TTMSFNCBloxControl;
//Index: Integer);
//begin
//  case Index of
//    itemIndexStart: Control.Blox.Add(TStart.Create);
//    itemIndexEnd: Control.Blox.Add(TEnd.Create);
//    itemIndexHD: Control.Blox.Add(THumanDecision.Create);
//    itemIndexHT: Control.Blox.Add(THumanTask.Create);
//    itemIndexMD: Control.Blox.Add(TMashineDecision.Create);
//    itemIndexMT: Control.Blox.Add(TMashineTask.Create);
//  end;
//end;

end.
