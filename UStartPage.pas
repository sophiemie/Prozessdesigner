{
  Bachelorthesis ueber die Entwicklung einer grafischen Oberflaeche zur
  Erstellung von Workflows am ZMT (Leibniz-Zentrum fuer Marine Tropenforschung)
  Duales Studium Informatik, Hochschule Bremen
  Sophie Miessner 5046830, 2023

  Unit UStartPage: Formular fuer die Startseite
}
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
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet, UDatabase,
  UDiagramController, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, UFormController,
  UDiagramEditor;

type
  TStartPageForm = class(TForm)
    Panel1: TPanel;
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
    ToggleSwitch1: TToggleSwitch;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    Image3: TImage;
    Edit2: TEdit;
    Button5: TButton;
    Button4: TButton;
    Button1: TButton;
    Button2: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ToggleSwitch1Click(Sender: TObject);
    procedure fillComponentText();
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CreateOneMoreDiagramEntry(newDiagram : TDiagram);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure updateTable;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  public
    procedure ClickMe(Sender: TObject);
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
    createNewVersionText : String;
    noDiagramNameText : String;
    activeText : String;
    diagramDatabase : TDiagramDatabase;
    openButtonText : String;
    diagramSelected : boolean;
    noDiagramSelected : String;
    yes : String;
    no : String;
    //ButtonList: TStringList;
    //openButton: array of TButton;
  public
    { Public-Deklarationen }
  end;

var
  StartPageForm: TStartPageForm;

implementation

{$R *.dfm}
{Ansicht Neues Diagramm}
procedure TStartPageForm.Button1Click(Sender: TObject);
begin
  Groupbox1.Visible := true;
  Groupbox2.Visible := false;
  Panel2.Caption := createDiagramText;
end;
{Ansicht Diagramm laden}
procedure TStartPageForm.Button2Click(Sender: TObject);
begin
  Groupbox1.Visible := false;
  Groupbox2.Visible := true;
  Panel2.Caption := loadDiagamText;
end;

{ Diagrammeintrag hinzufuegen ohne Datenbankanbindung }
procedure TStartPageForm.CreateOneMoreDiagramEntry(newDiagram : TDiagram);
begin
  StringGrid1.RowCount := StringGrid1.RowCount +1;
  StringGrid1.Cells[0,StringGrid1.RowCount-1] := (StringGrid1.RowCount -1).ToString;
  StringGrid1.Cells[1,StringGrid1.RowCount-1] := newDiagram.getGermanName;
  StringGrid1.Cells[2,StringGrid1.RowCount-1] := newDiagram.getGermanDescription;
  StringGrid1.Cells[3,StringGrid1.RowCount-1] := newDiagram.getVersionNumber.ToString;
end;

{ Neues Diagramm erstellen }
procedure TStartPageForm.Button3Click(Sender: TObject);
var
  newDiagramDescription : String;
begin
  if Edit1.Text = '' then ShowMessage(noDiagramNameText)
  else
  begin
    { Alle Diagramme aus Datenbank laden }
    //diagramDatabase.fillLoadlistWithDiagrams(StringGrid1);

    { Neues Diagramm erstellen }
    DesignerForm.IsLoadedDiagram := false;
    if Memo1.Text = '' then  newDiagramDescription := ''
    else newDiagramDescription := Memo1.Text;

    DesignerForm.diagram := TDiagram.Create(TDiagramController.getNewID(diagramDatabase),
      Edit1.Text, newDiagramDescription);
    DesignerForm.diagram.setVersionNumber(1);

    { Neues Diagramm in Datenbank eintragen }
    DiagramDatabase.addNewDiagram(DesignerForm.diagram);
    DesignerForm.ShowModal;
    { Textfelder vom Erstellen leeren }
    Edit1.Clear;
    Memo1.Clear;

    { Umwandlung von Boolean zu String zeigt Zahl an, deswegen umkonvertieren }
    if DesignerForm.diagram.getInUse then
      StringGrid1.Cells[4,StringGrid1.RowCount-1] := yes
    else StringGrid1.Cells[4,StringGrid1.RowCount-1] := no;
  end;
  TDiagramController.fillLoadingList(StringGrid1, diagramDatabase);
end;

{ Neue Version eines Diagrammes erstellen }
procedure TStartPageForm.Button4Click(Sender: TObject);
var
  diagramCopy : TDiagram;
