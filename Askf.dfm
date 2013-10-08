object FormAsk: TFormAsk
  Left = 211
  Top = 142
  BorderStyle = bsDialog
  Caption = 'J'#225't'#233'kra h'#237'v'#225's'
  ClientHeight = 233
  ClientWidth = 171
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 88
    Width = 48
    Height = 13
    Caption = 'Saj'#225't &n'#233'v:'
    FocusControl = Edit1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 153
    Height = 65
    Caption = 'J'#225't'#233'kra h'#237'v:'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
  end
  object Edit1: TEdit
    Left = 8
    Top = 104
    Width = 153
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 88
    Top = 200
    Width = 75
    Height = 25
    Caption = 'El&utas'#237't'
    ModalResult = 2
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 200
    Width = 75
    Height = 25
    Caption = 'El&fogad'
    ModalResult = 1
    TabOrder = 3
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 136
    Width = 121
    Height = 57
    Caption = 'Ir'#225'ny'#237't'#243':'
    TabOrder = 4
    object RadioButton1: TRadioButton
      Left = 8
      Top = 16
      Width = 89
      Height = 17
      Caption = '&Ember'
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 32
      Width = 89
      Height = 17
      Caption = '&Sz'#225'm'#237't'#243'g'#233'p'
      TabOrder = 1
    end
  end
end
