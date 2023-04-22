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

[TestFixture]
  TestTEnd = class
  strict private
    aEndNode : TEnd;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Test setze neue Start-ID','10')]
    procedure TestSetID(newID : Integer);
    [Testcase('Test gebe Start-ID','3')]
    procedure TestGetID(_Result: Integer);
    [TestCase('Test setze neue Beschreibung','Standard')]
    procedure TestSetDescription(newDescription: String);
    [TestCase('Test Textfeld nach neuer Beschreibung','Standard')]
    procedure TestSetDescription_Text(newDescription: String);
    [TestCase('Test gebe Beschreibung','Abbruch')]
    procedure TestGetDescription(_Result: String);
    [TestCase('Test gebe Typ','E')]
    procedure TestGetType(_Result: String);
    [TestCase('Test ','EndForm')]
    procedure TestSetClassName(newClassName: String);
    [TestCase(' Test ','EndClass')]
    procedure TestGetClassName(_Result: String);
    [TestCase('Test ','EndNewMethod')]
    procedure TestSetMethod(newMethodName: String);
    [TestCase(' Test ','EndMethod')]
    procedure TestGetMethod(_Result: String);
  end;

[TestFixture]
  TestTHumanTask = class
  strict private
    aHTNode : THumanTask;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Test setze neue Start-ID','78')]
    procedure TestSetID(newID : Integer);
    [Testcase('Test gebe Start-ID','45')]
    procedure TestGetID(_Result: Integer);
    [TestCase('Test setze neue Beschreibung','Urlaubsantrag')]
    procedure TestSetDescription(newDescription: String);
    [TestCase('Test Textfeld nach neuer Beschreibung','Urlaubsantrag')]
    procedure TestSetDescription_Text(newDescription: String);
    [TestCase('Test gebe Beschreibung','Reiseantrag')]
    procedure TestGetDescription(_Result: String);
    [TestCase('Test gebe Typ','HT')]
    procedure TestGetType(_Result: String);
    [TestCase('Test ','HTForm')]
    procedure TestSetClassName(newClassName: String);
    [TestCase(' Test ','HTClass')]
    procedure TestGetClassName(_Result: String);
    [TestCase('Test ','HTNewMethod')]
    procedure TestSetMethod(newMethodName: String);
    [TestCase(' Test ','HTMethod')]
    procedure TestGetMethod(_Result: String);
  end;

[TestFixture]
  TestTHumanDecision = class
  strict private
    aHDNode : THumanDecision;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Test setze neue Start-ID','2003')]
    procedure TestSetID(newID : Integer);
    [Testcase('Test gebe Start-ID','1996')]
    procedure TestGetID(_Result: Integer);
    [TestCase('Test setze neue Beschreibung','Abteilungsleiter 34')]
    procedure TestSetDescription(newDescription: String);
    [TestCase('Test Textfeld nach neuer Beschreibung','Abteilungsleiter 34')]
    procedure TestSetDescription_Text(newDescription: String);
    [TestCase('Test gebe Beschreibung','Leader')]
    procedure TestGetDescription(_Result: String);
    [TestCase('Test gebe Typ','HD')]
    procedure TestGetType(_Result: String);
    [TestCase('Test ','HDForm')]
    procedure TestSetClassName(newClassName: String);
    [TestCase(' Test ','HDClass')]
    procedure TestGetClassName(_Result: String);
    [TestCase('Test ','HDNewMethod')]
    procedure TestSetMethod(newMethodName: String);
    [TestCase(' Test ','HDMethod')]
    procedure TestGetMethod(_Result: String);
  end;


implementation

//////////////////////////// START /////////////////////////////////////////

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

///////////////////////////////   END   /////////////////////////////////////

procedure TestTEnd.Setup;
begin
  aEndNode := TEnd.Create(3,'Abbruch');
  aEndNode.setClassName('EndClass');
  aEndNode.setMethodName('EndMethod');
