object FormFileBeall: TFormFileBeall
  Left = 254
  Top = 237
  BiDiMode = bdLeftToRight
  BorderStyle = bsDialog
  Caption = 'Sz�m�t�g�p j�t�kos be�ll�t�sai'
  ClientHeight = 159
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 24
    Top = 16
    Width = 156
    Height = 13
    Caption = 'Mesters�ges intelligencia forr�sa:'
  end
  object Bevel2: TBevel
    Left = 8
    Top = 8
    Width = 193
    Height = 145
  end
  object Button2: TButton
    Left = 208
    Top = 8
    Width = 75
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 208
    Top = 40
    Width = 75
    Height = 25
    Caption = '&M�gsem'
    ModalResult = 2
    TabOrder = 4
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 40
    Width = 137
    Height = 17
    Caption = 'A program &saj�t elj�r�sa'
    TabOrder = 0
    OnClick = radioclick
  end
  object RadioButton2: TRadioButton
    Left = 24
    Top = 64
    Width = 97
    Height = 17
    Caption = '&K�ls� �llom�ny:'
    TabOrder = 1
    OnClick = radioclick
  end
  object Button1: TButton
    Left = 110
    Top = 120
    Width = 75
    Height = 25
    Caption = 'V�&laszt�s...'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 88
    Width = 161
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Text = 'Edit1'
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Futtathat� �llom�nyok (*.exe)|*.exe'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Title = 'K�ls� �llom�ny megnyit�sa'
  end
end
