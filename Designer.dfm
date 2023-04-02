object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 423
  ClientWidth = 612
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
    TabOrder = 0
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=forms'
      'User_Name=dbapp'
      'Password=Yv9i9OqHC8TRlCbE'
      'DriverID=MySQL')
    Left = 144
    Top = 184
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 240
    Top = 184
  end
  object FDConnection2: TFDConnection
    Params.Strings = (
      'Database=wf'
      'User_Name=dbapp'
      'Password=Yv9i9OqHC8TRlCbE'
      'DriverID=MySQL')
    Left = 144
    Top = 256
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection2
    Left = 240
    Top = 264
  end
  object FDConnection3: TFDConnection
    Params.Strings = (
      'Database=main_db'
      'User_Name=dbapp'
      'Password=Yv9i9OqHC8TRlCbE'
      'DriverID=MySQL')
    Left = 136
    Top = 344
  end
  object FDQuery3: TFDQuery
    Connection = FDConnection3
    Left = 248
    Top = 352
  end
end
