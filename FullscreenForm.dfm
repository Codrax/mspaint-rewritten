object FullScreen: TFullScreen
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form3'
  ClientHeight = 480
  ClientWidth = 640
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnClick = HideClick
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object Preview: CImage
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    GifSettings.Enable = False
    GifSettings.AnimationSpeed = 100
    OnClick = HideClick
    ExplicitLeft = 208
    ExplicitTop = 80
    ExplicitWidth = 150
    ExplicitHeight = 100
  end
end
