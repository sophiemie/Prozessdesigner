{
  Bachelorthesis ueber die Entwicklung einer grafischen Oberflaeche zur
  Erstellung von Workflows am ZMT (Leibniz-Zentrum fuer Marine Tropenforschung)
  Duales Studium Informatik, Hochschule Bremen
  Sophie Miessner 5046830, 2023

  Unit UNodes: Model-Klassen der Knoten
}
unit UNodes;

interface

uses
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCBloxCoreTypes,
  VCL.TMSFNCBloxCoreUtils, VCL.TMSFNCBloxCoreLine, VCL.TMSFNCBloxCorePolygon,
  VCL.TMSFNCBloxCoreTextCell, VCL.TMSFNCBloxCoreLineArrow, VCL.TMSFNCUtils,
  VCL.TMSFNCBloxCoreLinkPoint, VCL.TMSFNCBloxCoreHandle, System.Classes,
  VCL.TMSFNCBloxCoreGroup, VCL.TMSFNCBloxUISnapGrid, VCL.TMSFNCBloxCoreBlock,
  VCL.TMSFNCBloxCoreElement, VCL.TMSFNCBloxUIRegistration, VCL.TMSFNCTypes,
  VCL.TMSFNCBloxUIRenderer, VCL.TMSFNCBloxSelector,  VCL.TMSFNCStyles,
  VCL.TMSFNCBloxShapesUML, Vcl.Graphics, Vcl.Menus, Vcl.StdActnMenus,
  VCL.TMSFNCCustomControl, VCL.TMSFNCCustomScrollControl, VCL.TMSFNCBloxControl,
  System.SysUtils, System.Variants, UZMTStandard, Vcl.Dialogs;
var
  popUp :  TStandardMenuPopup;
  // https://stackoverflow.com/questions/18544127/creating-a-popup-menu-at-runtime
const
  startEndSize = 80;
  FONT_SIZE = 25.0;
type
  { Array für die verschiedenen Knotenspezifikation }
  TDescription = array of String;

  { Interface fuer Knoten, Kanten und Diagramme }
  IWorkflowComponent = interface(IInterface)
    procedure setID(newID : Integer);
    function getID : Integer;
  end;

  { Interface fuer alle Knoten }
  INodes = interface(IWorkflowComponent)
    procedure setDescription(newDescription : String);
    function getDescription : String;
    procedure setClassName(newClassName: String);
    function getClassName : String;
    procedure setMethodName(newMethodName : String);
    function getMethodName : String;
    function getType : String; //function getClassType : String;
  end;

  { Klasse der Startknoten }
  TStart = class(TTMSFNCBloxUMLInitialStateBlock, INodes)
    constructor Create(nodeID: Integer);
    procedure setID(newID : Integer);
    function getID : Integer;
    procedure setDescription(newDescription : String);
    function getDescription : String;
    function getType : String;
    procedure setClassName(newClassName: String);
    function getClassName : String;
    procedure setMethodName(newMethodName : String);
    function getMethodName : String;
    class function getClassType : String;
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
    CLASS_TYPE = 'TStart';
  end;

  { Klasse der Endknoten }
  TEnd = class(TTMSFNCBloxUMLFinalStateBlock, INodes)
  public
    constructor Create(nodeID: Integer; newDescription: String);
    procedure setID(newID : Integer);
    function getID : Integer;
    procedure setDescription(newDescription : String);
    function getDescription : String;
    function getType : String;
    procedure setClassName(newClassName: String);
    function getClassName : String;
    procedure setMethodName(newMethodName : String);
    function getMethodName : String;
    class function getClassType : String;
    class function getAllDescription : TDescription;
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
    CLASS_TYPE = 'TEnd';
  end;

  { Abstrakte Klasse der Entscheidungsknoten }
  TDecision = class abstract (TTMSFNCBloxUMLDecisionBlock, INodes)
    constructor Create(nodeID: Integer; newDescription: String);
    procedure setID(newID : Integer);
    procedure setDescription(newDescription : String); virtual;
    function getDescription : String;
    function getID : Integer;
    function getType : String; virtual;
    procedure setClassName(newClassName: String);
    function getClassName : String;
    procedure setMethodName(newMethodName : String);
    function getMethodName : String;
    class function getClassType : String; virtual; abstract;
    class function getAllDescription : TDescription; virtual; abstract;
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
    CLASS_TYPE = 'TDecision';
  end;

  { Klasse der menschlichen Entscheidungsknoten}
  THumanDecision = class(TDecision)
    constructor Create(nodeID: Integer; newDescription: String);
    function getType : String; override;
    procedure setDescription(newDescription : String); override;
    class function getClassType : String; override;
    class function getAllDescription : TDescription; override;
  private
    const
    NODE_TYPE = 'HD';
    CLASS_TYPE = 'THumanDecision';
  end;

  { Klasse der maschinellen Entscheidungsknoten}
  TMachineDecision = class(TDecision)
    constructor Create(nodeID: Integer; newDescription: String);
    function getType : String; override;
    procedure setDescription(newDescription : String); override;
    class function getClassType : String; override;
    class function getAllDescription : TDescription; override;
  private
    const
    NODE_TYPE = 'MD';
    CLASS_TYPE = 'TMachineDecision';
  end;

  { Abstrakte Klasse der Aufgabenknoten }
  TTask = class abstract(TTMSFNCBloxUMLActionStateBlock, INodes)
    constructor Create(nodeID: Integer; newDescription: String);
    procedure setID(newID : Integer);
    function getID : Integer;
    procedure setDescription(newDescription : String); virtual;
    function getDescription : String;
    function getType : String; virtual;
    procedure setClassName(newClassName: String);
    function getClassName : String;
    procedure setMethodName(newMethodName : String);
    function getMethodName : String;
    class function getClassType : String; virtual; abstract;
    class function getAllDescription : TDescription; virtual; abstract;
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
    CLASS_TYPE = 'TTask';
  end;

  { Klasse der menschlichen Aufgabenknoten}
  THumanTask = class(TTask)
    constructor Create(nodeID: Integer; newDescription: String);
    function getType : String; override;
    procedure setDescription(newDescription : String); override;
    class function getClassType : String; override;
    class function getAllDescription : TDescription; override;
  private
    const
    NODE_TYPE = 'HT';
    CLASS_TYPE = 'THumanTask';
  end;

  { Klasse der maschinellen Aufgabenknoten}
  TMachineTask = class(TTask)
    constructor Create(nodeID: Integer; newDescription: String);
    function getType : String; override;
    procedure setDescription(newDescription : String); override;
    class function getClassType : String; override;
    class function getAllDescription : TDescription; override;
  private
    const
    NODE_TYPE = 'MT';
    CLASS_TYPE = 'TMachineTask';
  end;
 /////////////////////////////////////////////////////////////////////
