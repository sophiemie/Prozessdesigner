unit UDatabase;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Forms,
    Vcl.Graphics, Vcl.Controls, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.DatS,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
    FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB,
    FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DApt.Intf, Vcl.StdCtrls,
    FireDAC.DApt, FireDAC.Comp.DataSet, Data.SqlExpr, System.Classes, UDiagram,
    UNodes, UEdge;

type
  {Klasse fuer normale Datenbankfunktionen}
  TDatabase = class
  public
    constructor Create(newQuery : TFDQuery; newTable: String);
    procedure fillList(list: TListBox);
    function getDataCount : Integer;
    function getHighestID(idName : String) : Integer;
    procedure setTable(newTable : String);
    function getTable : String;
  private
    var query: TFDQuery;
    var table : String;
    procedure read(sqlString: String);
    procedure write(sqlString: String);
  end;

  TNodeDatabase = class(TDatabase)
  public
    constructor Create(newQuery : TFDQuery; newTable : String);
    procedure addNewNode(diagram: TDiagram; node: TStart); overload;
    procedure addNewNode(diagram: TDiagram; node: TEnd); overload;
    procedure addNewNode(diagram: TDiagram; node: TDecision); overload;
    procedure addNewNode(diagram: TDiagram; node: TTask); overload;
    procedure deleteNode(nodeID: Integer);
    function getHighestNodeID : Integer;
  private
    procedure addNewNode(diagramID : String; nodeID : String; nodeType : String;
                          nodeDescription : String); overload;
  end;

  TEdgeDatabase = class(TDatabase)
  public
    constructor Create(newQuery : TFDQuery; newTable : String);
    function getHighestEdgeID : Integer;
    procedure addNewEdge(edge: TEdge);
    procedure addNextNode(edge: TEdge);
    procedure deleteEdge(edgeID: Integer);
  end;

  TDiagramDatabase = class(TDatabase)
  public
    constructor Create(newQuery : TFDQuery; newTable : String);
    procedure addNewDiagram(diagram: TDiagram);
    procedure deleteDiagram(diagram: TDiagram);
    procedure addNewDiagramVersion(diagram: TDiagram);
    function getHighestDiagramID : Integer;
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

function TDatabase.getDataCount(): Integer;
begin
  read('select count(*) from ' + table);

  with query do
  begin
    Result := FieldByName('count(*)').AsString.ToInteger();
  end;
end;

procedure TDatabase.fillList(list: TListBox);
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

function TDatabase.getHighestID(idName : String) : Integer;
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
    //else Result := FieldByName('MAX(' + idName + ')').AsString.ToInteger();
    else Result := highestID.ToInteger;
  end;
end;



constructor TNodeDatabase.Create(newQuery : TFDQuery; newTable : String);
begin
  inherited Create(newQuery, newTable);
end;

procedure TDatabase.setTable(newTable : String);
begin
  table := newTable;
end;

function TDatabase.getTable : String;
begin
  Result := table;
end;

procedure TNodeDatabase.addNewNode(diagramID : String; nodeID : String;
                                  nodeType : String; nodeDescription : String);
var
  sqlString : String;
begin
  sqlString := 'insert into ' + getTable
                + ' (node_id, wf_type_id, node_type, note_label_de) values ('
                + nodeID + ',' + diagramID + ',"' + nodeType + '","'
                + nodeDescription + '")';
  write(sqlString);
  query.Close;
end;

procedure TNodeDatabase.addNewNode(diagram: TDiagram; node: TStart);
var
  sqlString: String;
begin
//  sqlString := 'insert into ' + getTable
//                + ' (node_id, wf_type_id, node_type) values ('
//                + node.getID.ToString + ',' + diagram.getID.ToString + ',"'
//                + node.getType + '")';
//  write(sqlString);
//  query.Close;
  addNewNode(diagram.getID.ToString, node.getID.ToString, node.getType,
              node.getDescription);
end;

procedure TNodeDatabase.addNewNode(diagram: TDiagram; node: TEnd);
begin
  addNewNode(diagram.getID.ToString, node.getID.ToString, node.getType,
              node.getDescription);
end;

procedure TNodeDatabase.addNewNode(diagram: TDiagram; node: TDecision);
begin
  addNewNode(diagram.getID.ToString, node.getID.ToString, node.getType,
              node.getDescription);
end;

procedure TNodeDatabase.addNewNode(diagram: TDiagram; node: TTask);
begin
  addNewNode(diagram.getID.ToString, node.getID.ToString, node.getType,
              node.getDescription);
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
  Result := getHighestID('node_id');
end;

constructor TEdgeDatabase.Create(newQuery: TFDQuery; newTable : String);
begin
  inherited Create(newQuery, newTable);
end;

function TEdgeDatabase.getHighestEdgeID : Integer;
begin
  Result := getHighestID('wf_edge_id');
end;

procedure TEdgeDatabase.addNewEdge(edge: TEdge);
begin
var
  sqlString: String;
begin
  sqlString := 'insert into ' + getTable + ' (wf_edge_id, node_id) values ('
                + edge.getID.ToString + ',' + edge.getNodeID.ToString + ')';
  write(sqlString);
  query.Close;
end;
end;

procedure TEdgeDatabase.deleteEdge(edgeID: Integer);
var
  sqlString : String;
begin
  sqlString := 'DELETE FROM ' + getTable + ' WHERE wf_edge_id = '
                + edgeID.ToString;
  write(sqlString);
  query.Close;
end;


procedure TEdgeDatabase.addNextNode(edge: TEdge);
var
  sqlString : String;
begin
  sqlString := 'UPDATE ' + getTable + ' SET ' + ' next_node_id = '
                + edge.getNextNodeID.ToString + ' WHERE wf_edge_id ='
                + edge.getID.ToString;
  write(sqlString);
  query.Close;
end;


constructor TDiagramDatabase.Create(newQuery : TFDQuery; newTable : String);
begin
  inherited Create(newQuery, newTable);
end;

procedure TDiagramDatabase.addNewDiagram(diagram: TDiagram);
var
  sqlString: String;
begin
  sqlString := 'insert into ' + getTable
              + ' (wf_type_id, name_en, description_en, class)'
                + 'values (' + diagram.getID.ToString + ',"' + diagram.getName
                + '","' + diagram.getDescription + '","' + diagram.getClassName
                + '")';
  write(sqlString);
  query.Close;
end;

procedure TDiagramDatabase.deleteDiagram(diagram: TDiagram);
var
  sqlString: String;
begin
  sqlString := 'DELETE FROM ' + getTable + ' WHERE wf_type_id = '
                + diagram.getID.ToString;
  write(sqlString);
  query.Close;
end;

procedure TDiagramDatabase.addNewDiagramVersion(diagram: TDiagram);
begin

end;

function TDiagramDatabase.getHighestDiagramID : Integer;
begin
  Result := getHighestID('wf_type_id');
end;

end.
