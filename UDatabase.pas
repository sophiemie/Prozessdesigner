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
    constructor Create(newQuery : TFDQuery);
    //constructor Create; overload;
    procedure schreibeDatensatz(query: TFDQuery; id: Integer); overload;
    procedure schreibeDatensatz(id: Integer; text: String); overload;
    procedure fuelleListeMitDatensatz(query: TFDQuery; list: TListBox);
    function gebAnzahlDatensaetze(query: TFDQuery; tabelle: String): Integer; overload;
    function gebAnzahlDatensaetze(tabelle: String): Integer; overload;
  private
    class var query: TFDQuery;
    procedure read(query: TFDQuery; sqlString: String);
    procedure write(query: TFDQuery; sqlString: String);
  end;

  TNodeDatabase = class(TDatabase)
  public
    constructor Create(newQuery : TFDQuery);
    procedure addNewNode(diagramID: Integer; nodeType: String);
    procedure setTable(newTable : String);
    function getTable : String;
  private
    // Ohne class = Zugriffsverletzung
    class var table : String; // https://de.wikibooks.org/wiki/Programmierkurs:_Delphi:_Pascal:_Zugriff_auf_Klassen
  end;

implementation

constructor TDatabase.Create(newQuery : TFDQuery);
begin
  inherited Create();
  query := newQuery;
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

function TDatabase.gebAnzahlDatensaetze(tabelle: String): Integer;
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


constructor TNodeDatabase.Create(newQuery : TFDQuery);
begin
  inherited Create(newQuery);
  table := 'wf_nodes';
  //query := newQuery;
end;

procedure TNodeDatabase.setTable(newTable : String);
begin
  table := newTable;
end;

function TNodeDatabase.getTable : String;
begin
  Result := table;
end;

procedure TNodeDatabase.addNewNode(diagramID: Integer; nodeType: String);
var
  newNodeID: Integer;
  sqlString: String;
begin
  //table := 'wf_nodes';
  newNodeID := gebAnzahlDatensaetze(query, getTable()) + 1;
  //newNodeID := gebAnzahlDatensaetze(getTable()) + 1;  // TEST

  sqlString := 'insert into ' + getTable + ' (node_id, wf_type_id, node_type) values (' + newNodeID.ToString + ',' + diagramID.ToString + ',"' + nodeType + '")';
  write(query, sqlString);
  query.Close;
end;



end.
