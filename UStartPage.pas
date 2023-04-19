unit UStartPage;

interface
// https://stackoverflow.com/questions/39219587/change-start-up-form-in-delphi-10-1-berlin
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, UDiagram, UDesigner;

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
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  StartPageForm: TStartPageForm;

implementation

{$R *.dfm}

procedure TStartPageForm.Button1Click(Sender: TObject);
begin
  Panel1.Visible := true;
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
end;

end.
