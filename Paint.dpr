program Paint;

uses
  Vcl.Forms,
  PaintForm in 'PaintForm.pas' {MsPaint},
  MenuForm in 'MenuForm.pas' {MenuPopup},
  FullscreenForm in 'FullscreenForm.pas' {FullScreen},
  ThumbnailForm in 'ThumbnailForm.pas' {Thumbnail},
  SaveForm in 'SaveForm.pas' {Save},
  PropertiesForm in 'PropertiesForm.pas' {Properties};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMsPaint, MsPaint);
  Application.CreateForm(TMenuPopup, MenuPopup);
  Application.Run;
end.
