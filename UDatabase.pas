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
    //function read(sqlString: String; query: TFDQuery; edit: TEdit): String;
    procedure read(sqlString: String; query: TFDQuery; edit: TEdit);
    procedure schreibeDatensatz(id: Integer); overload;
    procedure schreibeDatensatz(id: Integer; text: String); overload;
  end;

implementation

//function Database.read(sqlString: String; query: TFDQuery; edit: TEdit): String;
procedure Database.read(sqlString: String; query: TFDQuery; edit: TEdit);
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

  with query do
  begin
    First;
    while not EOF do
    begin
      //AppLabel  := FieldByName('app_label').AsString;
      //FormLabel := FieldByName('form_label').AsString;
      //Listbox1.Items.Add(AppLabel+' - '+FormLabel);
      //Next;
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
