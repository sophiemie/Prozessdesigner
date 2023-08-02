unit UFormController;

interface

uses Vcl.Forms, Vcl.ExtCtrls, VCL.TMSFNCBloxControl, Vcl.StdCtrls;

type

TFormController = class abstract
public
  class procedure changeWindowSize(form: TForm; box: TGroupBox; list: TListBox;
                                    button: TButton); overload;
  class procedure changeWindowSize(form: TForm; panel: TPanel; control:
                  TTMSFNCBloxControl); overload;
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

end.
