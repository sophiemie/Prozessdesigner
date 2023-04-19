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
  fontSize = 3.0;
type

  IWorkflowComponent = interface(IInterface)
    procedure setID(newID : Integer);
    function getID : Integer;
  end;

  INodes = interface(IWorkflowComponent)
    procedure setDescription(newDescription : String);
    function getDescription : String;
    procedure setClassName(newClassName: String);
    function getClassName : String;
    procedure setMethodName(newMethodName : String);
    function getMethodName : String;
    function getType : String;
  end;

  // Start- und Endknoten
  TStart = class(TTMSFNCBloxUMLInitialStateBlock, INodes)
    popUp : TPopupMenu;
    constructor Create(nodeID: Integer);
    destructor Destroy;
    procedure setID(newID : Integer);
    function getID : Integer;
    procedure setDescription(newDescription : String);
    function getDescription : String;
    function getType : String;
    procedure setClassName(newClassName: String);
    function getClassName : String;
    procedure setMethodName(newMethodName : String);
    function getMethodName : String;
     {Interface-Implementationen}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  private
  var
    Description : String;
    ClassName : String;
    Method : String;
  const
    NODE_TYPE = 'S';
  end;

  TEnd = class(TTMSFNCBloxUMLFinalStateBlock, INodes)
    constructor Create(nodeID: Integer);
    destructor Destroy;
    procedure setID(newID : Integer);
    function getID : Integer;
    procedure setDescription(newDescription : String);
    function getDescription : String;
    function getType : String;
    procedure setClassName(newClassName: String);
    function getClassName : String;
    procedure setMethodName(newMethodName : String);
    function getMethodName : String;
    {Interface-Implementationen}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  private
  var
    Description : String;
    ClassName : String;
    Method : String;
  const
    NODE_TYPE = 'E';
  end;

  // Entscheidungsknoten       // TInterfacedObject
  //TDecision = class abstract(TTMSFNCBloxUMLDecisionBlock, IworkflowComponent)
  TDecision = class abstract (TTMSFNCBloxUMLDecisionBlock, INodes)
    constructor Create(nodeID: Integer);
    destructor Destroy;
    procedure setID(newID : Integer);
    procedure setDescription(newDescription : String);
    function getDescription : String;
    function getID : Integer;
    function getType : String; virtual; //abstract; // soll erst in Childklasse
    // beschrieben werden
    procedure setClassName(newClassName: String);
    function getClassName : String;
    procedure setMethodName(newMethodName : String);
    function getMethodName : String;
    {Interface-Implementationen}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  private
  var
    Description : String;
    ClassName : String;
    Method : String;
  end;

  THumanDecision = class(TDecision)
    constructor Create(nodeID: Integer);
    function getType : String;
  private
    const
    NODE_TYPE = 'HD';
  end;

  TMashineDecision = class(TDecision)
    constructor Create(nodeID: Integer);
    function getType : String;
  private
    const
    NODE_TYPE = 'MD';
  end;

  // Aktionsknoten
  TTask = class abstract(TTMSFNCBloxUMLActionStateBlock, INodes)
    constructor Create(nodeID: Integer);
    destructor Destroy;
    procedure setID(newID : Integer);
    function getID : Integer;
    procedure setDescription(newDescription : String);
    function getDescription : String;
    function getType : String; virtual; //abstract;
    procedure setClassName(newClassName: String);
    function getClassName : String;
    procedure setMethodName(newMethodName : String);
    function getMethodName : String;
    {Interface-Implementationen}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  private
  var
    Description : String;
    ClassName : String;
    Method : String;
  end;

  THumanTask = class(TTask)
    constructor Create(nodeID: Integer);
    function getType : String; override;
  private
    const
    NODE_TYPE = 'HT';
  end;

  TMashineTask = class(TTask)
    constructor Create(nodeID: Integer);
    function getType : String; override;
  private
    const
    NODE_TYPE = 'MT';
  end;
 /////////////////////////////////////////////////////////////////////
