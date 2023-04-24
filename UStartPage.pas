unit UStartPage;

interface
// https://stackoverflow.com/questions/39219587/change-start-up-form-in-delphi-10-1-berlin
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, UDiagram, UDesigner,
  Vcl.Grids, Data.DB, Vcl.WinXCtrls, Vcl.DBGrids, ULanguage, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet, UDatabase;

type
  TStartPageForm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    Memo1: TMemo;
    Image2: TImage;
    Image1: TImage;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    Panel3: TPanel;
    ToggleSwitch1: TToggleSwitch;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    Image3: TImage;
    Edit2: TEdit;
    Button5: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ToggleSwitch1Click(Sender: TObject);
    procedure fillComponentText();
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button4Click(Sender: TObject);
  private
    { Private-Deklarationen }
    newButtonText : String;
    loadButtonText : String;
    newVersionButtonText : String;
    formText : String;
    descriptionText : String;
    descriptionHintText : String;
    nameHintText : String;
    createDiagramText : String;
    loadDiagamText : String;
    allDiagramText : String;
    createButtonText : String;
    createNewVersion : String;
    noDiagramName : String;
    activeText : String;
    diagramDatabase : TDiagramDatabase;
    openButton : String;
  public
    { Public-Deklarationen }
  end;

var
  StartPageForm: TStartPageForm;

implementation

{$R *.dfm}

procedure TStartPageForm.Button1Click(Sender: TObject);
begin
  Groupbox1.Visible := true;
  Groupbox2.Visible := false;
  Panel2.Caption := createDiagramText;
end;

procedure TStartPageForm.Button2Click(Sender: TObject);
begin
  Groupbox1.Visible := false;
  Groupbox2.Visible := true;
//  Groupbox3.Visible := false;
  Panel2.Caption := loadDiagamText;
end;

procedure TStartPageForm.Button3Click(Sender: TObject);
var
  newDiagramID : Integer;
begin
  if Edit1.Text = '' then ShowMessage(noDiagramName)
  else
  begin
    { Alle Diagramme aus Datenbank laden }
    //diagramDatabase.fillLoadlistWithDiagrams(StringGrid1);
    DesignerForm.newDiagramName := Edit1.Text;
    DesignerForm.newDiagramDescription := Memo1.Text;

    { Neues Diagramm erstellen }
    newDiagramID := StringGrid1.RowCount;
    DesignerForm.IsLoadedDiagram := false;
    DesignerForm.diagram := TDiagram.Create(newDiagramID, Edit1.Text, Memo1.Text);

    { Neues Diagramm in Datenbank eintragen }
    //DiagramDatabase.addNewDiagram(diagram);

    DesignerForm.ShowModal;
    { Textfelder vom Erstellen leeren }
    Edit1.Clear;
    Memo1.Clear;
    { Ladeliste um neuen Diagramm ergaenzen }
    StringGrid1.RowCount := StringGrid1.RowCount +1;
    StringGrid1.Cells[0,StringGrid1.RowCount-1] := (StringGrid1.RowCount -1).ToString;
    StringGrid1.Cells[1,StringGrid1.RowCount-1] := DesignerForm.newDiagramName;
    StringGrid1.Cells[2,StringGrid1.RowCount-1] := DesignerForm.newDiagramDescription;
  end;
end;

procedure TStartPageForm.Button4Click(Sender: TObject);
begin
//  Groupbox1.Visible := false;
//  Groupbox2.Visible := false;
//  Groupbox3.Visible := true;
//  Panel2.Caption := createNewVersion;

  {Diagramm in Datenbank kopieren}
  //diagramDatabase.copyDiagram();
end;

procedure TStartPageForm.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
  Memo1.Lines.Clear;
  loadDiagamText := STARTPAGELABEL_LOAD_EN;
  createDiagramText := STARTPAGELABEL_CREATE_EN;
  createNewVersion := STARTPAGELABEL_VERSION_EN;
  noDiagramName := NODIAGRAM_NAME_EN;
  descriptionText := DESCRIPTION_EN;
  activeText := ACTIVE_EN;
  Panel2.Caption := loadDiagamText;
  Groupbox1.Visible := false;
  Groupbox2.Visible := true;
