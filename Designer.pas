unit Designer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCBloxCoreTypes,
  VCL.TMSFNCBloxCoreUtils, VCL.TMSFNCBloxCoreLine, VCL.TMSFNCBloxCorePolygon,
  VCL.TMSFNCBloxCoreTextCell, VCL.TMSFNCBloxCoreLineArrow,
  VCL.TMSFNCBloxCoreLinkPoint, VCL.TMSFNCBloxCoreHandle,
  VCL.TMSFNCBloxCoreGroup, VCL.TMSFNCBloxUISnapGrid, VCL.TMSFNCBloxCoreBlock,
  VCL.TMSFNCBloxCoreElement, VCL.TMSFNCBloxUIRegistration,
  VCL.TMSFNCBloxUIRenderer, VCL.TMSFNCBloxSelector, Vcl.StdCtrls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCCustomScrollControl, VCL.TMSFNCBloxControl;

type
  TForm1 = class(TForm)
    TMSFNCBloxSelector1: TTMSFNCBloxSelector;
    TMSFNCBloxControl1: TTMSFNCBloxControl;
    procedure TMSFNCBloxControl1RegisterElements(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}
  procedure TForm1.TMSFNCBloxControl1RegisterElements(Sender: TObject);
  var
    w: Double;
  begin
    w := 0;
  end;

end.