begin
  if diagramSelected then
  begin
    diagramCopy := TDiagram.Create(StringGrid1.RowCount,
      DesignerForm.diagram.getGermanName, DesignerForm.diagram.getGermanDescription);
    diagramCopy.setVersionNumber(DesignerForm.diagram.getVersionNumber+1);

    {Diagramm in Datenbank kopieren}
    diagramCopy := diagramDatabase.copyDiagram(DesignerForm.diagram);
    DesignerForm.diagram := diagramCopy;
    DesignerForm.IsLoadedDiagram := true;
    DesignerForm.diagramIsSaved := false;
    DesignerForm.ShowModal

    { Alle Diagramme aus Datenbank laden }
    //diagramDatabase.fillLoadlistWithDiagrams(StringGrid1);
  end
  else ShowMessage(noDiagramSelected);
  TDiagramController.fillLoadingList(StringGrid1, diagramDatabase);
end;

{ Diagramm oeffnen }
procedure TStartPageForm.Button5Click(Sender: TObject);
begin
  if diagramSelected then DesignerForm.ShowModal
  else ShowMessage(noDiagramSelected);
end;

procedure TStartPageForm.Button6Click(Sender: TObject);
begin
  // GEWAEHLTE REIHE IN DIAGRAM-EDITOR LADEN (wie kann ich Reihe bestimmen?)
{  DiagramEditorForm.NewDiagram := TDiagramController.selectDiagramFromList
      (StringGrid1, DesignerForm.diagram, ARow, diagramDatabase); }
  if diagramSelected then DiagramEditorForm.ShowModal
  else ShowMessage(noDiagramSelected);
end;

//procedure TStartPageForm.Button6Click(Sender: TObject);
//begin
//  Edit3.Text := (Screen.PixelsPerInch*100 div 96).ToString; // Fuer die Skalierung bei verschiedenen Rechnern
//end; // Loaded


procedure TStartPageForm.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
  Memo1.Lines.Clear;
  loadDiagamText := STARTPAGELABEL_LOAD_EN;
  createDiagramText := STARTPAGELABEL_CREATE_EN;
  createNewVersionText := STARTPAGELABEL_VERSION_EN;
  noDiagramNameText := NODIAGRAM_NAME_EN;
  descriptionText := DESCRIPTION_EN;
  activeText := ACTIVE_EN;
  yes := YES_EN;
  no := NO_EN;
  Panel2.Caption := loadDiagamText;
  Groupbox1.Visible := false;
  Groupbox2.Visible := true;
  diagramSelected := false; // Zu Beginn ist kein Diagramm ausgewaehlt
  diagramDatabase := TDiagramDatabase.Create(FDQuery1,'wf_def');

  // Initialisierung von Konstanten Werten
  TFormController.initStartPageTable(StringGrid1);
  // Weitere Tabelleninitialisierungen die abh�ngig von Variablen sind
  StringGrid1.Cells[2,0] := descriptionText;
  StringGrid1.Cells[4,0] := activeText;

  //updateTable;  // <---- FUEHRT ZUM ABSTURZ BEIM SCHLIESSEN


  // Ohne Anbindung der Datenbank
  //TDiagramController.fillLoadingList(StringGrid1);
end;

procedure TStartPageForm.FormResize(Sender: TObject);
begin
  TFormController.changeWindowSize(StartPageForm, Panel1, Panel2, GroupBox1,
      GroupBox2, StringGrid1, ToggleSwitch1, Edit2);
end;


procedure TStartPageForm.ClickMe(Sender: TObject);
var
  Button: TButton;
  RowIndex: Integer;
begin
  // Den gedr�ckten Button ermitteln
  Button := TButton(Sender);
  ShowMessage('Button ' + Button.Name + ' wurde gedr�ckt!');
end;

procedure TStartPageForm.updateTable;
begin
  TDiagramController.fillLoadingList(StringGrid1, diagramDatabase);
  //SetLength(openButton, StringGrid1.RowCount-2);
end;

procedure TStartPageForm.FormShow(Sender: TObject);
var
  i : Integer;
  button: TButton;
  CellRect: TRect;
begin
  updateTable;

  StringGrid1.Cells[5, 1] := 'HALLO';
  StringGrid1.Cells[5, 2] := 'HALLO';

  // Automatische Erstellung von Knoten
  for i := 1 to StringGrid1.RowCount-1 do
  begin
    StringGrid1.Cells[5, i] := openButtonText;
 { // Button erstellen und konfigurieren
    openButton[i-1] := TButton.Create(Self);
    CellRect := StringGrid1.CellRect(5, i);
    with openButton[i-1] do begin
      Name := 'OpenButton' + i.ToString;
      Parent := GroupBox2;
      Caption := OPEN_EN + i.ToString;
      OnClick := ClickMe;
      Height := CellRect.Height;
      Width := CellRect.Width;
      Top := StringGrid1.Top + CellRect.Top;
      Left := StringGrid1.Left + CellRect.Left;
      Font.Name := 'Avenir LT Pro 55 Roman';
    end; }
  end;
