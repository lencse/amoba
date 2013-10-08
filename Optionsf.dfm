object OptionsForm: TOptionsForm
  Left = 198
  Top = 127
  BorderStyle = bsDialog
  Caption = 'Beállítások'
  ClientHeight = 368
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 314
    Height = 368
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '&Játék'
      OnShow = TabSheet1Show
      inline GameOptions1: TGameOptions
        Top = -4
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Színek'
      ImageIndex = 1
      OnShow = TabSheet2Show
      inline ColorOptions1: TColorOptions
      end
    end
  end
  object Button1: TButton
    Left = 144
    Top = 328
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 224
    Top = 328
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Mé&gsem'
    ModalResult = 2
    TabOrder = 2
  end
end
