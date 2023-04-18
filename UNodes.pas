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
  VCL.TMSFNCCustomControl, VCL.TMSFNCCustomScrollControl, VCL.TMSFNCBloxControl,
  System.SysUtils, System.Variants, System.Classes, UZMTStandard;
var
  popUp :  TStandardMenuPopup;
  // https://stackoverflow.com/questions/18544127/creating-a-popup-menu-at-runtime
const
  startEndSize = 80;
  fontSize = 300.0;
type

  IWorkflowComponent = interface(IInterface)
    procedure setID(newID : Integer);
    function getID : Integer;
  end;

  INodes = interface(IWorkflowComponent)
    procedure setDescription(newDescpription : String);
    function getDescription : String;
  end;

  // Start- und Endknoten
  TStart = class(TTMSFNCBloxUMLInitialStateBlock, INodes)
    popUp : TPopupMenu;
    constructor Create(nodeID: Integer);
    destructor Destroy;
    procedure setID(newID : Integer);
    function getID : Integer;
    procedure setDescription(newDescpription : String);
    function getDescription : String;
     {Interface-Implementationen}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  private
    nodeType : String;
  end;

  TEnd = class(TTMSFNCBloxUMLFinalStateBlock, INodes)
    constructor Create(nodeID: Integer);
    destructor Destroy;
    procedure setID(newID : Integer);
    function getID : Integer;
    procedure setDescription(newDescpription : String);
    function getDescription : String;
    {Interface-Implementationen}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  private
    nodeType : String;
  end;

  TTest = class(TInterfacedObject)

  end;

  // Entscheidungsknoten       // TInterfacedObject
  //TDecision = class abstract(TTMSFNCBloxUMLDecisionBlock, IworkflowComponent)
  TDecision = class abstract (TTMSFNCBloxUMLDecisionBlock, INodes)
    constructor Create(nodeID: Integer);
    destructor Destroy;
    procedure setID(newID : Integer);
    procedure setDescription(newDescpription : String);
    function getDescription : String;
    function getID : Integer;
    {Interface-Implementationen}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  private
    //Id: Integer;
    Description: String;
    nodeType: String;
  end;

  THumanDecision = class(TDecision)
    constructor Create(nodeID: Integer); //override;
  end;

  TMashineDecision = class(TDecision)
    constructor Create(nodeID: Integer); //override;
  end;

  // Aktionsknoten
  TTask = class abstract(TTMSFNCBloxUMLActionStateBlock, INodes)
    constructor Create(nodeID: Integer);
    destructor Destroy;
    procedure setID(newID : Integer);
    function getID : Integer;
    procedure setDescription(newDescpription : String);
    function getDescription : String;
    {Interface-Implementationen}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  private
    //Id: Integer;
    Description: String;
    nodeType: String;
  end;

  THumanTask = class(TTask)
    constructor Create(nodeID: Integer);
  end;

  TMashineTask = class(TTask)
    constructor Create(nodeID: Integer);
  end;
 /////////////////////////////////////////////////////////////////////
implementation

/////////////////////////////
procedure TTask.setID;
begin

end;

function TDecision.getID : Integer;
begin
  Result := ID.ToInteger();
end;

procedure TDecision.setDescription(newDescpription : String);
begin
  Description := newDescpription;
end;

function TDecision.getDescription : String;
begin
  Result := Description;
end;
//////////////////////////////////
{Konstruktoren aller Knoten}
constructor TStart.Create(nodeID: Integer);
var
  //popUp: TPopupMenu;
  item : TMenuItem;
begin
  inherited Create;
  ID := nodeID.ToString;
  Width := startEndSize;
  Height := Width;
  FillColor := darkBlue;
  FontSize := fontSize;
  Text := 'S';
  nodeType := Text;
end;

