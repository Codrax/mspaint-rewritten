unit ThumbnailForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cod.Visual.Image;

type
  TThumbnail = class(TForm)
    Preview: CImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Thumbnail: TThumbnail;

implementation

{$R *.dfm}

end.