implementation

/////////////////////////////
procedure TTask.setID(newID : Integer);
begin
  ID := newID.ToString();
end;

function TDecision.getID : Integer;
begin
  Result := ID.ToInteger();
end;

procedure TDecision.setDescription(newDescription : String);
begin
  Description := newDescription;
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
  Text := NODE_TYPE;
end;

constructor TEnd.Create(nodeID: Integer);
begin
  inherited Create;
  ID := nodeID.ToString;
  Width := startEndSize;
  Height := Width;
  FillColor := darkGrey;
  Text := NODE_TYPE;
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
  Text := NODE_TYPE;
end;

constructor TMashineDecision.Create(nodeID: Integer);
begin
  inherited Create(nodeID);
  FillColor := lightGray;
  Text := NODE_TYPE;
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
  Text := NODE_TYPE;
end;

constructor TMashineTask.Create(nodeID: Integer);
begin
  inherited Create(nodeID);
  FillColor := lightGray;
  Text := NODE_TYPE;
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
  Result := ID.ToInteger;
end;
procedure TTask.setDescription(newDescription : String);
begin
  Description := newDescription;
end;
function TTask.getDescription : String;
begin
  Result := Description;
end;

procedure TStart.setID(newID : Integer);
begin
  ID := newID.ToString();
end;
function TStart.getID : Integer;
begin
  Result := ID.ToInteger;
end;
procedure TStart.setDescription(newDescription : String);
begin
  Description := newDescription;
end;
function TStart.getDescription : String;
begin
  Result := Description;
end;

procedure TEnd.setID(newID : Integer);
begin
  ID := newID.ToString();
end;
function TEnd.getID : Integer;
begin
  Result := ID.ToInteger;
end;
procedure TEnd.setDescription(newDescription : String);
begin
  Description := newDescription;
end;
function TEnd.getDescription : String;
begin
  Result := Description;
end;


function TStart.getType : String;
begin
  Result := NODE_TYPE;
end;
procedure TStart.setClassName(newClassName: String);
begin

end;
function TStart.getClassName : String;
begin
  Result := ClassName;
end;
procedure TStart.setMethodName(newMethodName : String);
begin
  Method := newMethodName;
end;
function TStart.getMethodName : String;
begin
  Result := Method;
end;


function TEnd.getType : String;
begin
  Result := NODE_TYPE;
end;
procedure TEnd.setClassName(newClassName: String);
begin

end;
function TEnd.getClassName : String;
begin
  Result := ClassName;
end;
procedure TEnd.setMethodName(newMethodName : String);
begin
  Method := newMethodName;
end;
function TEnd.getMethodName : String;
begin
  Result := Method;
end;


procedure TTask.setClassName(newClassName: String);
begin
  ClassName := newClassName;
end;
function TTask.getClassName : String;
begin
  Result := ClassName;
end;
procedure TTask.setMethodName(newMethodName : String);
begin
  Method := newMethodName;
end;
function TTask.getMethodName : String;
begin
  Result := Method;
end;


procedure TDecision.setClassName(newClassName: String);
begin
  ClassName := newClassName;
end;
function TDecision.getClassName : String;
begin
  Result := ClassName;
end;
procedure TDecision.setMethodName(newMethodName : String);
begin
  Method := newMethodName;
end;
function TDecision.getMethodName : String;
begin
  Result := Method;
end;


function TTask.getType : String;
begin
  Result := '';
end;

function TDecision.getType : String;
begin
  Result := '';
end;

function THumanTask.getType : String;
begin
  Result := NODE_TYPE;
end;

function THumanDecision.getType : String;
begin
  Result := NODE_TYPE;
end;

function TMashineTask.getType : String;
begin
  Result := NODE_TYPE;
end;

function TMashineDecision.getType : String;
begin
  Result := NODE_TYPE;
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
