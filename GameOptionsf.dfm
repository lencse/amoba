object GameOptions: TGameOptions
  Left = 0
  Top = 0
  Width = 311
  Height = 304
  TabOrder = 0
  object Label7: TLabel
    Left = 8
    Top = 232
    Width = 33
    Height = 13
    Caption = '&Kezdõ:'
    FocusControl = Combobox1
  end
  object Label3: TLabel
    Left = 160
    Top = 232
    Width = 90
    Height = 13
    Caption = 'Sorok és oszlo&pok:'
    FocusControl = Spinedit1
  end
  object Label4: TLabel
    Left = 128
    Top = 272
    Width = 111
    Height = 13
    Caption = 'ezre&dmásodpercenként'
    FocusControl = CheckBox1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 137
    Height = 217
    Caption = '1. játékos'
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 112
      Width = 23
      Height = 13
      Caption = '&Név:'
      FocusControl = Edit1
    end
    object Edit1: TEdit
      Left = 8
      Top = 128
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 1
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 152
      Width = 121
      Height = 57
      Caption = 'Figura:'
      Items.Strings = (
        '&X'
        'O')
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 16
      Width = 121
      Height = 89
      Caption = 'Irányító:'
      TabOrder = 0
      object RadioButton1: TRadioButton
        Left = 8
        Top = 16
        Width = 89
        Height = 17
        Caption = '&Ember'
        TabOrder = 0
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 8
        Top = 32
        Width = 89
        Height = 17
        Caption = '&Számítógép'
        TabOrder = 1
        OnClick = RadioButton1Click
      end
      object Button1: TButton
        Left = 8
        Top = 56
        Width = 75
        Height = 25
        Caption = '&Beállítás...'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
  end
  object Combobox1: TComboBox
    Left = 48
    Top = 232
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      '1. játékos'
      '2. játékos')
  end
  object GroupBox2: TGroupBox
    Left = 160
    Top = 8
    Width = 137
    Height = 217
    Caption = '2. játékos'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 112
      Width = 23
      Height = 13
      Caption = 'Né&v:'
      FocusControl = Edit2
    end
    object Edit2: TEdit
      Left = 8
      Top = 128
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 1
    end
    object RadioGroup2: TRadioGroup
      Left = 8
      Top = 152
      Width = 121
      Height = 57
      Caption = 'Figura:'
      Items.Strings = (
        'X'
        'O')
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 16
      Width = 121
      Height = 89
      Caption = 'Irányító:'
      TabOrder = 0
      object RadioButton3: TRadioButton
        Left = 8
        Top = 16
        Width = 89
        Height = 17
        Caption = 'E&mber'
        TabOrder = 0
        OnClick = RadioButton1Click
      end
      object RadioButton4: TRadioButton
        Left = 8
        Top = 32
        Width = 89
        Height = 17
        Caption = 'S&zámítógép'
        TabOrder = 1
        OnClick = RadioButton1Click
      end
      object Button2: TButton
        Left = 8
        Top = 56
        Width = 75
        Height = 25
        Caption = 'Beá&llítás...'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
  end
  object Spinedit1: TSpinEdit
    Left = 256
    Top = 232
    Width = 41
    Height = 22
    MaxValue = 30
    MinValue = 5
    TabOrder = 3
    Value = 15
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 272
    Width = 49
    Height = 17
    Caption = 'Lépés'
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object SpinEdit2: TSpinEdit
    Left = 64
    Top = 272
    Width = 57
    Height = 22
    Increment = 50
    MaxValue = 60000
    MinValue = 100
    TabOrder = 5
    Value = 100
  end
end
