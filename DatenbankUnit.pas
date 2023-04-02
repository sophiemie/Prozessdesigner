unit DatenbankUnit;

interface

uses
    Data.SqlExpr, Data.DB;

type
  Datenbank = class
  public
    procedure stelleVerbindungHer(SQLDataSet1: TSQLDataSet; SQLConnection1: TSQLConnection);
    function leseDatensatzAus(): String;
    procedure schreibeDatensatz(id: Integer); overload;
    procedure schreibeDatensatz(id: Integer; text: String); overload;
  end;

implementation

procedure Datenbank.stelleVerbindungHer(SQLDataSet1: TSQLDataSet; SQLConnection1: TSQLConnection);
begin
  SQLDataSet1.SQLConnection := SQLConnection1;
  SQLConnection1.Connected := True;
end;

function Datenbank.leseDatensatzAus(): String;
begin

end;

procedure Datenbank.schreibeDatensatz(id: Integer);
begin

end;

procedure Datenbank.schreibeDatensatz(id: Integer; text: String);
begin

end;



end.
