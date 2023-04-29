unit UNodeSelection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Data.DB,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, System.Classes,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, Vcl.Imaging.pngimage,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.MySQL, Vcl.Graphics,
  FireDAC.Phys.MySQLDef, ULanguage, UDatabase, UNodes;

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
    procedure Button1Click(Sender: TObject);
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
  Close;
end;

procedure TNodeSelectionForm.Button1Click(Sender: TObject);
begin
  if ListBox1.ItemIndex = -1 then ShowMessage(NO_DESCRIPTIONSELECT_DE)
  else
  begin
    NodeDescription := Listbox1.Items[Listbox1.ItemIndex];
    Close;
  end;
end;

procedure TNodeSelectionForm.FillList(NodeClass: String);
var
  I : Integer;
  Item : TDescription;
begin
  ListBox1.Clear;
  if NodeClass.Equals(TEnd.getClassType) then  // Endknoten
  begin
    Image1.Hint := END_HINT_DE;
    GroupBox1.Caption := 'Endnode';
    ListBox1.Items.Add('Standard');
    ListBox1.Items.Add('Abbruch');

    Item := TEnd.getAllDescription;
    for I := Low(Item) to High(Item) do
      ListBox1.Items.Add(Item[I]);


  end
  else if NodeClass.Equals(THumanDecision.getClassType) then  // HD
  begin
    Label1.Caption := 'Who should be asked?';
    GroupBox1.Caption := 'Human Decision';
    ListBox1.Items.Add('Supervisor');
    ListBox1.Items.Add('Leader');
    ListBox1.Items.Add('Management');
  end
  else if NodeClass.Equals(TMachineDecision.getClassType) then  // MD
  begin
    Label1.Caption := 'What should be checked?';
    GroupBox1.Caption := 'Mashine Decision';
    ListBox1.Items.Add('Stellungnahme');
    ListBox1.Items.Add('Genügend/Überschneidete Tage');
    ListBox1.Items.Add('Anmeldung');
    ListBox1.Items.Add('Programmbereich');
    ListBox1.Items.Add('Position Antragsteller');
  end
  else if NodeClass.Equals(THumanTask.getClassType) then // HT
  begin
    Label1.Caption := 'Which Formular should be filled?';
    GroupBox1.Caption := 'Human Task';
    ListBox1.Items.Add('Urlaub');
    ListBox1.Items.Add('Drittmittel');
    ListBox1.Items.Add('MitarbeiterInnen und Gäste');
    ListBox1.Items.Add('Reiseantrag');
  end
  else if NodeClass.Equals(TMachineTask.getClassType) then // MT
  begin
    Label1.Caption := 'Which method should be used?';
    GroupBox1.Caption := 'Mashine Task';
    ListBox1.Items.Add('Generate PDF');
    ListBox1.Items.Add('Send PDF');
    ListBox1.Items.Add('Send Info');
  end;

end;

end.
