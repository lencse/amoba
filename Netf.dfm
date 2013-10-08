object FormNet: TFormNet
  Left = 191
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Játék hálóban'
  ClientHeight = 257
  ClientWidth = 193
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 177
    Height = 137
    Caption = 'Az ellenfél:'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 64
      Width = 25
      Height = 13
      Caption = '&Host:'
      FocusControl = Edit1
    end
    object Combobox1: TComboBox
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = Combobox1Change
      Items.Strings = (
        '1. játékos'
        '2. játékos')
    end
    object Edit1: TEdit
      Left = 8
      Top = 80
      Width = 161
      Height = 21
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 112
      Width = 97
      Height = 17
      Caption = '&Kezdõjátékos'
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 152
    Width = 177
    Height = 65
    Caption = 'A helyi játékos:'
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Label2'
      Constraints.MaxWidth = 161
    end
  end
  object Button1: TButton
    Left = 32
    Top = 224
    Width = 75
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 112
    Top = 224
    Width = 75
    Height = 25
    Caption = '&Mégsem'
    ModalResult = 2
    TabOrder = 3
  end
end
