unit UDatabaseTest;

interface

uses
  DUnitX.TestFramework, UDatabase;

type
  [TestFixture]
  TestTDatabase = class
  strict private
    aDatabase : TDatabase;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Test setze Tabellennamen','Neuer Tabellenname')]
    procedure setTable(newTable: String);
    [TestCase('Test geb Tabellennamen','TestTabelle')]
    procedure getTable(_Result: String);
  end;

  [TestFixture]
  TestTNodeDatabase = class
  strict private
    aNodeDatabase : TNodeDatabase;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Test setze Tabellennamen','Neuer Tabellenname')]
    procedure setTable(newTable: String);
    [TestCase('Test geb Tabellennamen','TestTabelle')]
    procedure getTable(_Result: String);
  end;

  [TestFixture]
  TestTEdgeDatabase = class
  strict private
    aEdgeDatabase : TEdgeDatabase;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Test setze Tabellennamen','Neuer Tabellenname')]
    procedure setTable(newTable: String);
    [TestCase('Test geb Tabellennamen','TestTabelle')]
    procedure getTable(_Result: String);
  end;

  [TestFixture]
  TestTDiagramDatabase = class
  strict private
    aDiagramDatabase : TDiagramDatabase;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Test setze Tabellennamen','Neuer Tabellenname')]
    procedure setTable(newTable: String);
    [TestCase('Test geb Tabellennamen','TestTabelle')]
    procedure getTable(_Result: String);
  end;
implementation

procedure TestTDatabase.Setup;
begin
  aDatabase := TDatabase.Create(nil,'TestTabelle');
end;

procedure TestTDatabase.TearDown;
begin
end;

procedure TestTDatabase.setTable(newTable: String);
begin
  aDatabase.setTable(newTable);
  Assert.AreEqual(aDatabase.getTable, newTable);
end;

procedure TestTDatabase.getTable(_Result: String);
begin
  Assert.AreEqual(aDatabase.getTable, _Result);
end;

procedure TestTNodeDatabase.Setup;
begin
  aNodeDatabase := TNodeDatabase.Create(nil,'TestTabelle');
end;

procedure TestTNodeDatabase.TearDown;
begin
end;

procedure TestTNodeDatabase.setTable(newTable: String);
begin
  aNodeDatabase.setTable(newTable);
  Assert.AreEqual(aNodeDatabase.getTable, newTable);
end;

procedure TestTNodeDatabase.getTable(_Result: String);
begin
  Assert.AreEqual(aNodeDatabase.getTable, _Result);
end;

procedure TestTEdgeDatabase.Setup;
begin
  aEdgeDatabase := TEdgeDatabase.Create(nil,'TestTabelle');
end;

procedure TestTEdgeDatabase.TearDown;
begin
end;

procedure TestTEdgeDatabase.setTable(newTable: String);
begin
  aEdgeDatabase.setTable(newTable);
  Assert.AreEqual(aEdgeDatabase.getTable, newTable);
end;

procedure TestTEdgeDatabase.getTable(_Result: String);
begin
  Assert.AreEqual(aEdgeDatabase.getTable, _Result);
end;

procedure TestTDiagramDatabase.Setup;
begin
  aDiagramDatabase := TDiagramDatabase.Create(nil,'TestTabelle');
end;

procedure TestTDiagramDatabase.TearDown;
begin
end;

procedure TestTDiagramDatabase.setTable(newTable: String);
begin
  aDiagramDatabase.setTable(newTable);
  Assert.AreEqual(aDiagramDatabase.getTable, newTable);
end;

procedure TestTDiagramDatabase.getTable(_Result: String);
begin
  Assert.AreEqual(aDiagramDatabase.getTable, _Result);
end;

initialization
  TDUnitX.RegisterTestFixture(TestTNodeDatabase);

end.
