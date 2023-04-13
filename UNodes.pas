unit UNodes;

interface

uses
  VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCBloxCoreTypes,
  VCL.TMSFNCBloxCoreUtils, VCL.TMSFNCBloxCoreLine, VCL.TMSFNCBloxCorePolygon,
  VCL.TMSFNCBloxCoreTextCell, VCL.TMSFNCBloxCoreLineArrow,
  VCL.TMSFNCBloxCoreLinkPoint, VCL.TMSFNCBloxCoreHandle,
  VCL.TMSFNCBloxCoreGroup, VCL.TMSFNCBloxUISnapGrid, VCL.TMSFNCBloxCoreBlock,
  VCL.TMSFNCBloxCoreElement, VCL.TMSFNCBloxUIRegistration,
  VCL.TMSFNCBloxUIRenderer, VCL.TMSFNCBloxSelector,  VCL.TMSFNCStyles,
  VCL.TMSFNCBloxShapesUML,   // VCL.TMSFNCBloxShapesUML fuer UML-Formen,
  Vcl.Graphics, Vcl.Menus, Vcl.StdActnMenus,
  VCL.TMSFNCCustomControl, VCL.TMSFNCCustomScrollControl, VCL.TMSFNCBloxControl;
var
  popUp :  TStandardMenuPopup;
  // https://stackoverflow.com/questions/18544127/creating-a-popup-menu-at-runtime
const
  lightBlue = $FAE4BE;
  darkGrey = $626262;
  lightGray = $B2B2B2;
  darkBlue = $E5BF81;
  startEndSize = 80;
  fontSize = 100.0;
  itemIndexStart = 145;
  itemIndexEnd = 144;
  itemIndexHD = 139;
  itemIndexHT = 149;
  itemIndexMD = 140;
  itemIndexMT = 150;
type

  IWorkflowComponent = interface(IInterface)
    procedure setID(newID : Integer);
    function getID : Integer;
  end;

  INodes = interface(IWorkflowComponent)

  end;

  // Start- und Endknoten
  TStart = class(TTMSFNCBloxUMLInitialStateBlock)
    popUp : TPopupMenu;
    constructor Create; override;
  private
    nodeType : String;
  end;

  TEnd = class(TTMSFNCBloxUMLFinalStateBlock)
    constructor Create; override;
  private
    nodeType : String;
  end;

  TTest = class(TInterfacedObject)

  end;

  // Entscheidungsknoten       // TInterfacedObject
  //TDecision = class abstract(TTMSFNCBloxUMLDecisionBlock, IworkflowComponent)
  TDecision = class abstract (TTMSFNCBloxUMLDecisionBlock, IworkflowComponent)
    constructor Create; override;
    procedure setID(newID : Integer);
    function getID : Integer;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  private
    Id: Integer;
    Description: String;
    nodeType: String;
  end;

  THumanDecision = class(TDecision)
    constructor Create; override;
  end;

  TMashineDecision = class(TDecision)
    constructor Create; override;
  end;

  // Aktionsknoten
  TTask = class abstract(TTMSFNCBloxUMLActionStateBlock)
    constructor Create; override;
    procedure setID;
  private
    Id: Integer;
    Description: String;
    nodeType: String;
  end;

  THumanTask = class(TTask)
    constructor Create; override;
  end;

  TMashineTask = class(TTask)
    constructor Create; override;
  end;
 /////////////////////////////////////////////////////////////////////
implementation
//// Kopierte Funktionen aus System
function TDecision.QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
begin
  if GetInterface(IID, Obj) then Result := 0
  else Result := E_NOINTERFACE;
end;

function TDecision._AddRef: Integer; stdcall;
begin
{$IFNDEF AUTOREFCOUNT}
  //Result := AtomicIncrement(FRefCount);
{$ELSE}
  Result := __ObjAddRef;
{$ENDIF}
end;
function TDecision._Release: Integer; stdcall;
begin
{$IFNDEF AUTOREFCOUNT}
  //Result := AtomicDecrement(FRefCount);
  if Result = 0 then
  begin
    // Mark the refcount field so that any refcounting during destruction doesn't infinitely recurse.
    //__MarkDestroying(Self);
    Destroy;
  end;
{$ELSE}
  Result := __ObjRelease;
{$ENDIF}
end;
/////////////////////////////
procedure TTask.setID;
begin

end;

function TDecision.getID : Integer;
begin
  Result := ID;
end;

constructor TStart.Create;
var
  //popUp: TPopupMenu;
  item : TMenuItem;
begin
  inherited;
  Width := startEndSize;
  Height := Width;
  FillColor := darkBlue;
  FontSize := fontSize;
  Text := 'S';
  nodeType := Text;
end;

constructor TEnd.Create;
begin
  inherited;
  Width := startEndSize;
  Height := Width;
  FillColor := darkGrey;
  Text := 'E';
  nodeType := Text;
  FontSize := fontSize;
end;

constructor TDecision.Create;
begin
  inherited;
  Width := 100;
  Height := 100;
  FontSize := fontSize;
end;

constructor THumanDecision.Create;
begin
  inherited;
  FillColor := lightBlue;
  Text := 'HD';
  nodeType := Text;
end;

constructor TMashineDecision.Create;
begin
  inherited;
  FillColor := lightGray;
  Text := 'MD';
  nodeType := Text;
end;

constructor TTask.Create;
begin
  inherited;
  Width := 150;
  Height := 80;
  FontSize := fontSize;
end;

constructor THumanTask.Create;
begin
  inherited;
  FillColor := lightBlue;
  Text := 'HT';
  nodeType := Text;
end;

constructor TMashineTask.Create;
begin
  inherited;
  FillColor := lightGray;
  Text := 'MT';
  nodeType := Text;
end;

procedure TDecision.setID(newID : Integer);
begin
  Id := newID;
end;

end.
