unit UDiagramEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, UFormController, Vcl.StdCtrls, UDiagram, UDiagramController,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, UDatabase;

type
  TDiagramEditorForm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Memo2: TMemo;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    OldDiagram: TDiagram;
    NewDiagram: TDiagram;
    Database: TDiagramDatabase;
  end;

var
  DiagramEditorForm: TDiagramEditorForm;

implementation

{$R *.dfm}

{ Speichern der Veraenderung }
procedure TDiagramEditorForm.Button1Click(Sender: TObject);
begin
  // Eine Veraenderung wurde vorgenommen
  if not TDiagramController.compareTwoDiagramsIfSimilar(OldDiagram,
                                                                NewDiagram) then
  begin
    Database.updateDiagram(NewDiagram);
  end;
  DiagramEditorForm.Close;
end;


{ Aenderung des deutschen Namen}
procedure TDiagramEditorForm.Edit1Change(Sender: TObject);
begin
  NewDiagram.setGermanName(Edit1.Text);
end;

{ Aenderung des englischen Namen}
procedure TDiagramEditorForm.Edit2Change(Sender: TObject);
begin
  NewDiagram.setEnglishName(Edit2.Text);
end;

{ Aenderung des Klassennamens}
procedure TDiagramEditorForm.Edit3Change(Sender: TObject);
begin
  NewDiagram.setClassName(Edit3.Text);
end;

{ Initialisierung }
procedure TDiagramEditorForm.FormCreate(Sender: TObject);
begin
  Database := TDiagramDatabase.Create(FDQuery1,'wf_def');
end;

{ Veraenderung der Fenstergroesse }
procedure TDiagramEditorForm.FormResize(Sender: TObject);
begin
  TFormController.changeWindowSize(DiagramEditorForm, Panel1, GroupBox1, Edit1,
                                    Edit2, Edit3, Memo1, Memo2, Label4, Label5,
                                    Button1, RadioButton1, RadioButton2);
end;

{ Fenster oeffnen bei der Auswahl zur Bearbeitung eines Diagrammes }
procedure TDiagramEditorForm.FormShow(Sender: TObject);
var
  oldGermanName, oldEnglishName, oldGermanDescr, oldEnglishDescr, oldClass : String;
begin
  // Zwei identische Diagramme erstellen um spaeter Differenzen zu ueberpruefen
  //OldDiagram := TDiagram.Create(1,'','');

  //NewDiagram := OldDiagram;
  NewDiagram := TDiagram.Create(OldDiagram.getID, OldDiagram.getGermanName,
                                  OldDiagram.getGermanDescription);
  NewDiagram.setEnglishName(OldDiagram.getEnglishName);
  NewDiagram.setEnglishDescription(OldDiagram.getEnglishDescription);
  NewDiagram.setClassName(OldDiagram.getClassName);

  oldGermanName := OldDiagram.getGermanName;
  oldEnglishName := OldDiagram.getEnglishName;
  oldClass := OldDiagram.getClassName;
  oldGermanDescr := OldDiagram.getGermanDescription;
  oldEnglishDescr := OldDiagram.getEnglishDescription;

  Edit1.Text := oldGermanName;
  Edit2.Text := oldEnglishName;
  Edit3.Text := oldClass;
  Memo1.Text := oldGermanDescr;
  Memo1.Text := oldEnglishDescr;

end;

{ Aendere deutsche Beschreibung }
procedure TDiagramEditorForm.Memo1Change(Sender: TObject);
begin
  NewDiagram.setGermanDescription(Memo1.Text);
end;

{ Aendere englische Beschreibung }
procedure TDiagramEditorForm.Memo2Change(Sender: TObject);
begin
  NewDiagram.setEnglishDescription(Memo2.Text);
end;

end.
