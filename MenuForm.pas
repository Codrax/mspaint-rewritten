unit MenuForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Cod.Visual.Button, Vcl.Imaging.pngimage, Shellapi, SaveForm, Registry,
  PropertiesForm, UITypes, IOUtils;

type
  TWallpaperStyle = (wsFill, wsCenter, wsTiled);

  TMenuPopup = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    HideTimer: TTimer;
    Panel6: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label2: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label1: TLabel;
    SpeedButton7: TSpeedButton;
    Label3: TLabel;
    SpeedButton8: TSpeedButton;
    Label4: TLabel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label5: TLabel;
    Panel7: TPanel;
    Label6: TLabel;
    Panel8: TPanel;
    Menu_Recents: TPanel;
    Menu_SaveAs: TPanel;
    Menu_Print: TPanel;
    Menu_Background: TPanel;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    Label13: TLabel;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    Label14: TLabel;
    SpeedButton19: TSpeedButton;
    Label15: TLabel;
    SpeedButton20: TSpeedButton;
    Label17: TLabel;
    SpeedButton21: TSpeedButton;
    procedure FormDeactivate(Sender: TObject);
    procedure HideTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItemClick(Sender: TObject);
    procedure SpeedButton2MouseEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure WallpaperTypeSelect(Sender: TObject);
    procedure RecentItemClick(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
  private
    { Private declarations }
    procedure SlowHide;

    procedure CheckChanges;

    procedure LoadRecents;
  public
    { Public declarations }
  end;

const
  SPI_SETDESKWALLPAPER = $0014;
  SPIF_UPDATEINIFILE = $01;
  SPIF_SENDCHANGE = $02;

var
  MenuPopup: TMenuPopup;

implementation

uses
  PaintForm;

{$R *.dfm}

procedure TMenuPopup.CheckChanges;
begin
  if ChangesUnsaved then
    begin
      Save.PrepareDialog(FileName);
      case Save.ShowModal of
        mrYes: MsPaint.SaveFileOptional();
        mrCancel: Abort;
      end;
    end;
end;

procedure TMenuPopup.FormCreate(Sender: TObject);
begin
  Menu_Recents.BringToFront;
end;

procedure TMenuPopup.FormDeactivate(Sender: TObject);
begin
  SlowHide;
end;

procedure TMenuPopup.FormShow(Sender: TObject);
begin
  AlphaBlendValue := 255;

  // Recent
  LoadRecents;
end;

procedure TMenuPopup.HideTimerTimer(Sender: TObject);
begin
  if (Self = nil) or not Visible then
    begin
      HideTimer.Enabled := false;
      Exit;
    end;

  AlphaBlendValue := AlphaBlendValue - 5;

  if AlphaBlendValue = 0 then
    begin
      Hide;
      HideTimer.Enabled := false;
    end;
end;

procedure TMenuPopup.LoadRecents;
var
  I: Integer;
begin
  for I := Menu_Recents.ControlCount-1 downto 0 do
    Menu_Recents.Controls[I].Destroy;

  for I := RecentFiles.Count -1 downto 0 do
    with TSpeedButton.Create(Menu_Recents) do
      begin
        Parent := Menu_Recents;

        Caption := '&' + I.ToString + '   ' + ExtractFilename( RecentFiles[I] );
        Tag := I;

        Margin := 5;
        Flat := true;
        Align := alTop;

        OnClick := RecentItemClick;
      end;
end;

procedure TMenuPopup.SlowHide;
begin
  HideTimer.Enabled := true;
end;

procedure SetWallpaper(const FileName: string; Style: TWallpaperStyle);
var
  WallpaperStyle: string;
  Reg: TRegistry;
begin
  case Style of
    wsFill:
      begin
        WallpaperStyle := '10'; // Wallpaper style for "Fill"
        Reg := TRegistry.Create;
        try
          Reg.RootKey := HKEY_CURRENT_USER;
          if Reg.OpenKey('Control Panel\Desktop', False) then
          begin
            Reg.WriteString('WallpaperStyle', WallpaperStyle);
            Reg.WriteString('TileWallpaper', '0');
            Reg.CloseKey;
          end;
        finally
          Reg.Free;
        end;
        SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, PChar(FileName),
          SPIF_UPDATEINIFILE or SPIF_SENDCHANGE);
      end;
    wsCenter:
      begin
        WallpaperStyle := '1'; // Wallpaper style for "Center"
        Reg := TRegistry.Create;
        try
          Reg.RootKey := HKEY_CURRENT_USER;
          if Reg.OpenKey('Control Panel\Desktop', False) then
          begin
            Reg.WriteString('WallpaperStyle', WallpaperStyle);
            Reg.WriteString('TileWallpaper', '0');
            Reg.CloseKey;
          end;
        finally
          Reg.Free;
        end;
        SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, PChar(FileName),
          SPIF_UPDATEINIFILE or SPIF_SENDCHANGE);
      end;
    wsTiled:
      begin
        WallpaperStyle := '0'; // Wallpaper style for "Tiled"
        Reg := TRegistry.Create;
        try
          Reg.RootKey := HKEY_CURRENT_USER;
          if Reg.OpenKey('Control Panel\Desktop', False) then
          begin
            Reg.WriteString('WallpaperStyle', WallpaperStyle);
            Reg.WriteString('TileWallpaper', '1');
            Reg.CloseKey;
          end;
        finally
          Reg.Free;
        end;
        SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, PChar(FileName),
          SPIF_UPDATEINIFILE or SPIF_SENDCHANGE);
      end;
  end;
