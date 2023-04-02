unit Designer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.SqlExpr, Data.DB,
  Vcl.StdCtrls, DatenbankUnit;  // Datenbank.pas einbinden

type
  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
    Button1: TButton;
    datenBank1: Datenbank;
    SQLDataSet1: TSQLDataSet; // Fehlermeldung: Keine entsprechende Komponente?
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// Datenbank Verbindung herstellen
procedure TForm1.Button1Click(Sender: TObject);
begin
  datenBank1.stelleVerbindungHer(SQLDataSet1, SQLConnection1);
end;

end.
