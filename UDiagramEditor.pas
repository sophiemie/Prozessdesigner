unit UDiagramEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, UFormController, Vcl.StdCtrls;

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
    procedure FormResize(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  DiagramEditorForm: TDiagramEditorForm;

implementation

{$R *.dfm}

procedure TDiagramEditorForm.FormResize(Sender: TObject);
begin
  TFormController.changeWindowSize(DiagramEditorForm, Panel1, GroupBox1, Edit1,
                                    Edit2, Edit3, Memo1, Memo2);
end;

end.
