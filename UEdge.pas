unit UEdge;

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
  VCL.TMSFNCBloxCoreBaseElement, Vcl.Graphics, Vcl.Menus, Vcl.StdActnMenus,
  VCL.TMSFNCCustomControl, VCL.TMSFNCCustomScrollControl, VCL.TMSFNCBloxControl,
  System.SysUtils, System.Variants, System.Classes, UNodes;
type

  //TEdge = class(TTMSFNCBloxUMLGenericLine, IWorkflowComponent)
  TEdge = class(TTMSFNCBloxLine, IWorkflowComponent)
  public
    constructor Create(edgeID : Integer; newNodeID: Integer); // overload;
//    constructor Create(edgeID : Integer; startNode : TStart); overload;
//    constructor Create(edgeID : Integer; decisionNode : TDecision); overload;
//    constructor Create(edgeID : Integer; taskNode : TTask); overload;
    procedure setID(newID : Integer);
    function getID : Integer;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  private
    var nodeID : Integer; { ID des Knotens wo Kante herkommt }
    var nextNodeID : Integer; { ID des darauffolgenden Knotens }
    procedure init(newID: Integer); { Initialisierung der Variablen }
  end;

implementation

procedure TEdge.init(newID: Integer);
begin
  ID := newID.ToString;
  TargetArrow.Shape := asSolidArrow;
end;

constructor TEdge.Create(edgeID : Integer; newNodeID: Integer);
begin
  inherited Create;
  init(edgeID);
  nodeID := newNodeID;
  //RequiresConnections := true;    // Variable bestimmt ob Linie immer zwishchen 2 Objekten sein muss
end;

//constructor TEdge.Create(edgeID : Integer; startNode : TStart);
//begin
//  inherited Create;
//  init(edgeID);
//end;
//
//constructor TEdge.Create(edgeID : Integer; taskNode : TTask);
//begin
//  inherited Create;
//  init(edgeID);
//end;
//
//constructor TEdge.Create(edgeID : Integer; decisionNode : TDecision);
//begin
//  inherited Create;
//  init(edgeID);
//end;



procedure TEdge.setID(newID : Integer);
begin
  ID := newID.ToString;
end;

function TEdge.getID : Integer;
begin
  Result := ID.ToInteger();
end;

{ Interface-Funktionen }
function TEdge.QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
begin
  if GetInterface(IID, Obj) then Result := 0
  else Result := E_NOINTERFACE;
end;
function TEdge._AddRef: Integer; stdcall;
begin
{$IFNDEF AUTOREFCOUNT}
  //Result := AtomicIncrement(FRefCount);
{$ELSE}
  Result := __ObjAddRef;
{$ENDIF}
end;
function TEdge._Release: Integer; stdcall;
begin
{$IFNDEF AUTOREFCOUNT}
  //Result := AtomicDecrement(FRefCount);
  if Result = 0 then
  begin
    //__MarkDestroying(Self);
    Destroy;
  end;
{$ELSE}
  Result := __ObjRelease;
{$ENDIF}
end;


end.
