{
  Bachelorthesis ueber die Entwicklung einer grafischen Oberflaeche zur
  Erstellung von Workflows am ZMT (Leibniz-Zentrum fuer Marine Tropenforschung)
  Duales Studium Informatik, Hochschule Bremen
  Sophie Miessner 5046830, 2023

  Unit UEdge: In der Unit wird die Klasse der Kanten TEdge sowie das
  dazugehoerige Interface und weitere Methoden implementiert.
}
unit UEdge;

interface

uses  { Verwendete Bibliotheken}
  VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCCustomControl, Vcl.StdActnMenus,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCBloxCoreTypes,
  VCL.TMSFNCBloxCoreUtils, VCL.TMSFNCBloxCoreLine, VCL.TMSFNCBloxCorePolygon,
  VCL.TMSFNCBloxCoreTextCell, VCL.TMSFNCBloxCoreLineArrow, VCL.TMSFNCStyles,
  VCL.TMSFNCBloxCoreLinkPoint, VCL.TMSFNCBloxShapesUML, System.SysUtils,
  VCL.TMSFNCBloxCoreGroup, VCL.TMSFNCBloxUISnapGrid, VCL.TMSFNCBloxCoreBlock,
  VCL.TMSFNCBloxCoreElement, VCL.TMSFNCBloxUIRegistration, System.Variants,
  VCL.TMSFNCBloxUIRenderer, VCL.TMSFNCBloxSelector, VCL.TMSFNCBloxCoreHandle,
  VCL.TMSFNCBloxShapesFlowChart, VCL.TMSFNCBloxShapesDFD, // <-- fuer Kante
  VCL.TMSFNCBloxCoreBaseElement, Vcl.Graphics, Vcl.Menus, VCL.TMSFNCBloxControl,
  VCL.TMSFNCCustomScrollControl, System.Classes, UNodes; // Dort ist das Interface

type
  { Enum fuer verschiedene Entscheidungsformen }
  TDecisionValue = (noDecision = 0, Approved = 1, Rejected = 2, Back = 3);
  { Klasse fuer die Kanten }
  TEdge = class(TTMSFNCBloxDFDDataFlowLine, IWorkflowComponent)
  public
    constructor Create(edgeID : Integer; newNodeID: Integer);
    { Methoden aus dem Interface }
    procedure setID(newID : Integer);
    function getID : Integer;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    { Getter und Setter der privaten Variablen }
    procedure setNodeID(newNodeID : Integer);
    function getNodeID : Integer;
    procedure setNextNodeID(newNextNodeID : Integer);
    function getNextNodeID : Integer;
    procedure setDecisionVal(newDecisionVal : TDecisionValue);
    function getDecisionVal : TDecisionValue;
    class function getClassType : String;
  private
    var nodeID : Integer; { ID des Knotens wo Kante herkommt }
    var nextNodeID : Integer; { ID des darauffolgenden Knotens }
    { Verschiedene Arten von Entscheidungswerten}
    var decisionVal : TDecisionValue;
  const
    CLASS_TYPE = 'TEdge';
  end;

implementation

constructor TEdge.Create(edgeID : Integer; newNodeID: Integer);
begin
  inherited Create;  { Konstruktor von TTMSFNCBloxLine aufrufen }
  ID := edgeID.ToString; { ID zuweisen }
  TargetArrow.Shape := asSolidArrow; { Spitze des Pfeils zuweisen }
  StrokeWidth := 3; { Liniendicke }
  nodeID := newNodeID; { Knoten wo Kante anfaengt zuweisen }
end;

{ Getter und Setter }
procedure TEdge.setNodeID(newNodeID : Integer);
begin
  nodeID := newNodeID;
end;

function TEdge.getNodeID : Integer;
begin
  Result := nodeID;
end;

procedure TEdge.setNextNodeID(newNextNodeID : Integer);
begin
  nextNodeID := newNextNodeID;
end;

function TEdge.getNextNodeID : Integer;
begin
  Result := nextNodeID;
end;

procedure TEdge.setDecisionVal(newDecisionVal : TDecisionValue);
begin
  decisionVal := newDecisionVal;
end;

function TEdge.getDecisionVal : TDecisionValue;
begin
  Result := decisionVal;
end;

class function TEdge.getClassType : String;
begin
  Result := CLASS_TYPE;
end;

{ Interface Methoden }
procedure TEdge.setID(newID : Integer);
begin
  ID := newID.ToString;
end;

function TEdge.getID : Integer;
begin
  Result := ID.ToInteger();
end;

{ Weitere Interface-Methoden, kopiert aus dem Delphi-System }
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
