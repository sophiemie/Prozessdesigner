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
    function getID : Integer;
    function getName : String;
    function getDescription : String;
    function getInUse : boolean;
  private
    ID : Integer;
    Name : String;
    Description : String;
    InUse : boolean;
  end;

implementation

constructor TDiagram.Create(newID: Integer; newName: String;
  newDescription: String);
begin
  ID := newID;
  Name := newName;
  Description := newDescription;
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

function TDiagram.getID : Integer;
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

end.
