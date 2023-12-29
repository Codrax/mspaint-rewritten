object Properties: TProperties
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Image Properties'
  ClientHeight = 358
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Label7: TLabel
    Left = 8
    Top = 280
    Width = 35
    Height = 15
    Caption = 'Width:'
  end
  object Label8: TLabel
    Left = 159
    Top = 280
    Width = 39
    Height = 15
    Caption = 'Height:'
  end
  object Panel1: TPanel
    Left = 0
    Top = 321
    Width = 396
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      396
      37)
    object Button1: TButton
      Left = 234
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 315
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 380
    Height = 113
    Caption = 'File Attributes'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 58
      Height = 15
      Caption = 'Last Saved:'
    end
    object Label2: TLabel
      Left = 160
      Top = 32
      Width = 71
      Height = 15
      Caption = 'Not Avalabile'
    end
    object Label3: TLabel
      Left = 16
      Top = 53
      Width = 64
      Height = 15
      Caption = 'Size on disk:'
    end
    object Label4: TLabel
      Left = 160
      Top = 53
      Width = 71
      Height = 15
      Caption = 'Not Avalabile'
    end
    object Label5: TLabel
      Left = 16
      Top = 74
      Width = 59
      Height = 15
      Caption = 'Resolution:'
    end
    object Label6: TLabel
      Left = 160
      Top = 74
      Width = 51
      Height = 15
      Caption = 'Unknown'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 135
    Width = 193
    Height = 122
    Caption = 'Units'
    TabOrder = 2
    object RadioButton1: TRadioButton
      Left = 16
      Top = 32
      Width = 113
      Height = 17
      Caption = 'Inches'
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 16
      Top = 55
      Width = 113
      Height = 17
      Caption = 'Centimeters'
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 16
      Top = 78
      Width = 113
      Height = 17
      Caption = 'Pixels'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  object GroupBox3: TGroupBox
    Left = 207
    Top = 135
    Width = 181
    Height = 122
    Caption = 'Colors'
    TabOrder = 3
    object RadioButton4: TRadioButton
      Left = 16
      Top = 32
      Width = 113
      Height = 17
      Caption = 'Color'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
  end
  object Edit1: TEdit
    Left = 64
    Top = 275
    Width = 89
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnChange = ValidateValues
  end
  object Edit2: TEdit
    Left = 214
    Top = 275
    Width = 89
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnChange = ValidateValues
  end
  object Button3: TButton
    Left = 313
    Top = 276
    Width = 75
    Height = 25
    Caption = 'Default'
    TabOrder = 6
    OnClick = Button3Click
  end
end
