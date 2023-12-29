object Save: TSave
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Paint'
  ClientHeight = 142
  ClientWidth = 350
  Color = clWhite
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 31
  CustomTitleBar.SystemColors = False
  CustomTitleBar.BackgroundColor = clWhite
  CustomTitleBar.ForegroundColor = 65793
  CustomTitleBar.InactiveBackgroundColor = clWhite
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = 65793
  CustomTitleBar.ButtonBackgroundColor = clWhite
  CustomTitleBar.ButtonHoverForegroundColor = 65793
  CustomTitleBar.ButtonHoverBackgroundColor = 16053492
  CustomTitleBar.ButtonPressedForegroundColor = 65793
  CustomTitleBar.ButtonPressedBackgroundColor = 15395562
  CustomTitleBar.ButtonInactiveForegroundColor = 10066329
  CustomTitleBar.ButtonInactiveBackgroundColor = clWhite
  Constraints.MinHeight = 150
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Top = 31
  Position = poDesigned
  StyleElements = [seFont, seClient]
  TextHeight = 15
  object Msg: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 40
    Width = 330
    Height = 23
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Caption = 'Do you want to save changes to'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    ExplicitWidth = 245
  end
  object Panel1: TPanel
    Left = 0
    Top = 105
    Width = 350
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Button1: TButton
      AlignWithMargins = True
      Left = 70
      Top = 5
      Width = 85
      Height = 27
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Save'
      Default = True
      ModalResult = 6
      TabOrder = 0
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 260
      Top = 5
      Width = 85
      Height = 27
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 165
      Top = 5
      Width = 85
      Height = 27
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Cancel = True
      Caption = 'Don'#39't Save'
      ModalResult = 7
      TabOrder = 1
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 30
    CustomButtons = <>
  end
end