implementation

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
///////////////////////////////////////////////////////////////////
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
  Description := '';
  Text := NODE_TYPE;
  TextCells.Items[0].Font.Size := FONT_SIZE;
end;

constructor TEnd.Create(nodeID: Integer; newDescription: String);
begin
  inherited Create;
  ID := nodeID.ToString;
  Width := startEndSize;
  Height := Width;
  FillColor := darkGrey;
  Description := newDescription;
  Text := NODE_TYPE + ': ' + newDescription;
  TextCells.Items[0].Font.Size := FONT_SIZE;
end;

constructor TDecision.Create(nodeID: Integer; newDescription: String);
begin
  inherited Create;
  ID := nodeID.ToString;
  Width := 100;
  Height := 100;
  Description := newDescription;
  TextCells.Items[0].Font.Size := FONT_SIZE;
end;

constructor THumanDecision.Create(nodeID: Integer; newDescription: String);
begin
  inherited Create(nodeID, newDescription);
  FillColor := lightBlue;
  Text := NODE_TYPE + ': ' + newDescription;
end;

constructor TMachineDecision.Create(nodeID: Integer; newDescription: String);
begin
  inherited Create(nodeID, newDescription);
  FillColor := lightGray;
  Text := NODE_TYPE + ': ' + newDescription;
end;

constructor TTask.Create(nodeID: Integer; newDescription: String);
begin
  inherited Create;
  ID := nodeID.ToString;
  Width := 150;
  Height := 80;
  TextCells.Items[0].Font.Size := FONT_SIZE;
  Description := newDescription;
end;

constructor THumanTask.Create(nodeID: Integer; newDescription: String);
begin
  inherited Create(nodeID, newDescription);
  FillColor := lightBlue;
  Text := NODE_TYPE + ': ' + newDescription;
end;

constructor TMachineTask.Create(nodeID: Integer; newDescription: String);
begin
  inherited Create(nodeID, newDescription);
  FillColor := lightGray;
  Text := NODE_TYPE + ': ' + newDescription;
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
  Text := NODE_TYPE + ': ' + newDescription;
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
  Text := NODE_TYPE + ': ' + newDescription;
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
  ClassName := newClassName;
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
  ClassName := newClassName;
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

function TMachineTask.getType : String;
begin
  Result := NODE_TYPE;
end;

function TMachineDecision.getType : String;
begin
  Result := NODE_TYPE;
end;

procedure THumanTask.setDescription(newDescription : String);
begin
  Description := newDescription;
  Text := NODE_TYPE + ': ' + newDescription;
end;

procedure THumanDecision.setDescription(newDescription : String);
begin
  Description := newDescription;
  Text := NODE_TYPE + ': ' + newDescription;
end;

procedure TMachineTask.setDescription(newDescription : String);
begin
  Description := newDescription;
  Text := NODE_TYPE + ': ' + newDescription;
end;

procedure TMachineDecision.setDescription(newDescription : String);
begin
  Description := newDescription;
  Text := NODE_TYPE + ': ' + newDescription;
end;

class function TStart.getClassType : String;
begin
  Result := CLASS_TYPE;
end;

class function TEnd.getClassType : String;
begin
  Result := CLASS_TYPE;
end;

class function THumanTask.getClassType : String;
begin
  Result := CLASS_TYPE;
end;

class function THumanDecision.getClassType : String;
begin
  Result := CLASS_TYPE;
end;

class function TMachineDecision.getClassType : String;
begin
  Result := CLASS_TYPE;
end;

class function TMachineTask.getClassType : String;
begin
  Result := CLASS_TYPE;
end;


///////////// Fest kodierte Spezifikationen //////////////////////////////

class function TEnd.getAllDescription : TDescription;
var
  description: TDescription;
begin
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Standard';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Abbruch';
  Result := description;
end;

class function THumanTask.getAllDescription : TDescription;
var
  description: TDescription;
begin
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Urlaub';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Drittmittel';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'MitarbeiterInnen und Gäste';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Reiseantrag';
  Result := description;
end;

class function THumanDecision.getAllDescription : TDescription;
var
  description: TDescription;
begin
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Supervisor';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Leader';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Management';
  Result := description;
end;

class function TMachineTask.getAllDescription : TDescription;
var
  description: TDescription;
begin
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Generate PDF';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Send PDF';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Send Info';
  Result := description;
end;

class function TMachineDecision.getAllDescription : TDescription;
var
  description: TDescription;
begin
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Stellungnahme';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Genügend/Überschneidete Tage';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Anmeldung';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Programmbereich';
  SetLength(description, Length(description)+1);
  description[High(description)] := 'Position Antragsteller';
  Result := description;
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
