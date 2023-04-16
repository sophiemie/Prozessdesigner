unit UDatabase;

interface

uses
    Data.SqlExpr,
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
    Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
    FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB,
    FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
    FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.StdCtrls;

type
  {Klasse fuer normale Datenbankfunktionen}
  TDatabase = class
  public
    //function read(sqlString: String; query: TFDQuery; edit: TEdit): String;
    constructor Create(newQuery : TFDQuery; newTable: String);
    //constructor Create; overload;
    //procedure schreibeDatensatz(query: TFDQuery; id: Integer); overload;
    procedure schreibeDatensatz(id: Integer; text: String);
    procedure fuelleListeMitDatensatz(list: TListBox);
    function gebAnzahlDatensaetze(tabelle: String): Integer;
    function getHighestID(idName : String; table : String) : Integer;
    procedure setTable(newTable : String);
    function getTable : String;
  private
    //class var query: TFDQuery;
    var query: TFDQuery;
    var table : String;
    procedure read(sqlString: String);
    procedure write(sqlString: String);
  end;

  TNodeDatabase = class(TDatabase)
  public
    constructor Create(newQuery : TFDQuery; newTable : String);
    procedure addNewNode(diagramID: Integer; nodeType: String); overload;
    procedure addNewNode(diagramID: Integer; nodeID: Integer; nodeType: String); overload;
    procedure deleteNode(nodeID: Integer);
    function getHighestNodeID : Integer;
  private
    // Ohne class = Zugriffsverletzung
    //var table : String;
    //class var table : String; // https://de.wikibooks.org/wiki/Programmierkurs:_Delphi:_Pascal:_Zugriff_auf_Klassen
  end;

  TEdgeDatabase = class(TDatabase)
  public
    constructor Create(newQuery : TFDQuery; newTable : String);
    function getHighestEdgeID : Integer;
    procedure addNewEdge(edgeID: Integer);
  end;

implementation

constructor TDatabase.Create(newQuery : TFDQuery; newTable: String);
begin
  inherited Create();
  query := newQuery;
  table := newTable;
end;

procedure TDatabase.read(sqlString: String);
begin
  try
    query.SQL.Clear;
    query.SQL.Add(sqlString);
    query.Active := True;
    query.Active := False;
    query.Open;
    except on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TDatabase.write(sqlString: String);
begin
try
  query.SQL.Clear;
  query.SQL.Add(sqlString);
  query.ExecSQL;
  except on E: EFDDBEngineException do
    ShowMessage(E.Message);
end;

end;


procedure TDatabase.schreibeDatensatz(id: Integer; text: String);
begin

end;

function TDatabase.gebAnzahlDatensaetze(tabelle: String): Integer;
begin
  read('select count(*) from ' + tabelle);

  with query do
  begin
    Result := FieldByName('count(*)').AsString.ToInteger();
  end;
end;

procedure TDatabase.fuelleListeMitDatensatz(list: TListBox);
begin
  read('select * from wf_def');

  with query do
  begin
    First;
    while not EOF do
    begin
      list.Items.Add(FieldByName('name_en').AsString);
      Next;
    end;
  end;
end;

function TDatabase.getHighestID(idName : String; table : String) : Integer;
var
  sqlString: String;
  highestID : String;
begin
  sqlString := 'SELECT MAX(' + idName + ') FROM ' + table;
  read(sqlString);

  with query do
  begin
    highestID := FieldByName('MAX(' + idName + ')').AsString;
    if highestID.IsEmpty then Result := 0
    else Result := FieldByName('MAX(' + idName + ')').AsString.ToInteger();
  end;
end;



constructor TNodeDatabase.Create(newQuery : TFDQuery; newTable : String);
begin
  inherited Create(newQuery, newTable);
  //table := newTable;
  //setTable(newTable);
end;

procedure TDatabase.setTable(newTable : String);
begin
  table := newTable;
end;

function TDatabase.getTable : String;
begin
  Result := table;
end;

procedure TNodeDatabase.addNewNode(diagramID: Integer; nodeType: String);
var
  newNodeID: Integer;
  sqlString: String;
begin
  newNodeID := getHighestNodeID +1; //
  sqlString := 'insert into ' + getTable + ' (node_id, wf_type_id, node_type) values (' + newNodeID.ToString + ',' + diagramID.ToString + ',"' + nodeType + '")';
  write(sqlString);
  query.Close;
end;

procedure TNodeDatabase.addNewNode(diagramID: Integer; nodeID: Integer; nodeType: String);
var
  sqlString: String;
begin
  sqlString := 'insert into ' + getTable + ' (node_id, wf_type_id, node_type) values ('
            + nodeID.ToString + ',' + diagramID.ToString + ',"' + nodeType + '")';
  write(sqlString);
  query.Close;
end;


procedure TNodeDatabase.deleteNode(nodeID: Integer);
var
  sqlString : String;
begin
  sqlString := 'DELETE FROM ' + getTable + ' WHERE node_id = ' + nodeID.ToString;
  write(sqlString);
  query.Close;
end;

{}
function TNodeDatabase.getHighestNodeID : Integer;
begin
  Result := getHighestID('node_id', table);
end;

constructor TEdgeDatabase.Create(newQuery: TFDQuery; newTable : String);
begin
  inherited Create(newQuery, newTable);
end;

function TEdgeDatabase.getHighestEdgeID : Integer;
begin
  Result := getHighestID('wf_edge_id', table);
end;

procedure TEdgeDatabase.addNewEdge(edgeID: Integer);
begin
var
  sqlString: String;
begin
  sqlString := 'insert into ' + getTable + ' (wf_edge_id) values (' + edgeID.ToString + ')';
  write(sqlString);
  query.Close;
end;
end;

end.
