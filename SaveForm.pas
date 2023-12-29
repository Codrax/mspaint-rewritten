unit SaveForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Cod.SysUtils, Vcl.TitleBarCtrls;

type
  TSave = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Msg: TLabel;
    Button3: TButton;
    TitleBarPanel1: TTitleBarPanel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrepareDialog(FileName: string);
  end;

const
  SAVE_TEMPLATE = 'Do you want to save changes to %S?';

var
  Save: TSave;

implementation

uses
  PaintForm;

{$R *.dfm}

{ TForm1 }

procedure TSave.PrepareDialog;
var
  AName: string;
begin
  CenterFormInForm(Self, Application.MainForm, false);

  if FileName = '' then
    AName := FileDisplayName
  else
    AName := FileName;

  Height := Msg.Top + Msg.Height + 25 + Panel1.Height;

  Msg.Caption := Format(SAVE_TEMPLATE, [AName]);
end;

end.
