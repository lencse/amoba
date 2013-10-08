object formnevjegy: Tformnevjegy
  Left = 254
  Top = 201
  BorderStyle = bsDialog
  Caption = 'Névjegy'
  ClientHeight = 128
  ClientWidth = 201
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 109
    Height = 13
    Caption = 'Amõba v3.0 by Lencse'
  end
  object Label3: TLabel
    Left = 8
    Top = 32
    Width = 50
    Height = 13
    Caption = 'Készítette:'
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 62
    Height = 13
    Caption = 'Löki Levente'
  end
  object Label4: TLabel
    Left = 24
    Top = 88
    Width = 47
    Height = 13
    Caption = 'Debrecen'
  end
  object Label5: TLabel
    Left = 24
    Top = 104
    Width = 24
    Height = 13
    Caption = '2003'
  end
  object PaintBox1: TPaintBox
    Left = 144
    Top = 24
    Width = 49
    Height = 49
  end
  object Label6: TLabel
    Left = 24
    Top = 72
    Width = 110
    Height = 13
    Caption = 'lencse@primposta.com'
  end
  object BitBtn1: TBitBtn
    Left = 120
    Top = 96
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object Timer1: TTimer
    Interval = 30
    OnTimer = Timer1Timer
  end
end
