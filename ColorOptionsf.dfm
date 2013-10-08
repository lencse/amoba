object ColorOptions: TColorOptions
  Left = 0
  Top = 0
  Width = 186
  Height = 216
  TabOrder = 0
  object PaintBox1: TPaintBox
    Left = 8
    Top = 88
    Width = 170
    Height = 120
    OnDblClick = Button1Click
    OnMouseDown = PaintBox1MouseDown
    OnPaint = PaintBox1Paint
  end
  object Shape1: TShape
    Left = 112
    Top = 8
    Width = 65
    Height = 41
  end
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 97
    Height = 73
    ItemHeight = 13
    Items.Strings = (
      'Pálya'
      'Rácsozat'
      'X figura'
      'O figura'
      'Gyõztes kijelölése')
    TabOrder = 0
    OnClick = ListBox1Click
    OnDblClick = Button1Click
    OnKeyPress = ListBox1KeyPress
  end
  object Button1: TButton
    Left = 112
    Top = 56
    Width = 65
    Height = 25
    Caption = '&Váltás...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
  end
end
