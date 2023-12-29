object Thumbnail: TThumbnail
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Thumbnail'
  ClientHeight = 439
  ClientWidth = 753
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object Preview: CImage
    Left = 0
    Top = 0
    Width = 753
    Height = 439
    Align = alClient
    GifSettings.Enable = False
    GifSettings.AnimationSpeed = 100
    DrawMode = Fit
    ExplicitLeft = -16
    ExplicitTop = -39
    ExplicitWidth = 640
    ExplicitHeight = 480
  end
end
