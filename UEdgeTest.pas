{
  Bachelorthesis ueber die Entwicklung einer grafischen Oberflaeche zur
  Erstellung von Workflows am ZMT (Leibniz-Zentrum fuer Marine Tropenforschung)
  Duales Studium Informatik, Hochschule Bremen
  Sophie Miessner 5046830, 2023

  Unit UEdgeTest: Testunit der Kantenklasse
}
unit UEdgeTest;

interface

uses
  DUnitX.TestFramework, UEdge;

type
  [TestFixture]
  TestTEdge = class
  strict private
    aEdge : TEdge;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Test neue ID setzen','100')]
    procedure TestSetID(newID: Integer);
    [TestCase('Test aktuelle ID zurueckgeben','6')]
    procedure TestGetID(_Result: Integer);
    [TestCase('Test ID des Knoten setzen','37963')]
    procedure TestSetNodeID(newNodeID: Integer);
    [TestCase('Test aktuelle Knoten ID zurueckgeben','8')]
    procedure TestGetNodeID(_Result: Integer);
    [TestCase('Test neue ID des naechsten Knotens setzen','100800')]
    procedure TestSetNextNodeID(nextNodeID: Integer);
    [TestCase('Test aktuelle ID des naechsten Knotens bekommen','900')]
    procedure TestGetNextNodeID(_Result: Integer);
    [TestCase('Test aktuellen Entscheidungswert setzen','3')]
    procedure TestSetDecisionVal(newDecisionVal: TDecisionValue);
    [TestCase('Test aktuellen Entscheidungswert ausgeben','NoDecision')]
    procedure TestGetDecisionVal(_Result: TDecisionValue);
    [TestCase('Test Klassennamen ausgeben','TEdge')]
    procedure TestGetClassType(_Result: String);
  end;

implementation

procedure TestTEdge.Setup;
begin
  aEdge := TEdge.Create(6,8);
  aEdge.setNextNodeID(900);
  aEdge.setDecisionVal(NoDecision);
end;

procedure TestTEdge.TearDown;
begin
end;

procedure TestTEdge.TestSetID(newID: Integer);
var
  R : Integer;
begin
  aEdge.setID(newID);
  R := aEdge.getID;
  Assert.AreEqual(R,newID);
end;

procedure TestTEdge.TestGetID(_Result: Integer);
var
  R : Integer;
begin
  R := aEdge.getID;
  Assert.AreEqual(R,_Result);
end;


procedure TestTEdge.TestSetNodeID(newNodeID: Integer);
var
  R : Integer;
begin
  aEdge.setNodeID(newNodeID);
  R := aEdge.getNodeID;
  Assert.AreEqual(R,newNodeID);
end;

procedure TestTEdge.TestGetNodeID(_Result: Integer);
var
  R : Integer;
begin
  R := aEdge.getNodeID;
  Assert.AreEqual(R,_Result);
end;

procedure TestTEdge.TestSetNextNodeID(nextNodeID: Integer);
var
  R : Integer;
begin
  aEdge.setNextNodeID(nextNodeID);
  R := aEdge.getNextNodeID;
  Assert.AreEqual(R,nextNodeID);
end;

procedure TestTEdge.TestGetNextNodeID(_Result: Integer);
var
  R : Integer;
begin
  R := aEdge.getNextNodeID;
  Assert.AreEqual(R,_Result);
end;

procedure TestTEdge.TestSetDecisionVal(newDecisionVal: TDecisionValue);
var
  R : TDecisionValue;
begin
  aEdge.setDecisionVal(newDecisionVal);
  R := aEdge.getDecisionVal;
  Assert.AreEqual(R,newDecisionVal);
end;

procedure TestTEdge.TestGetDecisionVal(_Result: TDecisionValue);
var
  R : TDecisionValue;
begin
  R := aEdge.getDecisionVal;
  Assert.AreEqual(R,_Result);
end;

procedure TestTEdge.TestGetClassType(_Result: String);
var
  R : String;
begin
  R := TEdge.getClassType;
  Assert.AreEqual(R, _Result);
end;

initialization
  TDUnitX.RegisterTestFixture(TestTEdge);

end.
