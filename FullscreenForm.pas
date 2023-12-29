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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FullScreen: TFullScreen;

implementation

{$R *.dfm}

procedure TFullScreen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil( Fullscreen );
end;

procedure TFullScreen.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Close;
end;

procedure TFullScreen.HideClick(Sender: TObject);
begin
  Close;
end;

end.
