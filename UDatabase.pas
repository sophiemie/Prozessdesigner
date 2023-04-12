unit UDatabase;

interface

uses
    Data.SqlExpr,
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
    FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
    FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
    FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
    FireDAC.Comp.DataSet, Vcl.StdCtrls;

type
  TDatabaseTypes = (main, forms, wf, wfTest); // enum
  TDatabase = class
  public
    //function read(sqlString: String; query: TFDQuery; edit: TEdit): String;
    constructor Create(query: TFDQuery);
    //constructor Create; overload;
    function read(sqlString: String): String;
    procedure schreibeDatensatz(query: TFDQuery); overload;
    procedure schreibeDatensatz(id: Integer; text: String); overload;
    procedure fuelleListeMitDatensatz(query: TFDQuery; list: TListBox);
    function gebAnzahlDatensaetze(query: TFDQuery; tabelle: String): Integer;
  private
    //query: TFDQuery;
    procedure stelleVerbindungHer(query: TFDQuery; sqlString: String);
  end;


implementation

uses Designer;
// Beim Instanzieren soll die Datenbank Komponente zugewiesen werden
constructor TDatabase.Create(query: TFDQuery);
begin
  inherited Create();
  //query := databaseQuery;
  //databaseQuery.CloneCursor(query, True, False);
end;

procedure TDatabase.stelleVerbindungHer(query: TFDQuery; sqlString: String);
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

//function Database.read(sqlString: String; edit: TEdit): String;
function TDatabase.read(sqlString: String): String;
begin

  //stelleVerbindungHer(sqlString);

//  with FDQuery_wf do
//  begin
//    First;
//    while not EOF do
//    begin
//      Result := FieldByName(sqlString).AsString;
//      //AppLabel  := FieldByName('app_label').AsString;
//      //FormLabel := FieldByName('form_label').AsString;
//      //Listbox1.Items.Add(AppLabel+' - '+FormLabel);
//      Next;
//    end;
//  end;
end;

procedure TDatabase.schreibeDatensatz(query: TFDQuery);
begin
  stelleVerbindungHer(query, 'insert into wf_nodes (node_id) values (1)');
  query.Close;
end;

procedure TDatabase.schreibeDatensatz(id: Integer; text: String);
begin

end;

function TDatabase.gebAnzahlDatensaetze(query: TFDQuery; tabelle: String): Integer;
begin
  stelleVerbindungHer(query, 'select count(*) from ' + tabelle);

  with query do
  begin
    Result := FieldByName('count(*)').AsString.ToInteger();
  end;
end;

procedure TDatabase.fuelleListeMitDatensatz(query: TFDQuery; list: TListBox);
begin
  stelleVerbindungHer(query, 'select * from wf_def');

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

end.
