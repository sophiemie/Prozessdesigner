unit UNodeTest;

interface

uses
  DUnitX.TestFramework, UNodes;

type
  [TestFixture]
  TestTStart = class
  strict private
    aStartNode : TStart;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Test setze neue Start-ID','5')]
    procedure TestSetID(newID : Integer);
    [Testcase('Test gebe Start-ID','1')]
    procedure TestGetID(_Result: Integer);
    [TestCase('Test setze neue Beschreibung','Neuer Start')]
    procedure TestSetDescription(newDescription: String);
    [TestCase('Test Textfeld nach neuer Beschreibung','Neuer Start')]
    procedure TestSetDescription_Text(newDescription: String);
    [TestCase('Test gebe Beschreibung','Neuer Prozess')]
    procedure TestGetDescription(_Result: String);
    [TestCase('Test gebe Typ','S')]
    procedure TestGetType(_Result: String);
    [TestCase('Test ','StartForm')]
    procedure TestSetClassName(newClassName: String);
    [TestCase(' Test ','StartClass')]
    procedure TestGetClassName(_Result: String);
    [TestCase('Test ','StartNewMethod')]
    procedure TestSetMethod(newMethodName: String);
    [TestCase(' Test ','StartMethod')]
    procedure TestGetMethod(_Result: String);

  end;

implementation

procedure TestTStart.Setup;
begin
  aStartNode := TStart.Create(1);
  aStartNode.setDescription('Neuer Prozess');
  aStartNode.setClassName('StartClass');
  aStartNode.setMethodName('StartMethod');
end;

procedure TestTStart.TearDown;
begin
end;

{ Es wird die neue ID erwartet, die gesetzt wurde }
procedure TestTStart.TestSetID(newID : Integer);
var
  R : Integer;
begin
  aStartNode.setID(newID);
  R := aStartNode.getID;
  Assert.AreEqual(R,newID);
end;

{ Es wird die ID erwartet, die bei der Initialisierung uebergeben wurde }
procedure TestTStart.TestGetID(_Result: Integer);
var
  R : Integer;
begin
  R := aStartNode.getID;
  Assert.AreEqual(R,_Result);
end;

procedure TestTStart.TestSetDescription(newDescription: String);
var
  R : String;
begin
  aStartNode.setDescription(newDescription);
  R := aStartNode.getDescription;
  Assert.AreEqual(R, newDescription);
end;

procedure TestTStart.TestSetDescription_Text(newDescription: String);
var
  R : String;
begin
  aStartNode.setDescription(newDescription);
  R := aStartNode.getType + ': ' + newDescription;
  Assert.AreEqual(R, aStartNode.Text);
end;

procedure TestTStart.TestGetDescription(_Result: String);
var
  R : String;
begin
  R := aStartNode.getDescription;
  Assert.AreEqual(R, _Result);
end;

procedure TestTStart.TestGetType(_Result: String);
var
  R : String;
begin
  R := aStartNode.getType;
  Assert.AreEqual(R, _Result);
end;

procedure TestTStart.TestSetClassName(newClassName: String);
var
  R : String;
begin
  aStartNode.setClassName(newClassName);
  R := aStartNode.getClassName;
  Assert.AreEqual(R, newClassName);
end;

procedure TestTStart.TestGetClassName(_Result: String);
var
  R : String;
begin
  R := aStartNode.getClassName;
  Assert.AreEqual(R, _Result);
end;

procedure TestTStart.TestSetMethod(newMethodName: String);
var
  R : String;
begin
  aStartNode.setMethodName(newMethodName);
  R := aStartNode.getMethodName;
  Assert.AreEqual(R, newMethodName);
end;

procedure TestTStart.TestGetMethod(_Result: String);
var
  R : String;
begin
  R := aStartNode.getMethodName;
  Assert.AreEqual(R, _Result);
end;

initialization
  TDUnitX.RegisterTestFixture(TestTStart);

end.
