{
  Bachelorthesis ueber die Entwicklung einer grafischen Oberflaeche zur
  Erstellung von Workflows am ZMT (Leibniz-Zentrum fuer Marine Tropenforschung)
  Duales Studium Informatik, Hochschule Bremen
  Sophie Miessner 5046830, 2023

  Unit UDatabase: In der Unit sind die Klassen TDatabase, TNodeDatabase,
  TEdgeDatabase sowie TDiagramDatabase enthalten.
}
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
    UNodes, UEdge, Vcl.Grids;

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
  protected
    var query: TFDQuery;
    var table : String;
    procedure read(sqlString: String);
    procedure write(sqlString: String);
  end;

  { Klasse fuer die Datenzugriffe von Knoten }
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
                          nodeDescription : String; classType : String); overload;
  end;

  { Klasse fuer die Datenzugriffe von Kanten }
  TEdgeDatabase = class(TDatabase)
  public
    constructor Create(newQuery : TFDQuery; newTable : String);
    function getHighestEdgeID : Integer;
    procedure addNewEdge(edge: TEdge);
    procedure addNextNode(edge: TEdge);
    procedure deleteEdge(edgeID: Integer);
  end;

  { Klasse fuer die Datenzugriffe von Diagrammen }
  TDiagramDatabase = class(TDatabase)
  public
    constructor Create(newQuery : TFDQuery; newTable : String);
    procedure addNewDiagram(diagram: TDiagram);
    procedure deleteDiagram(diagram: TDiagram);
    function getHighestDiagramID : Integer;
    function giveDiagramSavedDatas(diagram: TDiagram) : TDiagram;
    function copyDiagram(diagram: TDiagram) : TDiagram;
  end;

implementation

{ Konstruktor der Klasse TDatabase}
constructor TDatabase.Create(newQuery : TFDQuery; newTable: String);
begin
  inherited Create();
  query := newQuery;
  table := newTable;
end;

{ Datensatz schreiben }
procedure TDatabase.read(sqlString: String);
begin
  try
    query.SQL.Clear;
    query.SQL.Add(sqlString);
    query.Active := True;
    query.Active := False;
    query.Open;
    except on e: Exception do ShowMessage(e.Message);
  end;
end;

{ Datensatz auslesen }
procedure TDatabase.write(sqlString: String);
begin
  try
    query.SQL.Clear;
    query.SQL.Add(sqlString);
    query.ExecSQL;
    except on E: EFDDBEngineException do ShowMessage(E.Message);
  end;
  query.Close;
end;

{ Anzahl der Datensaetze auswerten }
function TDatabase.getDataCount(): Integer;
begin
  read('select count(*) from ' + table);

  with query do
  begin
    Result := FieldByName('count(*)').AsString.ToInteger();
  end;
end;

{ Hoechste ID einer Tabelle ermitteln }
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
    else Result := highestID.ToInteger;
  end;
end;

{ Liste mit Namenseintraege fuellen }
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

{ Getter- und Setter }
procedure TDatabase.setTable(newTable : String);
begin
  table := newTable;
end;

function TDatabase.getTable : String;
begin
  Result := table;
end;

{ Konstruktor der fuer die Verwaltung der Knoteneintraege }
constructor TNodeDatabase.Create(newQuery : TFDQuery; newTable : String);
begin
  inherited Create(newQuery, newTable);
end;

{ Traegt neuen Knoten in die Datenbank ein }
procedure TNodeDatabase.addNewNode(diagramID : String; nodeID : String;
              nodeType : String; nodeDescription : String; classType : String);
var
  sqlString : String;
begin
//  sqlString := 'insert into ' + getTable
//                + ' (node_id, wf_type_id, node_type, note_label_de) values ('
//                + nodeID + ',' + diagramID + ',"' + nodeType + '","'
//                + nodeDescription + '")';
//  write(sqlString);
  sqlString := 'INSERT INTO ' + getTable
    + ' (node_id, wf_type_id, node_type, note_label_de, label_de, label_en,' +
    'explanation_de, explanation_en, note_en) VALUES (' + nodeID + ',' + diagramID + ',"'
    + classType + '","' + nodeDescription + '","' + nodeType + '","' + nodeType
    + '","' + nodeDescription + '","' + nodeDescription + '","' + nodeDescription +'")';
  write(sqlString);
end;

{ Neuen Startknoten eintragen}
procedure TNodeDatabase.addNewNode(diagram: TDiagram; node: TStart);
var
  sqlString: String;
begin
  node.setDescription('Start');
  addNewNode(diagram.getID.ToString, node.getID.ToString, node.getType,
              node.getDescription, node.getClassName);
end;

{ Neuen Endknoten eintragen}
procedure TNodeDatabase.addNewNode(diagram: TDiagram; node: TEnd);
begin
  addNewNode(diagram.getID.ToString, node.getID.ToString, node.getType,
              node.getDescription, node.getClassName);
end;

{ Neuen Entscheidungsknoten eintragen}
procedure TNodeDatabase.addNewNode(diagram: TDiagram; node: TDecision);
begin
  addNewNode(diagram.getID.ToString, node.getID.ToString, node.getType,
              node.getDescription, node.getClassName);
end;

{ Neuen Aufgabenknoten eintragen}
procedure TNodeDatabase.addNewNode(diagram: TDiagram; node: TTask);
begin
  addNewNode(diagram.getID.ToString, node.getID.ToString, node.getType,
              node.getDescription, node.getClassName);
end;

{ Einen Knoten aus der Datenbank entfernen }
procedure TNodeDatabase.deleteNode(nodeID: Integer);
var
  sqlString : String;
