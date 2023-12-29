unit PropertiesForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, IOUtils,
  Cod.Files, UITypes;

type
  TProperties = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox3: TGroupBox;
    RadioButton4: TRadioButton;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Edit2: TEdit;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ValidateValues(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadImageData;
  end;

var
  Properties: TProperties;

implementation

uses
  PaintForm;

{$R *.dfm}

procedure TProperties.Button1Click(Sender: TObject);
var
  W, H: integer;
begin
  try
    W := strtoint( Edit1.Text );
    H := strtoint( Edit2.Text );
  except
    messagedlg('Please enter a positive number.', mtWarning, [mbOk], 0);
    Exit;
  end;

  if RadioButton1.Checked then
    Units := TUnit.Inch
  else
  if RadioButton2.Checked then
    Units := TUnit.Cm
  else
  if RadioButton3.Checked then
    Units := TUnit.Pixel;

  Image.Width := W;
  Image.Height := H;

  MsPaint.UpdateSizing;
end;

procedure TProperties.Button3Click(Sender: TObject);
begin
  Edit1.Text := DEFAULT_WIDTH.ToString;
  Edit2.Text := DEFAULT_HEIGHT.ToString;
end;

procedure TProperties.LoadImageData;
begin
  // Image
  if TFile.Exists(FileName) then
    begin
      Label2.Caption := DateTimeToStr( TFile.GetLastWriteTime(FileName) );
      Label4.Caption := GetFileSizeInStr(FileName);
    end
  else
    begin
      Label2.Caption := 'Not Avalabile';
      Label4.Caption := 'Not Avalabile';
    end;

  Label6.Caption := GetCanvasDPI(Image.Canvas).ToString + ' DPI';

  // Size
  Edit1.Text := Image.Width.ToString;
  Edit2.Text := Image.Height.ToString;

  // Unit
  case Units of
    TUnit.Pixel: RadioButton3.Checked := true;
    TUnit.Cm: RadioButton2.Checked := true;
    TUnit.Inch: RadioButton1.Checked := true;
  end;
end;

procedure TProperties.ValidateValues(Sender: TObject);
begin
  Button1.Enabled := true;
  try
    if (strtoint(Edit1.Text) < 0) or
      (strtoint(Edit2.Text) < 0) then
        Button1.Enabled := false;
  except
    Button1.Enabled := false;
  end;
end;

end.
