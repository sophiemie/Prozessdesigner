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
    constructor Create();
    //constructor Create; overload;
    procedure schreibeDatensatz(query: TFDQuery; id: Integer); overload;
    procedure schreibeDatensatz(id: Integer; text: String); overload;
    procedure fuelleListeMitDatensatz(query: TFDQuery; list: TListBox);
    function gebAnzahlDatensaetze(query: TFDQuery; tabelle: String): Integer;
  private
    //query: TFDQuery;
    procedure read(query: TFDQuery; sqlString: String);
    procedure write(query: TFDQuery; sqlString: String);
  end;

  TNodeDatabase = class(TDatabase)
  public
    //constructor Create;
    procedure addNewNode(query: TFDQuery; diagramID: Integer; nodeType: String);
  private
    table : String;
    nodeCount : Integer;
  end;

implementation

uses Designer;
// Beim Instanzieren soll die Datenbank Komponente zugewiesen werden
constructor TDatabase.Create();
begin
  inherited Create();
  //query := databaseQuery;
  //databaseQuery.CloneCursor(query, True, False);
end;

procedure TDatabase.read(query: TFDQuery; sqlString: String);
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

procedure TDatabase.write(query: TFDQuery; sqlString: String);
begin
try
  query.SQL.Clear;
  query.SQL.Add(sqlString);
  query.ExecSQL;
  except on E: EFDDBEngineException do
    ShowMessage(E.Message);
end;

end;

//function Database.read(sqlString: String; edit: TEdit): String;

procedure TDatabase.schreibeDatensatz(query: TFDQuery; id: Integer);
begin
  write(query, 'insert into wf_nodes (node_id) values ('+ id.ToString + ')');
  query.Close;
end;



procedure TDatabase.schreibeDatensatz(id: Integer; text: String);
begin

end;

function TDatabase.gebAnzahlDatensaetze(query: TFDQuery; tabelle: String): Integer;
begin
  read(query, 'select count(*) from ' + tabelle);

  with query do
  begin
    Result := FieldByName('count(*)').AsString.ToInteger();
  end;
end;

procedure TDatabase.fuelleListeMitDatensatz(query: TFDQuery; list: TListBox);
begin
  read(query, 'select * from wf_def');

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


//constructor TNodeDatabase.Create();
//begin
//  inherited Create();
//  //table := nodeTable;
//end;

procedure TNodeDatabase.addNewNode(query: TFDQuery; diagramID: Integer; nodeType: String);
var
  newNodeID: Integer;
  sqlString: String;
begin
  newNodeID := gebAnzahlDatensaetze(query, 'wf_nodes') + 1;
  //table := '';   // TABLE IST DAS PROBLEM?
  //sqlString := 'insert into wf_nodes (node_id) values ('+ newNodeID.ToString + ')';
  //sqlString := 'insert into wf_nodes' + table + ' (node_id, wf_type_id, node_type) values ('
              //+ newNodeID.ToString + ',' + diagramID.ToString + ',"' + nodeType + '")';
  write(query, 'insert into wf_nodes (node_id, wf_type_id, node_type) values ('
            + newNodeID.ToString + ',' + diagramID.ToString + ',"' + nodeType + '")');
  query.Close;
end;

end.