end;
procedure TMenuPopup.WallpaperTypeSelect(Sender: TObject);
var
  Mode: TWallpaperStyle;
begin
  // Wallpaper
  if not FileSaved then
    case messagedlg('You must save the file before choosing it as desktop background.', mtWarning, [mbOk, mbCancel], 0) of
      mrOk: MenuItemClick(SpeedButton3);
    end
  else
    begin
      Mode := TWallpaperStyle(TSpeedButton(Sender).Tag);

      SetWallpaper(FileName, Mode);
    end;

  // Close
  SlowHide;
end;

procedure TMenuPopup.SpeedButton18Click(Sender: TObject);
begin
  // Set Filter
  MsPaint.SavePictureDialog1.FilterIndex := TSpeedButton(Sender).Tag;
  case TSpeedButton(Sender).Tag of
    1: MsPaint.SavePictureDialog1.FileName := ChangeFileExt(FileDisplayName, '.png');
    2: MsPaint.SavePictureDialog1.FileName := ChangeFileExt(FileDisplayName, '.jpeg');
    3: MsPaint.SavePictureDialog1.FileName := ChangeFileExt(FileDisplayName, '.bmp');
    4: MsPaint.SavePictureDialog1.FileName := ChangeFileExt(FileDisplayName, '.gif');
  end;


  // Execute
  MenuItemClick(SpeedButton4);
end;

procedure TMenuPopup.SpeedButton20Click(Sender: TObject);
begin
  MsPaint.TogglePrintPreview(true);

  // Close
  SlowHide;
end;

procedure TMenuPopup.SpeedButton21Click(Sender: TObject);
begin
  MsPaint.BeginPrint;

  // Close
  SlowHide;
end;

procedure TMenuPopup.SpeedButton2MouseEnter(Sender: TObject);
begin
  // Sub-Menus Show
  case TSpeedButton(Sender).Tag of
    4: Menu_SaveAs.BringToFront;
    5: Menu_Print.BringToFront;
    7: Menu_Background.BringToFront;
    else
      Menu_Recents.BringToFront;
  end;
end;

procedure TMenuPopup.MenuItemClick(Sender: TObject);
begin
  // Menu Click
  case TSpeedButton(Sender).Tag of
    1: begin
      CheckChanges;

      MsPaint.NewDocument;

      Mspaint.UpdateSizing;
    end;
    2: begin
      CheckChanges;

      MsPaint.LoadFileOptional;
    end;
    3: MsPaint.SaveFileOptional();
    4: MsPaint.SaveFileOptional(True);
    5: MsPaint.BeginPrint;
    6: ShowMessage('There is no email program associated to perform the requested action. Please install an email program or, if one is already installed, create an association in the Default Programs control panel.');
    7: WallpaperTypeSelect(SpeedButton11);
    8: begin
      SlowHide;
      Properties := TProperties.Create(Self);
      try
        Properties.LoadImageData;
        Properties.ShowModal;
      finally
        Properties.Free;
      end;
    end;
    9: Shellapi.ShellAbout(Handle, 'Paint', '', Application.Icon.Handle);
    10: Application.MainForm.Close;
  end;

  SlowHide;
end;

procedure TMenuPopup.RecentItemClick(Sender: TObject);
var
  AName: string;
begin
  // Select
  CheckChanges;

  AName := RecentFiles[TSpeedButton(Sender).Tag];

  if not TFile.Exists(AName) then
    messagedlg(AName + ' was not found.', mtWarning, [mbOk], 0)
  else
    begin
      FileName := AName;
      MsPaint.LoadFile;
      MsPaint.UpdateSizing;


      // Close
      SlowHide;
    end;
end;

end.
