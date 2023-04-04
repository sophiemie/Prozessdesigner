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

procedure hideAllItems(Selector: TTMSFNCBloxSelector);

implementation

procedure hideAllItems(Selector: TTMSFNCBloxSelector);
const
  anzahlItems = 137;
var
  i: Integer;
begin
  for i := 0 to anzahlItems do
  begin
    Selector.Items[i].Visible := false;
  end;
end;

end.