//  Groupbox3.Visible := false;
  diagramDatabase := TDiagramDatabase.Create(FDQuery1,'wf_def');

  StringGrid1.Cells[0,0] := 'ID';
  StringGrid1.Cells[1,0] := 'Name';
  StringGrid1.Cells[3,0] := 'Version';
  StringGrid1.Cells[2,0] := descriptionText;
  StringGrid1.Cells[4,0] := activeText;
  Stringgrid1.ColWidths[0] := 35;
  Stringgrid1.ColWidths[3] := 100;
  Stringgrid1.ColWidths[4] := 80;
  Stringgrid1.ColWidths[1] := 157;
  Stringgrid1.ColWidths[2] := 280;
end;

procedure TStartPageForm.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  diagramName : String;
  diagramID : Integer;
  diagramDescription : String;
begin
  if not StringGrid1.Cells[ACol,ARow].IsEmpty then
  begin
    diagramID := StringGrid1.Cells[0,ARow].ToInteger;
    diagramName := StringGrid1.Cells[1,ARow];
    diagramDescription := StringGrid1.Cells[2,ARow];
//    diagramInUse := StringGrid1.Cells[4,ARow].ToBoolean();
//    diagramVersion := StringGrid1.Cells[3,ARow].ToInteger();

    DesignerForm.IsLoadedDiagram := true;
    DesignerForm.LoadedDiagramFileName := 'Diagramme/' + diagramID.ToString
                                              + '_' + diagramName + '.blox';
    DesignerForm.diagram := TDiagram.Create(diagramID, diagramName, diagramDescription);
    DesignerForm.ShowModal;
  end;
end;

procedure TStartPageForm.fillComponentText();
begin
  button1.Caption := newButtonText;
  button2.Caption := loadButtonText;
  button3.Caption := createButtonText;
  button4.Caption := newVersionButtonText;
  button5.Caption := openButton;
  StartPageForm.Caption := formText;
  label2.Caption := descriptionText;
  Image1.Hint := descriptionHintText;
  Image2.Hint := nameHintText;
  GroupBox2.Caption := allDiagramText;
//  GroupBox3.Caption := allDiagramText;
  StringGrid1.Cells[2,0] := descriptionText;
  StringGrid1.Cells[4,0] := activeText;

  if GroupBox2.Visible then Panel2.Caption := loadDiagamText
  else if GroupBox1.Visible then Panel2.Caption := createDiagramText;
//  else if GroupBox3.Visible then Panel2.Caption := createNewVersion;

end;

procedure TStartPageForm.ToggleSwitch1Click(Sender: TObject);
begin


  if ToggleSwitch1.State = tssOff then
  begin
    newButtonText := NEW_EN;
    loadButtonText := LOAD_EN;
    newVersionButtonText := NEWVERSION_EN;
    formText := PROCESSDESIGNER_EN;
    descriptionText := DESCRIPTION_EN;
    descriptionHintText := DESCRIPTION_HINT_EN;
    nameHintText := NAME_HINT_EN;
    createDiagramText := STARTPAGELABEL_CREATE_EN;
    loadDiagamText := STARTPAGELABEL_LOAD_EN;
    allDiagramText := ALLDIAGRAM_EN;
    createButtonText := CREATE_EN;
    createNewVersion := STARTPAGELABEL_VERSION_EN;
    noDiagramName := NODIAGRAM_NAME_EN;
    activeText := ACTIVE_EN;
    openButton := OPEN_EN;
  end
  else {Ansonsten Deutsches Sprachpaket}
  begin
    newButtonText := NEW_DE;
    loadButtonText := LOAD_DE;
    newVersionButtonText := NEWVERSION_DE;
    formText := PROCESSDESIGNER_DE;
    descriptionText := DESCRIPTION_DE;
    descriptionHintText := DESCRIPTION_HINT_DE;
    nameHintText := NAME_HINT_DE;
    createDiagramText := STARTPAGELABEL_CREATE_DE;
    loadDiagamText := STARTPAGELABEL_LOAD_DE;
    allDiagramText := ALLDIAGRAM_DE;
    createButtonText := CREATE_DE;
    createNewVersion := STARTPAGELABEL_VERSION_DE;
    noDiagramName := NODIAGRAM_NAME_DE;
    activeText := ACTIVE_DE;
    openButton := OPEN_DE;
  end;
  fillComponentText();
end;

end.
