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
  Database = class
  public
    procedure stelleVerbindungHer(dataSet: TSQLDataSet; connection: TSQLConnection);
    function read(sqlString: String; query: TFDQuery): String;
    procedure schreibeDatensatz(id: Integer); overload;
    procedure schreibeDatensatz(id: Integer; text: String); overload;
  end;

implementation

procedure Database.stelleVerbindungHer(dataSet: TSQLDataSet;
connection: TSQLConnection);
begin
  dataSet.SQLConnection := connection;
  connection.Connected := True;
end;

function Database.read(sqlString: String; query: TFDQuery): String;
begin
  try
    query.Active := False;
    query.SQL.Clear;
    query.SQL.Add(sqlString);
    query.Open;
    except on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

procedure Database.schreibeDatensatz(id: Integer);
begin

end;

procedure Database.schreibeDatensatz(id: Integer; text: String);
begin

end;



end.
