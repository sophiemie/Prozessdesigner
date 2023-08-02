unit UFormController;

interface

uses Vcl.Forms, Vcl.ExtCtrls, VCL.TMSFNCBloxControl;

type

TFormController = class abstract
public
  class procedure changeWindowSize(form: TForm); overload;
  class procedure changeWindowSize(form: TForm; panel: TPanel; control:
                  TTMSFNCBloxControl); overload;
end;


implementation

  class procedure TFormController.changeWindowSize(form: TForm);
  begin

  end;

  class procedure TFormController.changeWindowSize(form: TForm; panel: TPanel;
                control: TTMSFNCBloxControl);
  begin
    panel.Left := form.Width - panel.Width;
    control.Width := form.Width - panel.Width;
    control.Height := form.Height;
    panel.Height := form.Height;
  end;

end.