constructor TEnd.Create(nodeID: Integer);
begin
  inherited Create;
  ID := nodeID.ToString;
  Width := startEndSize;
  Height := Width;
  FillColor := darkGrey;
  Text := 'E';
  nodeType := Text;
  FontSize := fontSize;
end;

constructor TDecision.Create(nodeID: Integer);
begin
  inherited Create;
  ID := nodeID.ToString;
  Width := 100;
  Height := 100;
  FontSize := fontSize;
end;

constructor THumanDecision.Create(nodeID: Integer);
begin
  inherited Create(nodeID);
  FillColor := lightBlue;
  Text := 'HD';
  nodeType := Text;
end;

constructor TMashineDecision.Create(nodeID: Integer);
begin
  inherited Create(nodeID);
  FillColor := lightGray;
  Text := 'MD';
  nodeType := Text;
end;

constructor TTask.Create(nodeID: Integer);
begin
  inherited Create;
  ID := nodeID.ToString;
  Width := 150;
  Height := 80;
  FontSize := fontSize;
end;

constructor THumanTask.Create(nodeID: Integer);
begin
  inherited Create(nodeID);
  FillColor := lightBlue;
  Text := 'HT';
  nodeType := Text;
end;

constructor TMashineTask.Create(nodeID: Integer);
begin
  inherited Create(nodeID);
  FillColor := lightGray;
  Text := 'MT';
  nodeType := Text;
end;

//////////////////////////////////
{Destruktoren aller Knoten}
destructor TStart.Destroy;
begin

end;

destructor TEnd.Destroy;
begin

end;

destructor TDecision.Destroy;
begin

end;

destructor TTask.Destroy;
begin

end;

///////////////////////////
procedure TDecision.setID(newID : Integer);
begin
  Id := newID.ToString;
end;

function TTask.getID : Integer;
begin

end;
procedure TTask.setDescription(newDescpription : String);
begin

end;
function TTask.getDescription : String;
begin

end;

procedure TStart.setID(newID : Integer);
begin

end;
function TStart.getID : Integer;
begin

end;
procedure TStart.setDescription(newDescpription : String);
begin

end;
function TStart.getDescription : String;
begin

end;

procedure TEnd.setID(newID : Integer);
begin

end;
function TEnd.getID : Integer;
begin

end;
procedure TEnd.setDescription(newDescpription : String);
begin

end;
function TEnd.getDescription : String;
begin

end;

//////////////////////////////////////////////////////////////////////
{Kopierte Funktionen aus System fuer Interface-Implementierung}
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
    //__MarkDestroying(Self);
    Destroy;
  end;
{$ELSE}
  Result := __ObjRelease;
{$ENDIF}
end;
function TTask.QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
begin
  if GetInterface(IID, Obj) then Result := 0
  else Result := E_NOINTERFACE;
end;
function TTask._AddRef: Integer; stdcall;
begin
{$IFNDEF AUTOREFCOUNT}
  //Result := AtomicIncrement(FRefCount);
{$ELSE}
  Result := __ObjAddRef;
{$ENDIF}
end;
function TTask._Release: Integer; stdcall;
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
function TStart.QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
begin
  if GetInterface(IID, Obj) then Result := 0
  else Result := E_NOINTERFACE;
end;
function TStart._AddRef: Integer; stdcall;
begin
{$IFNDEF AUTOREFCOUNT}
  //Result := AtomicIncrement(FRefCount);
{$ELSE}
  Result := __ObjAddRef;
{$ENDIF}
end;
function TStart._Release: Integer; stdcall;
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
function TEnd.QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
begin
  if GetInterface(IID, Obj) then Result := 0
  else Result := E_NOINTERFACE;
end;
function TEnd._AddRef: Integer; stdcall;
begin
{$IFNDEF AUTOREFCOUNT}
  //Result := AtomicIncrement(FRefCount);
{$ELSE}
  Result := __ObjAddRef;
{$ENDIF}
end;
function TEnd._Release: Integer; stdcall;
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
