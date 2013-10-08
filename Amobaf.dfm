object FormFo: TFormFo
  Left = 330
  Top = 180
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Am�ba v3.0'
  ClientHeight = 175
  ClientWidth = 115
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseDown = FormMouseDown
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 89
    Height = 169
    Constraints.MinWidth = 89
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 46
      Height = 13
      Caption = 'D�ntetlen'
    end
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 49
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 49
      Top = 48
      Width = 32
      Height = 13
      Caption = 'Label5'
    end
    object Label6: TLabel
      Left = 49
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Label6'
    end
    object Button3: TButton
      Left = 6
      Top = 136
      Width = 75
      Height = 25
      Action = acQuit
      Anchors = [akLeft, akBottom]
      TabOrder = 0
    end
    object Button2: TButton
      Left = 6
      Top = 104
      Width = 75
      Height = 25
      Action = acOptions
      TabOrder = 1
    end
    object Button1: TButton
      Left = 6
      Top = 72
      Width = 75
      Height = 25
      Action = acNewGame
      TabOrder = 2
    end
  end
  object MainMenu1: TMainMenu
    object Menu1: TMenuItem
      Caption = 'J�&t�k'
      object Menu11: TMenuItem
        Action = acNewGame
      end
      object Menu12: TMenuItem
        Action = acStep
        Caption = 'K�vetkez� &l�p�s'
      end
      object Menu13: TMenuItem
        Action = acOptions
      end
      object Menu15: TMenuItem
        Action = acConnect
      end
      object Menu16: TMenuItem
        Action = acDisconnect
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Menu14: TMenuItem
        Action = acQuit
      end
    end
    object Menu2: TMenuItem
      Caption = '&S�g�'
      object Menu21: TMenuItem
        Caption = '&N�vjegy'
        OnClick = Menu21Click
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = procStep
    Left = 24
  end
  object ActionList1: TActionList
    Left = 48
    object acNewGame: TAction
      Caption = '�&j j�t�k'
      OnExecute = procNewGame
    end
    object acOptions: TAction
      Caption = '&Be�ll�t�sok...'
      OnExecute = procOptions
    end
    object acQuit: TAction
      Caption = '&V�ge'
      OnExecute = procQuit
    end
    object acStep: TAction
      Caption = '&K�vekez� l�p�s'
      OnExecute = procStep
    end
    object acConnect: TAction
      Caption = 'J�t�k &h�l�ban...'
      Visible = False
      OnExecute = acConnectExecute
    end
    object acDisconnect: TAction
      Caption = 'Me&gszak�t�s'
      Visible = False
      OnExecute = acDisconnectExecute
    end
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 1666
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Top = 24
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 1666
    ServerType = stNonBlocking
    OnAccept = ServerSocket1Accept
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 24
    Top = 24
  end
end