end;

procedure TestTEnd.TearDown;
begin
end;

{ Es wird die neue ID erwartet, die gesetzt wurde }
procedure TestTEnd.TestSetID(newID : Integer);
var
  R : Integer;
begin
  aEndNode.setID(newID);
  R := aEndNode.getID;
  Assert.AreEqual(R,newID);
end;

{ Es wird die ID erwartet, die bei der Initialisierung uebergeben wurde }
procedure TestTEnd.TestGetID(_Result: Integer);
var
  R : Integer;
begin
  R := aEndNode.getID;
  Assert.AreEqual(R,_Result);
end;

procedure TestTEnd.TestSetDescription(newDescription: String);
var
  R : String;
begin
  aEndNode.setDescription(newDescription);
  R := aEndNode.getDescription;
  Assert.AreEqual(R, newDescription);
end;

procedure TestTEnd.TestSetDescription_Text(newDescription: String);
var
  R : String;
begin
  aEndNode.setDescription(newDescription);
  R := aEndNode.getType + ': ' + newDescription;
  Assert.AreEqual(R, aEndNode.Text);
end;

procedure TestTEnd.TestGetDescription(_Result: String);
var
  R : String;
begin
  R := aEndNode.getDescription;
  Assert.AreEqual(R, _Result);
end;

procedure TestTEnd.TestGetType(_Result: String);
var
  R : String;
begin
  R := aEndNode.getType;
  Assert.AreEqual(R, _Result);
end;

procedure TestTEnd.TestSetClassName(newClassName: String);
var
  R : String;
begin
  aEndNode.setClassName(newClassName);
  R := aEndNode.getClassName;
  Assert.AreEqual(R, newClassName);
end;

procedure TestTEnd.TestGetClassName(_Result: String);
var
  R : String;
begin
  R := aEndNode.getClassName;
  Assert.AreEqual(R, _Result);
end;

procedure TestTEnd.TestSetMethod(newMethodName: String);
var
  R : String;
begin
  aEndNode.setMethodName(newMethodName);
  R := aEndNode.getMethodName;
  Assert.AreEqual(R, newMethodName);
end;

procedure TestTEnd.TestGetMethod(_Result: String);
var
  R : String;
begin
  R := aEndNode.getMethodName;
  Assert.AreEqual(R, _Result);
end;
 ///////////////////// THumanTask ////////////////////////

procedure TestTHumanTask.Setup;
begin
  aHTNode := THumanTask.Create(45,'Reiseantrag');
  aHTNode.setClassName('HTClass');
  aHTNode.setMethodName('HTMethod');
end;

procedure TestTHumanTask.TearDown;
begin
end;

{ Es wird die neue ID erwartet, die gesetzt wurde }
procedure TestTHumanTask.TestSetID(newID : Integer);
var
  R : Integer;
begin
  aHTNode.setID(newID);
  R := aHTNode.getID;
  Assert.AreEqual(R,newID);
end;

{ Es wird die ID erwartet, die bei der Initialisierung uebergeben wurde }
procedure TestTHumanTask.TestGetID(_Result: Integer);
var
  R : Integer;
begin
  R := aHTNode.getID;
  Assert.AreEqual(R,_Result);
end;

procedure TestTHumanTask.TestSetDescription(newDescription: String);
var
  R : String;
begin
  aHTNode.setDescription(newDescription);
  R := aHTNode.getDescription;
  Assert.AreEqual(R, newDescription);
end;

procedure TestTHumanTask.TestSetDescription_Text(newDescription: String);
var
  R : String;
begin
  aHTNode.setDescription(newDescription);
  R := aHTNode.getType + ': ' + newDescription;
  Assert.AreEqual(R, aHTNode.Text);
end;

procedure TestTHumanTask.TestGetDescription(_Result: String);
var
  R : String;
