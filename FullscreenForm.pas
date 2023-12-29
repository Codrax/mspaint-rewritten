unit FullscreenForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cod.Visual.Image;

type
  TFullScreen = class(TForm)
    Preview: CImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure HideClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FullScreen: TFullScreen;

implementation

{$R *.dfm}

procedure TFullScreen.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Hide;
end;

procedure TFullScreen.HideClick(Sender: TObject);
begin
  Hide;
end;

end.
