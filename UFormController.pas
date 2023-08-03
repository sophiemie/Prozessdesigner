unit UFormController;

interface

uses
  Vcl.Forms, Vcl.ExtCtrls, VCL.TMSFNCBloxControl, Vcl.StdCtrls, Vcl.Grids,
  Vcl.WinXCtrls;

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
                    memo1: TMemo; memo2: TMemo); overload;
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
                  memo1: TMemo; memo2: TMemo);
  begin
    panel.Width := form.Width;
    box.Width := form.Width - 100;
    box.Height := form.Height - 100;
    edit1.Width := form.Width - 150;
    edit2.Width := edit1.Width;
    edit3.Width := edit1.Width;
  end;

end.