begin
  R := aHTNode.getDescription;
  Assert.AreEqual(R, _Result);
end;

procedure TestTHumanTask.TestGetType(_Result: String);
var
  R : String;
begin
  R := aHTNode.getType;
  Assert.AreEqual(R, _Result);
end;

procedure TestTHumanTask.TestSetClassName(newClassName: String);
var
  R : String;
begin
  aHTNode.setClassName(newClassName);
  R := aHTNode.getClassName;
  Assert.AreEqual(R, newClassName);
end;

procedure TestTHumanTask.TestGetClassName(_Result: String);
var
  R : String;
begin
  R := aHTNode.getClassName;
  Assert.AreEqual(R, _Result);
end;

procedure TestTHumanTask.TestSetMethod(newMethodName: String);
var
  R : String;
begin
  aHTNode.setMethodName(newMethodName);
  R := aHTNode.getMethodName;
  Assert.AreEqual(R, newMethodName);
end;

procedure TestTHumanTask.TestGetMethod(_Result: String);
var
  R : String;
begin
  R := aHTNode.getMethodName;
  Assert.AreEqual(R, _Result);
end;

///////////////////////////// THumanDecision ////////////////////////////

procedure TestTHumanDecision.Setup;
begin
  aHDNode := THumanDecision.Create(1996,'Leader');
  aHDNode.setClassName('HDClass');
  aHDNode.setMethodName('HDMethod');
end;

procedure TestTHumanDecision.TearDown;
begin
end;

{ Es wird die neue ID erwartet, die gesetzt wurde }
procedure TestTHumanDecision.TestSetID(newID : Integer);
var
  R : Integer;
begin
  aHDNode.setID(newID);
  R := aHDNode.getID;
  Assert.AreEqual(R,newID);
end;

{ Es wird die ID erwartet, die bei der Initialisierung uebergeben wurde }
procedure TestTHumanDecision.TestGetID(_Result: Integer);
var
  R : Integer;
begin
  R := aHDNode.getID;
  Assert.AreEqual(R,_Result);
end;

procedure TestTHumanDecision.TestSetDescription(newDescription: String);
var
  R : String;
begin
  aHDNode.setDescription(newDescription);
  R := aHDNode.getDescription;
  Assert.AreEqual(R, newDescription);
end;

procedure TestTHumanDecision.TestSetDescription_Text(newDescription: String);
var
  R : String;
begin
  aHDNode.setDescription(newDescription);
  R := aHDNode.getType + ': ' + newDescription;
  Assert.AreEqual(R, aHDNode.Text);
end;

procedure TestTHumanDecision.TestGetDescription(_Result: String);
var
  R : String;
begin
  R := aHDNode.getDescription;
  Assert.AreEqual(R, _Result);
end;

procedure TestTHumanDecision.TestGetType(_Result: String);
var
  R : String;
begin
  R := aHDNode.getType;
  Assert.AreEqual(R, _Result);
end;

procedure TestTHumanDecision.TestSetClassName(newClassName: String);
var
  R : String;
begin
  aHDNode.setClassName(newClassName);
  R := aHDNode.getClassName;
  Assert.AreEqual(R, newClassName);
end;

procedure TestTHumanDecision.TestGetClassName(_Result: String);
var
  R : String;
begin
  R := aHDNode.getClassName;
  Assert.AreEqual(R, _Result);
end;

procedure TestTHumanDecision.TestSetMethod(newMethodName: String);
var
  R : String;
begin
  aHDNode.setMethodName(newMethodName);
  R := aHDNode.getMethodName;
  Assert.AreEqual(R, newMethodName);
end;

procedure TestTHumanDecision.TestGetMethod(_Result: String);
var
  R : String;
begin
  R := aHDNode.getMethodName;
  Assert.AreEqual(R, _Result);
end;

////////////////////////////////////////
initialization
  TDUnitX.RegisterTestFixture(TestTStart);

end.
