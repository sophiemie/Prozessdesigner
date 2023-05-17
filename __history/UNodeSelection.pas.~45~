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

{ Fuelle Liste mit Eintraegen je nach Knotenart }
procedure TNodeSelectionForm.FillList(NodeClass: String);
var
  I : Integer;
  Item : TDescription;
begin
  ListBox1.Clear;
  if NodeClass.Equals(TEnd.getClassType) then  // Endknoten
  begin
    Label1.Caption := 'Which form should be used?';
    Image1.Hint := END_HINT_DE;
    GroupBox1.Caption := 'Endnode';
    Item := TEnd.getAllDescription;
    for I := Low(Item) to High(Item) do
      ListBox1.Items.Add(Item[I]);
  end
  else if NodeClass.Equals(THumanDecision.getClassType) then  // HD
  begin
    Label1.Caption := 'Who should be asked?';
    GroupBox1.Caption := 'Human Decision';
    Item := THumanDecision.getAllDescription;
    for I := Low(Item) to High(Item) do
      ListBox1.Items.Add(Item[I]);
  end
  else if NodeClass.Equals(TMachineDecision.getClassType) then  // MD
  begin
    Label1.Caption := 'What should be checked?';
    GroupBox1.Caption := 'Mashine Decision';
    Item := TMachineDecision.getAllDescription;
    for I := Low(Item) to High(Item) do
      ListBox1.Items.Add(Item[I]);
  end
  else if NodeClass.Equals(THumanTask.getClassType) then // HT
  begin
    Label1.Caption := 'Which Formular should be filled?';
    GroupBox1.Caption := 'Human Task';
    Item := THumanTask.getAllDescription;
    for I := Low(Item) to High(Item) do
      ListBox1.Items.Add(Item[I]);
  end
  else if NodeClass.Equals(TMachineTask.getClassType) then // MT
  begin
    Label1.Caption := 'Which method should be used?';
    GroupBox1.Caption := 'Mashine Task';
    Item := TMachineTask.getAllDescription;
    for I := Low(Item) to High(Item) do
      ListBox1.Items.Add(Item[I]);
  end;

end;

end.