end;



procedure TStartPageForm.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin

end;


{ Lade gewaehltes Diagramm aus der Liste }
procedure TStartPageForm.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  { Erste Zeile soll nicht beachtet werden }
  if ARow <> 0 then
  begin
    { Sowie leere Zeilen nicht beachtet werden sollen }
    if not StringGrid1.Cells[ACol,ARow].IsEmpty then
    begin
      diagramSelected := true; // Damit keine selbsterstellte Fehlermeldung kommt

      DesignerForm.diagram := TDiagramController.selectDiagramFromList
      (StringGrid1, DesignerForm.diagram, ARow, diagramDatabase);
      DiagramEditorForm.OldDiagram := TDiagramController.selectDiagramFromList
      (StringGrid1, DesignerForm.diagram, ARow, diagramDatabase);

      { Datei als Hilfestellung anzeigen lassen }
      Edit2.Text := DesignerForm.diagram.getID.ToString + '_v'
                    + DesignerForm.diagram.getVersionNumber.ToString + '_'
                    + DesignerForm.diagram.getGermanName;

      { Daten an DesignerForm uebergeben }
      DesignerForm.IsLoadedDiagram := true;
      DesignerForm.LoadedDiagramFileName :=
        DesignerForm.diagram.getID.ToString + '_' + 'v'
      + DesignerForm.diagram.getVersionNumber.ToString + '_'
      + DesignerForm.diagram.getGermanName + '.blox';
    end;
  end;
end;

{ ------------------- Spracheneinstellungen ------------------------------- }
{ Texte neu zuweisen bei Sprachaenderung}
procedure TStartPageForm.fillComponentText();
var
  I : Integer;
begin
  button1.Caption := newButtonText;
  button2.Caption := loadButtonText;
  button3.Caption := createButtonText;
  button4.Caption := newVersionButtonText;
  button5.Caption := openButtonText;
  StartPageForm.Caption := formText;
  label2.Caption := descriptionText;
  Image1.Hint := descriptionHintText;
  Image2.Hint := nameHintText;
  GroupBox2.Caption := allDiagramText;
  StringGrid1.Cells[2,0] := descriptionText;
  StringGrid1.Cells[4,0] := activeText;
  { Aktivstatus der Diagramme uebersetzen }
  for I := 1 to StringGrid1.RowCount do
  begin
    if StringGrid1.Cells[4,I].Equals(YES_EN) then StringGrid1.Cells[4,I] :=
                                                                          YES_DE
    else if StringGrid1.Cells[4,I].Equals(NO_EN) then StringGrid1.Cells[4,I] :=
                                                                          NO_DE
    else if StringGrid1.Cells[4,I].Equals(YES_DE) then StringGrid1.Cells[4,I] :=
                                                                          YES_EN
    else if StringGrid1.Cells[4,I].Equals(NO_DE) then StringGrid1.Cells[4,I] :=
                                                                          NO_EN;
  end;

  if GroupBox2.Visible then Panel2.Caption := loadDiagamText
  else if GroupBox1.Visible then Panel2.Caption := createDiagramText;
  //for I := 0 to Length(openButton)-1 do openButton[I].Caption := openButtonText;
end;

{ Sprache aendern }
procedure TStartPageForm.ToggleSwitch1Click(Sender: TObject);
var
 I : Integer;
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
    createNewVersionText := STARTPAGELABEL_VERSION_EN;
    noDiagramNameText := NODIAGRAM_NAME_EN;
    activeText := ACTIVE_EN;
    openButtonText := OPEN_EN;
    noDiagramSelected := NODIAGRAM_SELECTED_EN;
    yes := YES_EN;
    no := NO_EN;
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
    createNewVersionText := STARTPAGELABEL_VERSION_DE;
    noDiagramNameText := NODIAGRAM_NAME_DE;
    activeText := ACTIVE_DE;
    openButtonText := OPEN_DE;
    noDiagramSelected := NODIAGRAM_SELECTED_DE;
    yes := YES_DE;
    no := NO_DE;
  end;
  fillComponentText();
end;

end.
