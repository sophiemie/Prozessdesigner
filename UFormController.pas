{
Diese Unit kontrolliert Veraenderungen die bei den verschiedenen Forman vorge-
nommen werden.

Author: Sophie Miessner
}
unit UFormController;

interface

uses
  Vcl.Forms, Vcl.ExtCtrls, VCL.TMSFNCBloxControl, Vcl.StdCtrls, Vcl.Grids,
  Vcl.WinXCtrls, System.Classes, SysUtils, Vcl.Graphics;

type

TFormController = class abstract
public
  class procedure changeWindowSize(form: TForm; box: TGroupBox; list: TListBox;
                                    button: TButton); overload;
  class procedure changeWindowSize(form: TForm; panel: TPanel; control:
                  TTMSFNCBloxControl); overload;
  class procedure changeWindowSize(form: TForm; panel1: TPanel; panel2: TPanel;
                  box1: TGroupBox; box2: TGroupBox; table: TStringGrid;
                  toggle: TToggleSwitch; edit: TEdit); overload;
  class procedure changeWindowSize(form: TForm; panel: TPanel; box:
                    TGroupBox; edit1: TEdit; edit2: TEdit; edit3: TEdit;
                    memo1: TMemo; memo2: TMemo; descriptionLabel: TLabel;
                    activeLabel: TLabel; saveButton: TButton; yesButton:
                    TRadioButton; noButton: TRadioButton); overload;
  class procedure adaptButtonToTable(button: TButton; table: TStringGrid);
  class procedure initStartPageTable(table: TStringGrid);
private
  class function getVisibleRowFromTable(table: TStringGrid) : Integer;
  class function getVisibleColFromTable(table: TStringGrid) : Integer;
end;


implementation

  { Aenderung bei der Knotenauswahl }
  class procedure TFormController.changeWindowSize(form: TForm; box: TGroupBox;
  list: TListBox; button: TButton);
  begin
    box.Width := form.Width - 75;
    box.Height := form.Height - 100;
    list.Width := form.Width - 150;
    list.Height := form.Height - 320;
    button.Top := form.Height - 175;
    button.Left := form.Width - Round(form.Width/2) - button.Width + 25;
  end;


  { Aenderung bei dem Designformular }
  class procedure TFormController.changeWindowSize(form: TForm; panel: TPanel;
                control: TTMSFNCBloxControl);
  begin
    panel.Left := form.Width - panel.Width;
    control.Width := form.Width - panel.Width;
    control.Height := form.Height;
    panel.Height := form.Height;
  end;


  { Aenderung bei der Startpage }
  class procedure TFormController.changeWindowSize(form: TForm; panel1: TPanel;
                  panel2: TPanel; box1: TGroupBox; box2: TGroupBox;
                  table: TStringGrid; toggle: TToggleSwitch; edit: TEdit);
  const
    BOX_BORDER = 100;
  begin
    panel1.Width := form.Width;
    panel1.Height := form.Height;
    panel2.Width := form.Width;
    box1.Width := form.Width - BOX_BORDER;
    box2.Width := form.Width - BOX_BORDER;
    box1.Height := form.Height - BOX_BORDER*2;
    box2.Height := form.Height - BOX_BORDER*2;
    table.Width := form.Width - 200;
    toggle.Top := form.Height - 150;
    edit.Top := form.Height - 430;
    table.Height := form.Height - 520;
  end;


  { Aenderung bei dem Diagrammeditor }
  class procedure TFormController.changeWindowSize(form: TForm; panel: TPanel;
                  box: TGroupBox; edit1: TEdit; edit2: TEdit; edit3: TEdit;
                  memo1: TMemo; memo2: TMemo; descriptionLabel: TLabel;
                  activeLabel: TLabel; saveButton: TButton; yesButton:
                  TRadioButton; noButton: TRadioButton);
  begin
    panel.Width := form.Width;
    box.Width := form.Width - 100;
    box.Height := form.Height - 200;
    edit1.Width := form.Width - 200;
    edit2.Width := edit1.Width;
    edit3.Width := edit1.Width;
    memo1.Width := edit1.Width;
    memo2.Width := edit1.Width;
    savebutton.Top := form.Height - 270;
    saveButton.Left := form.Width - Round(form.Width/2) - saveButton.Width + 25;
    yesButton.Top := form.Height - 340;
    noButton.Top := yesButton.Top;
    activeLabel.Top := yesButton.Top;
    // Formelentstehung siehe Technische Doku Kapitel 2.1
    memo1.Height := Round((-213 + (form.Height - memo1.Top))/2-100);
    descriptionLabel.Top := memo1.Top + memo1.Height +13;
    memo2.Top := descriptionLabel.Top +40;
    memo2.Height := memo1.Height;
  end;


  class procedure TFormController.adaptButtonToTable(button: TButton;
                                                            table: TStringGrid);
  var
    nameBegin : String;
  begin
    nameBegin := Copy(button.Name,0,3);
    if SameText('ope',nameBegin) then
    begin
      if table.topRow > 2 then button.Visible := false
      else button.Visible := true;
    end;

  end;


  class procedure TFormController.initStartPageTable(table: TStringGrid);
  begin
    with table do
    begin
      Cells[0,0] := 'ID';
      Cells[1,0] := 'Name';
      Cells[3,0] := 'Version';
      ColWidths[0] := 35;
      ColWidths[3] := 100;
      ColWidths[4] := 80;
      ColWidths[1] := 157;
      ColWidths[2] := 280;
      ColWidths[5] := 0;  // Schreibt in 5 Spalte keine Werte rein??
      //Cells[6,0] := 'Open';
      //Cells[6,1] := 'Open';
      Color := clRed;
    end;
    table.Invalidate;
  end;


  class function TFormController.getVisibleRowFromTable(table: TStringGrid)
                                                                      : Integer;
  begin
    Result := table.TopRow;
  end;

  class function TFormController.getVisibleColFromTable(table: TStringGrid)
                                                                      : Integer;
  begin
    Result := table.LeftCol;
  end;

end.
