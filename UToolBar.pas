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
var
  i: Integer;
begin
  for i := 0 to 137 do // they are originally 137 Items listed
  begin
    Selector.Items[i].Visible := false;
  end;
end;

procedure registerElement();
begin
//  RegisterElement(THumanDecision, '', 'Menschliche Entscheidung', 'Workflowdiagramm');
end;

end.
