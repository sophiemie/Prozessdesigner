unit UNodes;

interface

uses
  VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCBloxCoreTypes,
  VCL.TMSFNCBloxCoreUtils, VCL.TMSFNCBloxCoreLine, VCL.TMSFNCBloxCorePolygon,
  VCL.TMSFNCBloxCoreTextCell, VCL.TMSFNCBloxCoreLineArrow,
  VCL.TMSFNCBloxCoreLinkPoint, VCL.TMSFNCBloxCoreHandle,
  VCL.TMSFNCBloxCoreGroup, VCL.TMSFNCBloxUISnapGrid, VCL.TMSFNCBloxCoreBlock,
  VCL.TMSFNCBloxCoreElement, VCL.TMSFNCBloxUIRegistration,
  VCL.TMSFNCBloxUIRenderer, VCL.TMSFNCBloxSelector,  VCL.TMSFNCStyles,
  VCL.TMSFNCBloxShapesUML,   // VCL.TMSFNCBloxShapesUML fuer UML-Formen,
  Vcl.Graphics,
  VCL.TMSFNCCustomControl, VCL.TMSFNCCustomScrollControl, VCL.TMSFNCBloxControl;

const
  lightBlue = $FAE4BE;
  darkGrey = $626262;
  lightGray = $B2B2B2;
  darkBlue = $E5BF81;
  startEndSize = 80;

type
  // Start- und Endknoten
  TStart = class(TTMSFNCBloxUMLInitialStateBlock)
    constructor Create; override;
  end;

  TEnd = class(TTMSFNCBloxUMLFinalStateBlock)
    constructor Create; override;
  end;

  // Entscheidungsknoten
  TDecision = class(TTMSFNCBloxUMLDecisionBlock)
    constructor Create; override;
  end;

  THumanDecision = class(TDecision)
    constructor Create; override;
  end;

  TMashineDecision = class(TDecision)
    constructor Create; override;
  end;

  // Aktionsknoten
  TTask = class(TTMSFNCBloxUMLActionStateBlock)
    constructor Create; override;
  end;

  THumanTask = class(TTask)
    constructor Create; override;
  end;

  TMashineTask = class(TTask)
    constructor Create; override;
  end;

implementation

constructor TStart.Create;
begin
  inherited;
  Width := startEndSize;
  Height := Width;
  FillColor := darkBlue;
  Text := 'S';
end;

constructor TEnd.Create;
begin
  inherited;
  Width := startEndSize;
  Height := Width;
  FillColor := darkGrey;
  Text := 'E';
end;

constructor TDecision.Create;
begin
  inherited;
  Width := 50;
end;

constructor THumanDecision.Create;
begin
  inherited;
  FillColor := lightBlue;
  Text := 'HD';
end;

constructor TMashineDecision.Create;
begin
  inherited;
  FillColor := lightGray;
  Text := 'MD';
end;

constructor TTask.Create;
begin
  inherited;
  Width := 50;
end;

constructor THumanTask.Create;
begin
  inherited;
  FillColor := lightBlue;
  Text := 'HT';
end;

constructor TMashineTask.Create;
begin
  inherited;
  FillColor := lightGray;
  Text := 'MT';
end;



end.
