unit UStartPage;

interface
// https://stackoverflow.com/questions/39219587/change-start-up-form-in-delphi-10-1-berlin
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, UDiagram, UDesigner,
  Vcl.Grids, Data.DB, Vcl.WinXCtrls, Vcl.DBGrids, ULanguage;

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
    StringGrid1: TStringGrid;  // Fuer Daten aus Datenbank lieber TDBGrid
    Button4: TButton;
    Panel3: TPanel;
    ToggleSwitch1: TToggleSwitch;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ToggleSwitch1Click(Sender: TObject);
    procedure fillComponentText();
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
  Panel2.Caption := loadDiagamText;
end;

procedure TStartPageForm.Button3Click(Sender: TObject);
begin
  if Edit1.Text = '' then ShowMessage('Name can not be emty')
  else
  begin
    DesignerForm.newDiagramName := Edit1.Text;
    DesignerForm.newDiagramDescription := Memo1.Text;
    DesignerForm.ShowModal;
  end;
end;

procedure TStartPageForm.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
  Memo1.Lines.Clear;
  loadDiagamText := STARTPAGELABEL_LOAD_EN;
  createDiagramText := STARTPAGELABEL_CREATE_EN;
  createNewVersion := STARTPAGELABEL_VERSION_EN;
  Panel2.Caption := loadDiagamText;
  Groupbox1.Visible := false;
  Groupbox2.Visible := true;
end;

procedure TStartPageForm.fillComponentText();
begin
  button1.Caption := newButtonText;
  button2.Caption := loadButtonText;
  button3.Caption := createButtonText;
  button4.Caption := newVersionButtonText;
  StartPageForm.Caption := formText;
  label2.Caption := descriptionText;
  Image1.Hint := descriptionHintText;
  Image2.Hint := nameHintText;
  GroupBox2.Caption := allDiagramText;
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
  end;
  fillComponentText();
end;

end.