begin
  sqlString := 'DELETE FROM ' + getTable + ' WHERE node_id = ' + nodeID.ToString;
  write(sqlString);
end;

{ Hoechste Knoten-ID ermitteln }
function TNodeDatabase.getHighestNodeID : Integer;
begin
  Result := getHighestID('node_id');
end;

{ Konstruktor der fuer die Verwaltung der Kanteneintraege }
constructor TEdgeDatabase.Create(newQuery: TFDQuery; newTable : String);
begin
  inherited Create(newQuery, newTable);
end;

{ Hoechste Kanten-ID ermitteln }
function TEdgeDatabase.getHighestEdgeID : Integer;
begin
  Result := getHighestID('wf_edge_id');
end;

{ Neue Kante in Datenbank eintragen }
procedure TEdgeDatabase.addNewEdge(edge: TEdge);
begin
var
  sqlString: String;
begin
  sqlString := 'insert into ' + getTable + ' (wf_edge_id, node_id) values ('
                + edge.getID.ToString + ',' + edge.getNodeID.ToString + ')';
  write(sqlString);
end;
end;

{ Eintrag einer Kante aus Datenbank entfernen }
procedure TEdgeDatabase.deleteEdge(edgeID: Integer);
var
  sqlString : String;
begin
  sqlString := 'DELETE FROM ' + getTable + ' WHERE wf_edge_id = '
                + edgeID.ToString;
  write(sqlString);
end;

{ Zielknoten einer Kante eintragen }
procedure TEdgeDatabase.addNextNode(edge: TEdge);
var
  sqlString : String;
begin
  sqlString := 'UPDATE ' + getTable + ' SET ' + ' next_node_id = '
                + edge.getNextNodeID.ToString + ' WHERE wf_edge_id ='
                + edge.getID.ToString;
  write(sqlString);
end;

{ Konstruktor der fuer die Verwaltung der Diagrammeintraege }
constructor TDiagramDatabase.Create(newQuery : TFDQuery; newTable : String);
begin
  inherited Create(newQuery, newTable);
end;

{ Neues Diagramm in Datenbank eintragen}
procedure TDiagramDatabase.addNewDiagram(diagram: TDiagram);
var
  sqlString: String;
begin
  sqlString := 'insert into ' + getTable
              + ' (wf_type_id, name_en, description_en, class, name_de)'
                + 'values (' + diagram.getID.ToString + ',"' + diagram.getName
                + '","' + diagram.getDescription + '","' + diagram.getClassName
                + '","'+ diagram.getVersionNumber.ToString + '")';
  write(sqlString);
end;

{ Eintrag eines Diagrammes aus Datenbank entfernen }
procedure TDiagramDatabase.deleteDiagram(diagram: TDiagram);
var
  sqlString: String;
begin
  sqlString := 'DELETE FROM ' + getTable + ' WHERE wf_type_id = '
                + diagram.getID.ToString;
  write(sqlString);
end;

{ Hoechste Diagramm-ID ermitteln }
function TDiagramDatabase.getHighestDiagramID : Integer;
begin
  Result := getHighestID('wf_type_id');
end;

{ Diagramm aus Datenbank ermitteln und Daten ergaenzen }
function TDiagramDatabase.giveDiagramSavedDatas(diagram: TDiagram) : TDiagram;
var
  currentID : String;
  id : Integer;
begin
  currentID := diagram.getID.ToString;
  read('select * from '+ table +' where wf_type_id =' + currentID);

  with query do
  begin
    currentID := FieldByName('name_en').AsString;
    if currentID.IsEmpty then
    begin
      diagram.setID(0); // Ungueltige ID eintragen wenn nicht vorhanden
    end
    else
    begin
      diagram.setID(FieldByName('wf_type_id').AsString.ToInteger);
      diagram.setName(FieldByName('name_en').AsString);
      diagram.setDescription(FieldByName('description_en').AsString);
      // Versionnummer voruebergehend in Name_de
      diagram.setVersionNumber(FieldByName('name_de').AsString.ToInteger);
      //diagram.setInUse(FieldByName('in_use').AsBoolean);
    end;
    Result := diagram;
  end;
end;

{ Bestehendes Diagramm kopieren und neu eintragen }
function TDiagramDatabase.copyDiagram(diagram: TDiagram) : TDiagram;
var
  sqlString : String;
  newID, newVersion : Integer;
begin
  newID := getHighestDiagramID  +1;
  newVersion := diagram.getVersionNumber +1;
  // INSERT INTO wf_def(name_en) SELECT (name_en) FROM wf_def WHERE wf_type_id = 3
//  sqlString := 'INSERT INTO ' + table +'(name_en) SELECT (name_en) FROM ' +
//    table + ' WHERE wf_type_id =' +diagram.getID.ToString;

  // INSERT INTO wfdef(wf_type_id, name_en) VALUES (2, name)
  sqlString := 'INSERT INTO ' + table +'(wf_type_id, name_en, name_de) VALUES ('
                + newID.ToString + ',"' + diagram.getName + '","' + newVersion.ToString + '")';

  write(sqlString);
  sqlString := 'UPDATE ' + table + ' SET wf_type_id =' + newID.ToString +
    ', description_en ="' + diagram.getDescription + '"' + ' WHERE name_en = "' +
    diagram.getName + '" AND name_de =' + newVersion.ToString ;
  write(sqlString);
  diagram.setID(newID);
  diagram.setVersionNumber(diagram.getVersionNumber +1);
  Result := diagram;
end;

end.
