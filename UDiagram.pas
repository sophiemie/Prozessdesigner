{
  Bachelorthesis ueber die Entwicklung einer grafischen Oberflaeche zur
  Erstellung von Workflows am ZMT (Leibniz-Zentrum fuer Marine Tropenforschung)
  Duales Studium Informatik, Hochschule Bremen
  Sophie Miessner 5046830, 2023

  Unit UDiagram: Hier wird die Modelklasse des Diagramms festgehalten.
}
unit UDiagram;

interface

uses UNodes;

type
  { Klasse der Diagramme }
  TDiagram = class(TInterfacedObject, IWorkflowComponent)
  public
    constructor Create(newID: Integer; newName: String; newDescription: String);
    procedure setID(newID: Integer);
    procedure setGermanName(newName: String);
    procedure setEnglishName(newName: String);
    procedure setGermanDescription(newDescription: String);
    procedure setEnglishDescription(newDescription: String);
    procedure setInUse(value: boolean);
    procedure setClassName(newClassName : String);
    procedure setVersionNumber(newVersion: Integer);
    function getID : Integer;
    function getGermanName : String;
    function getEnglishName : String;
    function getGermanDescription : String;
    function getEnglishDescription : String;
    function getInUse : boolean;
    function getClassName : String;
    function getVersionNumber :Integer;
  private
    var ID : Integer;
    var GermanName : String;
    var EnglishName : String;
    var GermanDescription : String;
    var EnglishDescription : String;
    var InUse : boolean;
    var ClassName : String;
    var VersionNumber : Integer;
  end;

implementation

{ Konstruktor der Klasse TDiagram }
constructor TDiagram.Create(newID: Integer; newName: String;
  newDescription: String);
begin
  ID := newID;
  GermanName := newName;
  GermanDescription := newDescription;
  ClassName := GermanName + 'Form';
  InUse := true;
  VersionNumber := 1;
end;

{Getter und Setter}
procedure TDiagram.setID(newID: Integer);
begin
  ID := newID;
end;

procedure TDiagram.setGermanName(newName: String);
begin
  GermanName := newName;
end;

procedure TDiagram.setEnglishName(newName: String);
begin
  EnglishName := newName;
end;

procedure TDiagram.setGermanDescription(newDescription: String);
begin
  GermanDescription := newDescription;
end;

procedure TDiagram.setEnglishDescription(newDescription: String);
begin
  EnglishDescription := newDescription;
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

function TDiagram.getID : Integer;
begin
  Result := ID;
end;

function TDiagram.getGermanName : String;
begin
  Result := GermanName;
end;

function TDiagram.getEnglishName : String;
begin
  Result := EnglishName;
end;

function TDiagram.getGermanDescription : String;
begin
  Result := GermanDescription;
end;

function TDiagram.getEnglishDescription : String;
begin
  Result := EnglishDescription;
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
