unit UNodeSelection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UDatabase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, Vcl.Imaging.pngimage, Vcl.ExtCtrls, ULanguage;

type
  TNodeSelectionForm = class(TForm)
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    Label1: TLabel;
    Image1: TImage;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FillList(NodeClass: String);
    procedure ListBox1DblClick(Sender: TObject);
    function getSelectedNodeDescription : String;
  private
    { Private-Deklarationen }
    var
      NodeDescription : String;
  public
    { Public-Deklarationen }
  end;

var
  NodeSelectionForm: TNodeSelectionForm;
  Database: TNodeDatabase;

implementation


{$R *.dfm}
function TNodeSelectionForm.getSelectedNodeDescription : String;
begin
  Result := NodeDescription;
end;

procedure TNodeSelectionForm.FormCreate(Sender: TObject);
begin
//  Database := TNodeDatabase.Create(FDQuery1, 'wf_nodes');
//  Database.fillList(ListBox1);
end;


procedure TNodeSelectionForm.ListBox1DblClick(Sender: TObject);
begin
  NodeDescription := Listbox1.Items[Listbox1.ItemIndex];
end;

procedure TNodeSelectionForm.FillList(NodeClass: String);
begin
  ListBox1.Clear;
  if NodeClass.Equals('TEnd') then
  begin
    Image1.Hint := END_HINT_DE;
    GroupBox1.Caption := 'Endnode';
    ListBox1.Items.Add('Standard');
    ListBox1.Items.Add('Abbruch');
  end
  else if NodeClass.Equals('THumanDecision') then
  begin
    Label1.Caption := 'Who should be asked?';
    GroupBox1.Caption := 'Human Decision';
    ListBox1.Items.Add('Supervisor');
    ListBox1.Items.Add('Leader');
    ListBox1.Items.Add('Management');
  end
  else if NodeClass.Equals('TMashineDecision') then
  begin
    Label1.Caption := 'What should be checked?';
    GroupBox1.Caption := 'Mashine Decision';
    ListBox1.Items.Add('Stellungnahme');
    ListBox1.Items.Add('Genügend/Überschneidete Tage');
    ListBox1.Items.Add('Anmeldung');
    ListBox1.Items.Add('Programmbereich');
    ListBox1.Items.Add('Position Antragsteller');
  end
  else if NodeClass.Equals('THumanTask') then
  begin
    Label1.Caption := 'Which Formular should be filled?';
    GroupBox1.Caption := 'Human Task';
    ListBox1.Items.Add('Urlaub');
    ListBox1.Items.Add('Drittmittel');
    ListBox1.Items.Add('MitarbeiterInnen und Gäste');
  end
  else if NodeClass.Equals('TMashineTask') then
  begin
    Label1.Caption := 'Which method should be used?';
    GroupBox1.Caption := 'Mashine Task';
    ListBox1.Items.Add('Generate PDF');
    ListBox1.Items.Add('Send PDF');
    ListBox1.Items.Add('Send Info');
  end;

end;

end.
