object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 515
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 384
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
  end
  object TMSFNCBloxSelector1: TTMSFNCBloxSelector
    Left = 448
    Top = 0
    Width = 264
    Height = 521
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Appearance.ItemHeight = 50.000000000000000000
    Appearance.Stroke.Color = 11119017
    Appearance.Fill.Color = 15329769
    Appearance.StrokeHover.Color = 10061943
    Appearance.FillHover.Color = 13419707
    Appearance.StrokeDown.Color = 9470064
    Appearance.FillDown.Color = 13156536
    Appearance.StrokeSelected.Color = 5197615
    Appearance.FillSelected.Color = 13156536
    Appearance.StrokeDisabled.Color = 11119017
    Appearance.FillDisabled.Color = clSilver
    Appearance.SeparatorStroke.Color = 11119017
    Appearance.SeparatorFill.Color = 13419707
    Appearance.Font.Charset = DEFAULT_CHARSET
    Appearance.Font.Color = clWindowText
    Appearance.Font.Height = -9
    Appearance.Font.Name = 'Tahoma'
    Appearance.Font.Style = []
    Appearance.SeparatorFont.Charset = DEFAULT_CHARSET
    Appearance.SeparatorFont.Color = clWindowText
    Appearance.SeparatorFont.Height = -11
    Appearance.SeparatorFont.Name = 'Tahoma'
    Appearance.SeparatorFont.Style = []
    Rows = 100
    Items = <>
  end
  object TMSFNCBloxControl1: TTMSFNCBloxControl
    Left = 0
    Top = 0
    Width = 449
    Height = 513
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    OnClick = TMSFNCBloxControl1Click
    TopRuler.Font.Size = 10.000000000000000000
    TopRuler.Size = 18
    LeftRuler.Font.Size = 10.000000000000000000
    LeftRuler.Size = 18
    ElementHandleAppearance.Size.StrokeColor = 16748574
    ElementHandleAppearance.Size.FillColor = 15128749
    ElementHandleAppearance.Size.DisabledStrokeColor = clSilver
    ElementHandleAppearance.Size.DisabledFillColor = clSilver
    ElementHandleAppearance.Size.Size = 3
    ElementHandleAppearance.Size.Style = hhRectangle
    ElementHandleAppearance.Rotate.StrokeColor = 16748574
    ElementHandleAppearance.Rotate.FillColor = 15128749
    ElementHandleAppearance.Rotate.DisabledStrokeColor = clSilver
    ElementHandleAppearance.Rotate.DisabledFillColor = clSilver
    ElementHandleAppearance.Rotate.Size = 4
    ElementHandleAppearance.Rotate.Style = hhEllipse
    ElementHandleAppearance.Custom.StrokeColor = 16748574
    ElementHandleAppearance.Custom.FillColor = 5275647
    ElementHandleAppearance.Custom.DisabledStrokeColor = clSilver
    ElementHandleAppearance.Custom.DisabledFillColor = clSilver
    ElementHandleAppearance.Custom.Size = 4
    ElementHandleAppearance.Custom.Style = hhDiamond
    ElementHandleAppearance.RotCenter.StrokeColor = 16748574
    ElementHandleAppearance.RotCenter.FillColor = 15128749
    ElementHandleAppearance.RotCenter.DisabledStrokeColor = clSilver
    ElementHandleAppearance.RotCenter.DisabledFillColor = clSilver
    ElementHandleAppearance.RotCenter.Size = 3
    ElementHandleAppearance.RotCenter.Style = hhCrossedEllipse
    GroupHandleAppearance.Size.StrokeColor = 2237106
    GroupHandleAppearance.Size.FillColor = 8421616
    GroupHandleAppearance.Size.DisabledStrokeColor = clSilver
    GroupHandleAppearance.Size.DisabledFillColor = clSilver
    GroupHandleAppearance.Size.Size = 3
    GroupHandleAppearance.Size.Style = hhRectangle
    GroupHandleAppearance.Rotate.StrokeColor = 2237106
    GroupHandleAppearance.Rotate.FillColor = 8421616
    GroupHandleAppearance.Rotate.DisabledStrokeColor = clSilver
    GroupHandleAppearance.Rotate.DisabledFillColor = clSilver
    GroupHandleAppearance.Rotate.Size = 4
    GroupHandleAppearance.Rotate.Style = hhEllipse
    GroupHandleAppearance.Custom.StrokeColor = 2237106
    GroupHandleAppearance.Custom.FillColor = 5275647
    GroupHandleAppearance.Custom.DisabledStrokeColor = clSilver
    GroupHandleAppearance.Custom.DisabledFillColor = clSilver
    GroupHandleAppearance.Custom.Size = 4
    GroupHandleAppearance.Custom.Style = hhDiamond
    GroupHandleAppearance.RotCenter.StrokeColor = 2237106
    GroupHandleAppearance.RotCenter.FillColor = 8421616
    GroupHandleAppearance.RotCenter.DisabledStrokeColor = clSilver
    GroupHandleAppearance.RotCenter.DisabledFillColor = clSilver
    GroupHandleAppearance.RotCenter.Size = 3
    GroupHandleAppearance.RotCenter.Style = hhCrossedEllipse
    Interaction.ChangeTextWithDoubleClick = False
  end
  object FDConnection_forms: TFDConnection
    Params.Strings = (
      'Database=forms'
      'User_Name=dbapp'
      'Password=Yv9i9OqHC8TRlCbE'
      'DriverID=MySQL')
    Left = 144
    Top = 184
  end
  object FDQuery_forms: TFDQuery
    Connection = FDConnection_forms
    Left = 240
    Top = 184
  end
  object FDConnection_wf: TFDConnection
    Params.Strings = (
      'Database=wf'
      'User_Name=dbapp'
      'Password=Yv9i9OqHC8TRlCbE'
      'DriverID=MySQL')
    Left = 144
    Top = 256
  end
  object FDQuery_wf: TFDQuery
    Connection = FDConnection_wf
    Left = 240
    Top = 264
  end
  object FDConnection_maindb: TFDConnection
    Params.Strings = (
      'Database=main_db'
      'User_Name=dbapp'
      'Password=Yv9i9OqHC8TRlCbE'
      'DriverID=MySQL')
    Left = 136
    Top = 344
  end
  object FDQuery_maindb: TFDQuery
    Connection = FDConnection_maindb
    Left = 248
    Top = 352
  end
  object FDConnection_wftest: TFDConnection
    Params.Strings = (
      'Database=wf_test'
      'User_Name=dbapp'
      'Password=Yv9i9OqHC8TRlCbE'
      'DriverID=MySQL')
    Left = 136
    Top = 416
  end
  object FDQuery_wftest: TFDQuery
    Connection = FDConnection_wftest
    Left = 256
    Top = 424
  end
end
