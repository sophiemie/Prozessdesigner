unit UDiagram;

interface

uses UNodes;

type
  TDiagram = class(TInterfacedObject, IWorkflowComponent)
  public
    constructor Create(newID: Integer; newName: String; newDescription: String);
    procedure setID(newID: Integer);
    procedure setName(newName: String);
    procedure setDescription(newDescription: String);
    procedure setInUse(value: boolean);
    procedure setClassName(newClassName : String);
    procedure setVersionNumber(newVersion: Integer);
    function getID : Integer;
    function getName : String;
    function getDescription : String;
    function getInUse : boolean;
    function getClassName : String;
    function getVersionNumber :Integer;
  private
    var ID : Integer;
    var Name : String;
    var Description : String;
    var InUse : boolean;
    var ClassName : String;
    var VersionNumber : Integer;   // Getter, Setter und Unittest schreiben
  end;

implementation

constructor TDiagram.Create(newID: Integer; newName: String;
  newDescription: String);
begin
  ID := newID;
  Name := newName;
  Description := newDescription;
  ClassName := Name + 'Form';
end;

{Getter und Setter}
procedure TDiagram.setID(newID: Integer);
begin
  ID := newID;
end;

procedure TDiagram.setName(newName: String);
begin
  Name := newName;
end;

procedure TDiagram.setDescription(newDescription: String);
begin
  Description := newDescription;
end;

procedure TDiagram.setInUse(value: boolean);
begin
  InUse := value;
end;

procedure TDiagram.setClassName(newClassName : String);
begin
  ClassName := newClassName;
end;

procedure TDiagram.setVersionNumber(newVersion: Integer);
begin
  VersionNumber := newVersion;
end;

function TDiagram.getID : Integer;  // Zugriffsfehler
begin
  Result := ID;
end;

function TDiagram.getName : String;
begin
  Result := Name;
end;

function TDiagram.getDescription : String;
begin
  Result := Description;
end;

function TDiagram.getInUse : boolean;
begin
  Result := InUse;
end;

function TDiagram.getClassName : String;
begin
  Result := ClassName;
end;

function TDiagram.getVersionNumber: Integer;
begin
  Result := VersionNumber;
end;

end.
