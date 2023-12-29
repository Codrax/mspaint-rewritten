unit PaintForm;
{$SCOPEDENUMS ON}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.BaseImageCollection,
  Vcl.ImageCollection, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.TitleBarCtrls, Vcl.PlatformDefaultStyleActnCtrls, System.Actions,
  Vcl.ActnList, Vcl.StdActns, Vcl.ExtActns, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Cod.Visual.Button, Cod.VarHelpers,
  Cod.Files, Types, Cod.Graphics, Cod.Math, MenuForm, FullscreenForm,
  Thumbnailform, Vcl.ExtDlgs, SaveForm, UITypes, Cod.ColorUtils, Cod.StringUtils,
  Cod.Types, Cod.SysUtils, Vcl.Clipbrd, Cod.SysExtras, Cod.ByteUtils,
  Imaging.jpeg, Imaging.GIFImg, IniFiles, IOUtils, PropertiesForm,
  Vcl.Menus, Math, Cod.Dialogs.PrintDlg;

type
  TToolType = (None, Select, Pencil, Fill, Text, Eraser, ColorPick, Zoom, Brush, Shape);
  TSelectionMode = (None, Creating, Exists);
  TSelectionType = (Rectangular, FreeForm);
  TCloseMode = (Succeed, Fail, Escape);
  TImageType = (Bitmap, PNG, Jpeg, Gif);
  TCornerPos = (TopLeft, TopRight, BottomLeft, BottomRight);
  TUnit = (Pixel, Cm, Inch);

  TMsPaint = class(TForm)
    ActionManager1: TActionManager;
    Action1: TAction;
    TitleBarPanel1: TTitleBarPanel;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    VirtualImageList16: TVirtualImageList;
    ImageCollection1: TImageCollection;
    ToolBar16: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar: TPanel;
    PaintBox2: TPaintBox;
    PaintBox3: TPaintBox;
    PaintBox4: TPaintBox;
    PaintBox5: TPaintBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    CButton1: CButton;
    Panel4: TPanel;
    Page_Home: TPanel;
    Panel5: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Page_View: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Panel6: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel7: TPanel;
    Panel8: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel15: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Panel16: TPanel;
    SpeedButton10: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Label18: TLabel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Panel20: TPanel;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    Label19: TLabel;
    SpeedButton17: TSpeedButton;
    Panel21: TPanel;
    Panel22: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    Label22: TLabel;
    Panel26: TPanel;
    SpeedButton19: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    CanvasHolder: TPanel;
    DrawBox: TPaintBox;
    PaintBox7: TPaintBox;
    PaintBox8: TPaintBox;
    SavePictureDialog1: TSavePictureDialog;
    CornerSize: TShape;
    LeftSize: TShape;
    TopSize: TShape;
    DotsSize: TShape;
    SizePreview: TTimer;
    Title: TLabel;
    PaintBox1: TPaintBox;
    Page_Text: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    Panel33: TPanel;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    Panel34: TPanel;
    Panel35: TPanel;
    Font_List: TComboBox;
    Font_Size: TComboBox;
    Font_Bold: TSpeedButton;
    Font_Italic: TSpeedButton;
    Font_Underline: TSpeedButton;
    Font_Striked: TSpeedButton;
    CanvasUpdater: TTimer;
    InvisibleEdit: TMemo;
    OpenPictureDialog1: TOpenPictureDialog;
    ImageList1: TImageList;
    Text_View: TLabel;
    Label23: TLabel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    SpeedButton26: TSpeedButton;
    ColorPicker: TPanel;
    Panel37: TPanel;
    Label26: TLabel;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    SpeedButton33: TSpeedButton;
    Label27: TLabel;
    Colors_Container: TPanel;
    Panel42: TPanel;
    SpeedButton8: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton40: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton42: TSpeedButton;
    Panel43: TPanel;
    SpeedButton43: TSpeedButton;
    SpeedButton44: TSpeedButton;
    SpeedButton45: TSpeedButton;
    SpeedButton46: TSpeedButton;
    SpeedButton47: TSpeedButton;
    SpeedButton48: TSpeedButton;
    SpeedButton49: TSpeedButton;
    SpeedButton50: TSpeedButton;
    SpeedButton51: TSpeedButton;
    SpeedButton52: TSpeedButton;
    Panel44: TPanel;
    SpeedButton53: TSpeedButton;
    SpeedButton54: TSpeedButton;
    SpeedButton55: TSpeedButton;
    SpeedButton56: TSpeedButton;
    SpeedButton57: TSpeedButton;
    SpeedButton58: TSpeedButton;
    SpeedButton59: TSpeedButton;
    SpeedButton60: TSpeedButton;
    SpeedButton61: TSpeedButton;
    SpeedButton62: TSpeedButton;
    SpeedButton63: TSpeedButton;
    ColorDialog1: TColorDialog;
    Label28: TLabel;
    Label29: TLabel;
    Panel36: TPanel;
    Panel41: TPanel;
    Panel46: TPanel;
    SpeedButton66: TSpeedButton;
    SpeedButton67: TSpeedButton;
    Label30: TLabel;
    Panel45: TPanel;
    Panel47: TPanel;
    CheckBox4: TCheckBox;
    Panel48: TPanel;
    Panel49: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton64: TSpeedButton;
    SpeedButton65: TSpeedButton;
    SpeedButton68: TSpeedButton;
    SpeedButton69: TSpeedButton;
    SpeedButton70: TSpeedButton;
    SpeedButton71: TSpeedButton;
    Panel50: TPanel;
    SpeedButton72: TSpeedButton;
    SpeedButton73: TSpeedButton;
    Panel51: TPanel;
    Panel52: TPanel;
    SpeedButton74: TSpeedButton;
    SpeedButton75: TSpeedButton;
    SpeedButton76: TSpeedButton;
    SpeedButton77: TSpeedButton;
    SpeedButton78: TSpeedButton;
    SpeedButton79: TSpeedButton;
    SpeedButton80: TSpeedButton;
    SpeedButton81: TSpeedButton;
    SpeedButton82: TSpeedButton;
    SpeedButton83: TSpeedButton;
    Panel53: TPanel;
    PaintBox9: TPaintBox;
    TrackBar2: TTrackBar;
    ActionCopy: TAction;
    ActionCut: TAction;
    ActionSelectAll: TAction;
    ActionPasteClipboard: TAction;
    ActionClipboardFile: TAction;
    Panel54: TPanel;
    SpeedButton84: TSpeedButton;
    SpeedButton85: TSpeedButton;
    Panel55: TPanel;
    SpeedButton86: TSpeedButton;
    Panel56: TPanel;
    Panel57: TPanel;
    SpeedButton87: TSpeedButton;
    SpeedButton88: TSpeedButton;
    SpeedButton89: TSpeedButton;
    Panel58: TPanel;
    SpeedButton90: TSpeedButton;
    SpeedButton91: TSpeedButton;
    SpeedButton92: TSpeedButton;
    SpeedButton93: TSpeedButton;
    SpeedButton94: TSpeedButton;
    Panel59: TPanel;
    SpeedButton95: TSpeedButton;
    SpeedButton96: TSpeedButton;
    SpeedButton97: TSpeedButton;
    SpeedButton98: TSpeedButton;
    BrushTick: TTimer;
    SpeedButton99: TSpeedButton;
    Panel60: TPanel;
    PaintBox6: TPaintBox;
    Label1: TLabel;
    Label3: TLabel;
    TrackBar1: TTrackBar;
    CButton2: CButton;
    CButton3: CButton;
    CPrintDialog1: CPrintDialog;
    ActionPrint: TAction;
    PaintBox10: TPaintBox;
    Page_Print: TPanel;
    Label2: TLabel;
    Label31: TLabel;
    Panel62: TPanel;
    SpeedButton100: TSpeedButton;
    SpeedButton101: TSpeedButton;
    SpeedButton102: TSpeedButton;
    Panel63: TPanel;
    Panel64: TPanel;
    SpeedButton103: TSpeedButton;
    Panel65: TPanel;
    Panel66: TPanel;
    SpeedButton105: TSpeedButton;
    SpeedButton106: TSpeedButton;
    Panel67: TPanel;
    Label32: TLabel;
    ImageList2: TImageList;
    PopupMenu1: TPopupMenu;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N1: TMenuItem;
    Crop1: TMenuItem;
    SelectAll1: TMenuItem;
    Delete1: TMenuItem;
    N2: TMenuItem;
    Rotate1: TMenuItem;
    Flip1: TMenuItem;
    InvertColor1: TMenuItem;
    RotateRight1: TMenuItem;
    Rotateright901: TMenuItem;
    Rotate1801: TMenuItem;
    FlipHorizonta1: TMenuItem;
    FlipVertical1: TMenuItem;
    SpeedButton104: TSpeedButton;
    ImageList3: TImageList;
    AnimateKeys: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure ClickPB(Sender: TObject);
    procedure ExpandFile(Sender: TObject);
    procedure PaintBox5Paint(Sender: TObject);
    procedure ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure DrawBoxPaint(Sender: TObject);
    procedure DrawBoxMouseLeave(Sender: TObject);
    procedure DrawBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TrackBar1Change(Sender: TObject);
    procedure SelectTool(Sender: TObject);
    procedure DrawBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DrawBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CanvasHolderMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox7Paint(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure CButton2Click(Sender: TObject);
    procedure CButton3Click(Sender: TObject);
    procedure SaveActionExecute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure InitiateResize(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FinishResize(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SizePreviewTimer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Font_ListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure InvisibleEditChange(Sender: TObject);
    procedure Font_SizeExit(Sender: TObject);
    procedure Font_SizeChange(Sender: TObject);
    procedure Font_BoldClick(Sender: TObject);
    procedure InvisibleEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InvisibleEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CanvasUpdaterTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton15Click(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure ColorSelect(Sender: TObject);
    procedure SpeedButton63Click(Sender: TObject);
    procedure SpeedButton66Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure CButton1Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure ShapeSelect(Sender: TObject);
    procedure ButtonPressRepaint(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure Z(Sender: TObject);
    procedure PaintBox9Paint(Sender: TObject);
    procedure CopyCut(Sender: TObject);
    procedure ActionCopyExecute(Sender: TObject);
    procedure ActionCutExecute(Sender: TObject);
    procedure ActionSelectAllExecute(Sender: TObject);
    procedure ActionPasteClipboardExecute(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ActionClipboardFileExecute(Sender: TObject);
    procedure SpeedButton84Click(Sender: TObject);
    procedure SpeedButton85Click(Sender: TObject);
    procedure HideMiniPanel(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton88Click(Sender: TObject);
    procedure SpeedButton89Click(Sender: TObject);
    procedure SpeedButton87Click(Sender: TObject);
    procedure SpeedButton86Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton90Click(Sender: TObject);
    procedure MoveOnDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SelectBrush(Sender: TObject);
    procedure BrushTickTimer(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure PrinterPrint(Sender: TObject);
    procedure SpeedButton103Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure InvertColor1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure RotateRight1Click(Sender: TObject);
    procedure Rotateright901Click(Sender: TObject);
    procedure Rotate1801Click(Sender: TObject);
    procedure FlipVertical1Click(Sender: TObject);
    procedure FlipHorizonta1Click(Sender: TObject);
    procedure TrackBar1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AnimateKeysTimer(Sender: TObject);
  private
    { Private declarations }
    procedure SelectPanel(Index: integer);
  public
    { Public declarations }
    procedure SaveFile;
    procedure LoadFile;
    procedure UpdateFileSize;
    procedure SaveFileOptional(SaveAs: boolean = false);
    procedure LoadFileOptional;

    // Painting
    function GetSizeRect(ID: integer; Inflate: integer = 0): TRect;
    procedure DrawShapeCanvas(Canvas: TCanvas; ARect: TRect; Index: integer; Finale: boolean = false);
    procedure PastePicture(Picture: TBitMap; Location: TPoint);
    procedure DrawStolen(Canvas: TCanvas; ARect: TRect);

    // Scale
    function ScaleToCanvas(P: TPoint): TPoint;

    // File
    procedure NewDocument;

    // UI
    procedure ClearAllSelect(Exception: TSpeedButton);
    procedure LoadColorIcons(Search: TPanel);
    function GetColorTag(Tag: integer): TColor;
    procedure AddColorHistory(AColor: TColor);
    procedure HideMiniPanels;

    // Data
    function GetUnit: string;
    function ConvertUnit(Value: integer): string;

    // Tool
    procedure ChangeTool(ATool: TToolType);
    procedure ToggleTextPage(Enabled: boolean);

    // Cornet
    function GetCorner(ARect: TRect; APoint: TPoint): TCornerPos;
    function GetPoint(ARect: TRect; Corner: TCornerPos): TPoint;

    // Font
    procedure ApplyFontStyling(Font: TFont);

    // Scale
    function ReverseScale: real;
    function IsZoomExtend: boolean;

    // History
    procedure CacheNew;
    procedure ResetHistory;
    
    procedure DoUndo;
    procedure DoRedo;

    procedure LoadHistory(Position: integer);

    // Selection
    function MouseOverSelection: boolean;
    function SelectionSupportsMoving: boolean;
    procedure FinishSelection(CloseMode: TCloseMode = TCloseMode.Succeed);

    procedure StealSelectionZone;
    procedure FillSelectionZone;

    procedure CalculateFreeForm;
    procedure FinaliseFreeForm;

    procedure TranslateScale;
    procedure FlipSelectionSize;

    procedure ApplyTransparent;

    function GetTopmostPoint: TPoint;

    // Printing
    procedure BeginPrint;
    procedure TogglePrintPreview(Enter: boolean);

    // Settings
    procedure UserSettings(Load: boolean);

    // Update
    procedure UpdateCanvasDrawn;

    procedure UpdateRectSize;
    procedure UpdateColorIcons;

    procedure UpdateSizing;
    procedure UpdateCanvas;
    procedure UpdateRulers;
  end;

  function GetCanvasDPI(Canvas: TCanvas): Integer;
  procedure RotateBitmap90Degrees(var Bitmap: TBitmap);
  procedure RotateBitmapNegative90Degrees(var Bitmap: TBitmap);

const
  LINE_SPACING = 10;
  MAX_UNDO = 50;

  DEFAULT_WIDTH = 1030;
  DEFAULT_HEIGHT = 552;

  TRANSPARENT_COLOR = $002A414A;

var
  MsPaint: TMsPaint;

  DEFAULT_COLORS: array[1..20] of CRGB = (
    (R:0; G:0; B:0),
    (R:127; G:127; B:127),
    (R:136; G:0; B:21),
    (R:255; G:0; B:0),
    (R:255; G:127; B:39),
    (R:255; G:242; B:0),
    (R:34; G:177; B:76),
    (R:0; G:162; B:232),
    (R:63; G:72; B:204),
    (R:163; G:73; B:164),

    (R:255; G:255; B:255),
    (R:195; G:195; B:195),
    (R:185; G:122; B:87),
    (R:255; G:174; B:201),
    (R:255; G:201; B:14),
    (R:239; G:228; B:176),
    (R:181; G:230; B:29),
    (R:153; G:217; B:234),
    (R:112; G:146; B:190),
    (R:200; G:191; B:231)
    );

  // System
  AppData: string;

  RecentFiles: TStringList;

  // Buttons
  SelectedTop: integer = 1;
  MenuOutline: TColor = clAppWorkSpace;

  // File
  FileName: string;
  FileDisplayName: string = 'Untitled';
  FileSaved: boolean;
  ChangesUnsaved: boolean;

  // Sizes
  PenSize: integer = 1;
  EraserSize: integer = 5;
  ShapePen: integer = 4;
  BrushSize: integer = 4;
  FillShape: boolean;
  EnableOutline: boolean;

  Units: TUnit = TUnit.Pixel;

  // Colors
  PrimaryColor: TColor = clBlack;
  SecondaryColor: TColor = clWhite;

  ColorHistory: array[1..10] of TColor;
  DrawColor: TColor;

  // Image
  Image: TBitMap;

  ADPI: integer;

  // History
  History: TArray<TBitMap>;
  DoPos: integer;

  // Move
  StolenZone: TBitMap;
  TransparentSelection: boolean;

  // Zoom
  ZoomRect: TRect;

  // Tools
  Tool: TToolType = TToolType.Select;

  // Move
  KeyOffset: TPoint;

  // Selection
  SelectMode: TSelectionMode;

  SelectionCanvas: TRect;
  SelectionImage: TRect;
  SelectionType: TSelectionType;

  // FreeFormRect: TRect; uses SelectionCanvas and SelectionImage
  FreeFormBorder: TArray<TArray<boolean>>;
  FreeFormSelection: TArray<TArray<boolean>>;
  FreeFormLines: TArray<TRect>;
  FreeFormPoints: integer;

  MoveOffsetCanvas: TPoint;
  MoveOffsetImage: TPoint;

  CornerStart: TCornerPos;
  CornerEnd: TCornerPos;
  DrawingPoints: TPoints;
  PointIndex: integer = -1;

  StartedMoving: boolean;
  SizePoint: integer = -1;

  ShapeID: integer;

  // Brush
  BrushID: integer = 0;

  // Text Editor
  DrawText: string;

  // Canvas settings
  Scale: real = 1;

  MouseOnCanvas: boolean;
  CanvasMouseDown: boolean;
  DownButton: TMouseButton;

  DownCanvas: TPoint;
  DownImage: TPoint;

  LastDownCanvas: TPoint;
  LastDownImage: TPoint;

  PositionCanvas: TPoint;
  PositionImage: TPoint;

  LastValidPointImage: TPoint;

implementation

{$R *.dfm}

function GetCanvasDPI(Canvas: TCanvas): Integer;
var
  DC: HDC;
begin
  DC := Canvas.Handle;
  Result := GetDeviceCaps(DC, LOGPIXELSX); // or LOGPIXELSY, both axes have the same DPI
end;

procedure TMsPaint.FinishSelection(CloseMode: TCloseMode);
var
  ADone: boolean;
begin
  // No Selection
  if SelectMode <> TSelectionMode.Exists then
    Exit;

  // Status
  SelectMode := TSelectionMode.None;
  ToggleTextPage(False);
  Label8.Caption := '';
  StartedMoving := false;

  // Finish selection / text / shape, if there is one
  case Tool of
    TToolType.Select: begin
      ADone := false;
      case CloseMode of
        TCloseMode.Succeed: ADone := true;
        TCloseMode.Escape: begin
            if false then

            else
              ADone := true;
        end;
      end;

      // Done
      if ADone then
        DrawStolen(Image.Canvas, SelectionImage);

      // Free
      StolenZone.Free;

      // Update Changed
      UpdateCanvasDrawn;
    end;

    TToolType.Text: begin
      InvisibleEdit.Width := 0;

      if CloseMode = TCloseMode.Succeed then
        with Image.Canvas do
          begin
            Brush.Color := SecondaryColor;
            if SpeedButton67.Down then
              Brush.Style := bsClear
            else
              Brush.Style := bsSolid;

            ApplyFontStyling(Font);

            TextRect(SelectionImage, DrawText, [tfWordBreak]);

            // Update Changed
            UpdateCanvasDrawn;
          end;
    end;

    TToolType.Shape: begin
      if CloseMode = TCloseMode.Succeed then
        begin
          Image.Canvas.Pen.Width := ShapePen;
          DrawShapeCanvas(Image.Canvas, SelectionImage, ShapeID, true);

          // Update Changed
          UpdateCanvasDrawn;
        end;

      // Reset Values
      DrawingPoints := [];
      PointIndex := -1;
    end;
  end;

  // Paint
  UpdateCanvas;
end;

procedure TMsPaint.FlipHorizonta1Click(Sender: TObject);
begin
  StolenZone.Canvas.StretchDraw(Rect(0, StolenZone.Height, StolenZone.Width, 0), StolenZone);

  UpdateCanvas;
end;

procedure TMsPaint.FlipSelectionSize;
var
  Previous: integer;
begin
  // Selection
  Previous := SelectionCanvas.Width;
  SelectionCanvas.Width := SelectionCanvas.Height;
  SelectionCanvas.Height := Previous;

  // Image
  Previous := SelectionImage.Width;
  SelectionImage.Width := SelectionImage.Height;
  SelectionImage.Height := Previous;
end;

procedure TMsPaint.FlipVertical1Click(Sender: TObject);
begin
  StolenZone.Canvas.StretchDraw(Rect(StolenZone.Width, 0, 0, StolenZone.Height), StolenZone);

  UpdateCanvas;
end;

procedure TMsPaint.FillSelectionZone;
var
  I: Integer;
begin
  with Image.Canvas do
    if SelectionType = TSelectionType.Rectangular then
      begin
        Brush.Style := bsSolid;
        Brush.Color := SecondaryColor;

        FillRect(SelectionImage);
      end
    else
      begin
        Brush.Style := bsSolid;
        Brush.Color := SecondaryColor;
        
        for I := 0 to High(FreeFormLines) do
          FillRect( FreeFormLines[I] ); 
      end;
end;

procedure TMsPaint.FinaliseFreeForm;
var
  DistX, DistY, ACount: integer;
  APoint: TPoint;
  I: Integer;
begin
  if SelectionType = TSelectionType.FreeForm then
    begin
      // Finish shape
      DistX := DownImage.X - LastValidPointImage.X;
      DistY := DownImage.Y - LastValidPointImage.Y;

      // Count
      if abs(DistX) > abs(DistY) then
        ACount := abs(DistX)
      else
        ACount := abs(DistY);

      // Set pixels
      if ACount > 0 then

        for I := 0 to ACount do
          begin
            APoint.X := LastValidPointImage.X + trunc(I / ACount * DistX);
            APoint.Y := LastValidPointImage.Y + trunc(I / ACount * DistY);

            FreeFormBorder[APoint.X, APoint.Y] := true;
          end;
    end;
end;

procedure TMsPaint.FinishResize(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  AWidth, AHeight: integer;
  PrevWidth, PrevHeight: integer;
  ARect: TRect;
begin
  // UI
  CornerSize.Show;
  LeftSize.Show;
  TopSize.Show;

  DotsSize.Hide;

  // Canceled
  if SizePreview.Enabled then
    begin
      // Finalise
      SizePreview.Enabled := false;

      PrevWidth := Image.Width;
      PrevHeight := Image.Height;

      AWidth := round((DotsSize.Width - 4) * ReverseScale);
      AHeight := round((DotsSize.Height - 4) * ReverseScale);

      if (AWidth > 0) and (AHeight > 0) then
        begin
          Image.SetSize(AWidth, AHeight);

          // Fill Extended Zones
          with Image.Canvas do
            begin
              Pen.Style := psClear;
              Brush.Style := bsSolid;
              Brush.Color := SecondaryColor;

              ARect := Rect(PrevWidth, 0, AWidth, AHeight);
              FillRect(ARect);

              ARect := Rect(0, PrevHeight, AWidth, AHeight);
              FillRect(ARect);
            end;
        end;
    end;

  // Update
  UpdateSizing;
end;

procedure TMsPaint.Font_BoldClick(Sender: TObject);
begin
  UpdateCanvas;
end;

procedure TMsPaint.Font_ListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  AText: string;
begin
  // Draw
  with TComboBox(Control).Canvas do
    begin
      Brush.Color := TComboBox(Control).Color;
      FillRect(Rect);

      AText := TComboBox(Control).Items[Index];

      Font.Color := clBlack;
      Font.Name := AText;
      Font.Size := 11;

      DrawTextRect(TComboBox(Control).Canvas, Rect, AText, [TTextFlag.VerticalCenter]);
    end;
end;

procedure TMsPaint.Font_SizeChange(Sender: TObject);
begin
  UpdateCanvas;
end;

procedure TMsPaint.Font_SizeExit(Sender: TObject);
begin
  try
    strtoint(Font_Size.Text);
  except
    Font_Size.Text := DrawBox.Font.Size.ToString;
  end;
end;

procedure TMsPaint.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ChangesUnsaved then
    begin
      Save := TSave.Create(Self);
      try
        Save.PrepareDialog(FileName);
        case Save.ShowModal of
          mrYes: SaveFileOptional();
          mrCancel: CanClose := false;
        end;
      finally
        Save.Free;
      end;
    end;

  // Settings
  UserSettings(false);

  // Position
  FormPositionSettings(Self, AppData + 'Configuration.ini', false);
end;

procedure TMsPaint.FormCreate(Sender: TObject);
var
  I: Integer;
  S: string;
begin
  // UI
  SelectPanel(1);

  // Prepare
  NewDocument;

  // Recent
  RecentFiles := TStringList.Create;
  
  // Reset History
  ResetHistory;

  AppData := GetPathInAppData('MsPaint', false);

  // Update
  UpdateSizing;

  // Colors
  for I := Low(ColorHistory) to High(ColorHistory) do
    ColorHistory[I] := clWhite;

  ADPI := GetCanvasDPI(Image.Canvas);

  // UI
  UpdateColorIcons;
  LoadColorIcons(Colors_Container);

  // Settings
  try
    UserSettings(true);

    FormPositionSettings(Self, AppData + 'Configuration.ini', true);
  except

  end;

  // Load File
  for I := 1 to ParamCount do
    begin
      S := GetParameter(I);

      if TFile.Exists(S) then
        begin
          FileName := S;
          LoadFile;
        end;
    end;

  // Fonts
  Font_List.Items := Screen.Fonts;
  Font_List.ItemIndex := Font_List.Items.IndexOf('Calibri');
  if Font_List.ItemIndex = -1 then
    Font_List.ItemIndex := 0;

  // Cool buttons
  SpeedButton11.Caption := SpeedButton11.Caption + #13'▼';
  SpeedButton14.Caption := SpeedButton14.Caption + #13'▼';
  SpeedButton22.Caption := SpeedButton22.Caption + #13'▼';
  SpeedButton26.Caption := SpeedButton26.Caption + #13'▼';
  SpeedButton27.Caption := SpeedButton27.Caption + #13'1';
  SpeedButton28.Caption := SpeedButton28.Caption + #13'2';
  SpeedButton33.Caption := SpeedButton33.Caption + #13'Paint 3D';
  SpeedButton63.Caption := SpeedButton63.Caption + #13'colors';
  SpeedButton103.Caption := SpeedButton103.Caption + #13'preview';
end;

procedure TMsPaint.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    46: begin
      if Tool <> TToolType.Text then
        FinishSelection(TCloseMode.Fail);
    end;
    37..40: begin
      if not (GetKeyState(Key) < 0) or (Tool = TToolType.Text) then
        Exit;

      KeyOffset := Point(0, 0);

      case Key of
        37: KeyOffset.X := -1;
        38: KeyOffset.Y := -1;
        39: KeyOffset.X := 1;
        40: KeyOffset.Y := 1;
      end;

      AnimateKeys.Enabled := true;
      AnimateKeys.OnTimer(AnimateKeys);
    end;
  end;
end;

procedure TMsPaint.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #27: begin
      // Selection Item
      FinishSelection(TCloseMode.Escape);

      // Re-Sizer
      if SizePreview.Enabled then
        begin
          SizePreview.Enabled := false;

          FinishResize(nil, mbLeft, [], 0, 0);
        end;
    end;
  end;
end;

procedure TMsPaint.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  AnimateKeys.Enabled := false;
end;

function TMsPaint.GetColorTag(Tag: integer): TColor;
begin
  if Tag <= 20 then
    Result := DEFAULT_COLORS[Tag].ToColor
  else
    Result := ColorHistory[Tag-20];
end;

function TMsPaint.GetCorner(ARect: TRect; APoint: TPoint): TCornerPos;
begin
  Result := TCornerPos.TopLeft;
  if APoint = ARect.TopLeft then
    Result := TCornerPos.TopLeft
  else
  if APoint = ARect.BottomRight then
    Result := TCornerPos.BottomRight
  else
  if APoint = Point(ARect.Right, ARect.Top) then
    Result := TCornerPos.TopRight
  else
  if APoint = Point(ARect.Left, ARect.Bottom) then
    Result := TCornerPos.BottomLeft;
end;

function TMsPaint.GetPoint(ARect: TRect; Corner: TCornerPos): TPoint;
begin
  case Corner of
    TCornerPos.TopLeft: Result := ARect.TopLeft;
    TCornerPos.TopRight: Result := Point(ARect.Right, ARect.Top);
    TCornerPos.BottomLeft: Result := Point(ARect.Left, ARect.Bottom);
    TCornerPos.BottomRight: Result := ARect.BottomRight;
  end;
end;

function TMsPaint.GetSizeRect(ID: integer; Inflate: integer): TRect;
begin
  case ID of
    1: Result := TRect.Create(SelectionCanvas.TopLeft);
    2: Result := TRect.Create(Point(SelectionCanvas.CenterPoint.X, SelectionCanvas.Top));
    3: Result := TRect.Create(Point(SelectionCanvas.Right, SelectionCanvas.Top));

    4: Result := TRect.Create(Point(SelectionCanvas.Left, SelectionCanvas.CenterPoint.Y));
    5: Result := TRect.Create(Point(SelectionCanvas.Right, SelectionCanvas.CenterPoint.Y));

    6: Result := TRect.Create(Point(SelectionCanvas.Left, SelectionCanvas.Bottom));
    7: Result := TRect.Create(Point(SelectionCanvas.CenterPoint.X, SelectionCanvas.Bottom));
    8: Result := TRect.Create(SelectionCanvas.BottomRight);
  end;

  Result.Inflate(3+Inflate,3+Inflate);
end;

function TMsPaint.GetTopmostPoint: TPoint;
begin
  Result.X := ScrollBox1.HorzScrollBar.Position;
  Result.Y := ScrollBox1.VertScrollBar.Position;

  Result.X := round(Result.X * ReverseScale); 
  Result.Y := round(Result.Y * ReverseScale); 
end;

function TMsPaint.GetUnit: string;
begin
  case Units of
    TUnit.Pixel: Exit('px');
    TUnit.Cm: Exit('cm');
    TUnit.Inch: Exit('in');
  end;
end;

procedure TMsPaint.InitiateResize(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // Hide others
  CornerSize.Hide;
  LeftSize.Hide;
  TopSize.Hide;

  // Show self
  TShape(Sender).Show;

  // Prepare
  DotsSize.Show;
  DotsSize.Left := CanvasHolder.Left;
  DotsSize.Top := CanvasHolder.Top;
  DotsSize.Width := round(Image.Width * Scale) + 4;
  DotsSize.Height := round(Image.Height * Scale) + 4;

  SizePreview.Enabled := true;
  SizePreview.Tag := TShape(Sender).Tag;
end;

function TMsPaint.IsZoomExtend: boolean;
begin
  Result := (CanvasHolder.Width > ScrollBox1.Width) or (CanvasHolder.Height > ScrollBox1.Height);
end;

procedure TMsPaint.LoadColorIcons(Search: TPanel);
var
  I: Integer;
  ARect: TRect;
begin
  for I := 0 to Search.ControlCount-1 do
    begin
      if Search.Controls[I] is TPanel then
        LoadColorIcons( TPanel(Search.Controls[I]) );

      if Search.Controls[I] is TSpeedButton then
        with TSpeedButton(Search.Controls[I]) do
          begin
            Glyph.SetSize(25, 25);
            with Glyph.Canvas do
              begin
                ARect := ClipRect;
                ARect.Inflate(-2, -2, -1, -1);

                Pen.Color := clGray;
                Brush.Color := clWhite;
                Rectangle(ARect);

                ARect.Inflate(-1, -1);
                Pen.Color := clWhite;
                Brush.Color := GetColorTag(Tag);
                if Brush.Color = 0 then
                  Brush.Color := 1;
                Rectangle(ARect);
              end;
          end;
    end;
end;

procedure TMsPaint.LoadFile;
begin
  LoadGraphicAsBitmap(FileName, Image);

  // Clear any work
  FinishSelection(TCloseMode.Fail);

  // History
  ResetHistory;

  // Status
  FileSaved := true;
  ChangesUnsaved := false;

  // Update
  UpdateFileSize;
  UpdateSizing;
end;

procedure TMsPaint.LoadFileOptional;
var
  I: integer;
begin
  if OpenPictureDialog1.Execute then
    begin
      FileName := OpenPictureDialog1.FileName;

      // Save
      LoadFile;

      // Recent
      I := RecentFiles.IndexOf(FileName);
      if I <> -1 then
        RecentFiles.Delete(I);

      RecentFiles.Add(FileName);

      while RecentFiles.Count > 20 do
        RecentFiles.Delete(0);
    end;
end;

procedure TMsPaint.LoadHistory(Position: integer);
begin
  Image.Assign(History[Position]);
  DoPos := Position;

  UpdateSizing;
end;

function TMsPaint.MouseOverSelection: boolean;
begin
  Result := SelectionCanvas.Contains(PositionCanvas) and (SelectMode = TSelectionMode.Exists);
end;

procedure TMsPaint.MoveOnDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Self.Handle, WM_NCLBUTTONDOWN, HTCAPTION, 0);
end;

procedure TMsPaint.NewDocument;
begin
  if Image <> nil then
    Image.Free;
  Image := TBitMap.Create(DEFAULT_WIDTH, DEFAULT_HEIGHT);

  FileName := '';
  FileDisplayName := 'Untitled';

  // Clear
  with Image.Canvas do
    begin
      Brush.Color := clWhite;
      FillRect(ClipRect);
    end;
end;

procedure TMsPaint.InvertColor1Click(Sender: TObject);
var
  X, Y: Integer;
begin
  for X := 0 to StolenZone.Width-1 do
    for Y := 0 to StolenZone.Height-1 do
      StolenZone.Canvas.Pixels[X, Y] := InvertColor(StolenZone.Canvas.Pixels[X, Y]);

  // Paint
  UpdateCanvas;
end;

procedure TMsPaint.InvisibleEditChange(Sender: TObject);
begin
  DrawText := StringClearLineBreaks(InvisibleEdit.Lines.Text, #13);
  UpdateCanvas;
end;

procedure TMsPaint.InvisibleEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CanvasUpdater.Enabled := true;
end;

procedure TMsPaint.InvisibleEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CanvasUpdater.Enabled := false;
  UpdateCanvas;
end;

procedure TMsPaint.ExpandFile(Sender: TObject);
begin
  //
  SelectPanel(0);
end;

procedure TMsPaint.PaintBox2Paint(Sender: TObject);
var
  Text: string;
  Index: integer;
  TextR, ColorR: TRect;
begin
  Index := TPaintBox(Sender).Tag;

  with TPaintBox(Sender).Canvas do
    begin
      case Index of
        0: Text := 'File';
        1: Text := 'Home';
        2: Text := 'View';
        3: Text := 'Text';
        4: Text := 'Print Preview';
      end;

      TextR := ClipRect;
      ColorR := ClipRect;

      Pen.Style := psClear;
      Pen.Width := 1;
      Font.Size := 8;

      if Index = 0 then
        begin
          Brush.Color := clHighlight;
          Font.Color := clWhite;
        end
          else
        begin
          Brush.Color := clWhite;
          Font.Color := clBlack;

          if SelectedTop = Index then
            begin
              Brush.Color := clBtnFace;
              Pen.Style := psSolid;
              Pen.Color := MenuOutline;

              ColorR.Height := ColorR.Height + 2;
            end;
        end;

      Rectangle(ColorR);
      TextRect(TextR, Text, [tfSingleLine, tfCenter, tfVerticalCenter]);
    end;
end;

procedure TMsPaint.PaintBox5Paint(Sender: TObject);
var
  BtRect: TRect;
  SizeButton: integer;
begin
  SizeButton := PaintBox2.Width;

  with TPaintBox(Sender).Canvas do
    begin
      Brush.Color := MenuOutline;
      FillRect(ClipRect);

      BtRect := ClipRect;
      BtREct.Left := SelectedTop * SizeButton;
      BtREct.Right := (SelectedTop + 1) * SizeButton;

      Brush.Color := clBtnFace;
      FillRect(BtRect);
    end;
end;

procedure TMsPaint.PaintBox7Paint(Sender: TObject);
var
  BeginFrom, Steps, StepSize, TotalSteps, LineSize: integer;
  I, Position, ASize, ATemp, ActualPosition: integer;
  MousePos: TPoint;
  Text: string;
  MouseDrawn: boolean;
  Temp: TBitMap;
begin
  Temp := TBitMap.Create;
  with TPaintBox(Sender) do
    with Temp.Canvas do
      begin
        Brush.Color := $00F8F3F1;
        Font.Color := $00A08B7B;
        Pen.Color := $00A08B7B;
        Pen.Width := 1;
        Font.Size := 8;
        MouseDrawn := false;

        Temp.Width := Width;
        Temp.Height := Height;

        // Mouse
        MousePos := ScreenToClient(Mouse.CursorPos);

        // Color
        FillRect(ClipRect);

        // Step
        StepSize := 0;
        repeat
          StepSize := StepSize + 5;
          Steps := PaintBox7.Width div StepSize;
        until Steps <= 15;

        if Tag = 0 then
          begin
            BeginFrom := PaintBox8.Width + 4;
            TotalSteps := Steps * 10;
            ASize := PaintBox7.Height;

            for I := 0 to TotalSteps do
              begin
                // Color
                Pen.Color := $00A08B7B;

                // Pos
                Position := BeginFrom + round(PaintBox7.Width / TotalSteps * I);
                ActualPosition := round((Position - BeginFrom + ScrollBox1.HorzScrollBar.Position) * ReverseScale);

                // Size
                if I mod 10 = 0 then
                  begin
                    LineSize := ASize;

                    // Text
                    Text := ConvertUnit(ActualPosition);

                    DrawTextRect(Temp.Canvas, Rect(Position, 0, Position+100, ASize), Text, [TTextFlag.VerticalCenter], 5);
                  end
                    else
                      LineSize := ASize div 5;

                // Red Line
                if not MouseDrawn and (trunc(MousePos.X / 10) = trunc(Position / 10)) then
                  begin
                    MouseDrawn := true;

                    Pen.Color := clRed;
                    LineSize := ASize;
                  end;

                // Lines
                MoveTo( Position, ASize );
                LineTo( Position, ASize-LineSize );
              end;
          end
        else
          begin
            BeginFrom := 4;
            TotalSteps := Steps * 10;
            ASize := PaintBox8.Width;

            for I := 0 to TotalSteps do
              begin
                // Color
                Pen.Color := $00A08B7B;

                // Pos
                Position := BeginFrom + round(PaintBox8.Height / TotalSteps * I);
                ActualPosition := round((Position - BeginFrom + ScrollBox1.HorzScrollBar.Position) * ReverseScale);

                // Size
                if I mod 10 = 0 then
                  begin
                    LineSize := ASize;

                    // Text
                    Text := ConvertUnit(ActualPosition);
                    Font.Orientation := 900;

                    ATemp := TextWidth(Text) + 5;
                    TextOut(0, Position+ATemp, Text);
                  end
                    else
                      LineSize := ASize div 5;

                // Red Line
                if not MouseDrawn and (trunc(MousePos.Y / 10) = trunc(Position / 10)) then
                  begin
                    MouseDrawn := true;

                    Pen.Color := clRed;
                    LineSize := ASize;
                  end;

                // Lines
                MoveTo( ASize, Position );
                LineTo( ASize-LineSize, Position );
              end;
          end;

        TPaintBox(Sender).Canvas.Draw(0, 0, Temp);
      end;

  Temp.Free;
end;

procedure TMsPaint.PaintBox9Paint(Sender: TObject);
var
  ARect: TRect;
begin
  with PaintBox9.Canvas do
    begin
      ARect := ClipRect;
      Brush.Color := Panel53.Color;
      FillRect(ARect);
    
      ARect := TRect.Empty;
      ARect.Width := round(9/10 * PaintBox9.Width);

      ARect.Height := TrackBar2.Position;

      CenterRectInRect(ARect, PaintBox9.ClientRect);

      Brush.Color := 0;
      FillRect(ARect);
    end;
end;

procedure TMsPaint.HideMiniPanel(Sender: TObject);
begin
  TPanel(Sender).Hide;
end;

procedure TMsPaint.HideMiniPanels;
begin
  Panel53.Hide;
  Panel54.Hide;
  Panel55.Hide;
  Panel58.Hide;
  Panel59.Hide;
end;

procedure TMsPaint.PastePicture(Picture: TBitMap; Location: TPoint);
begin
  //
  StolenZone := TBitMap.Create;
  StolenZone.Assign(Picture);

  // Transparent
  ApplyTransparent;

  // UpdateSize
  if Image.Width < StolenZone.Width then
    Image.Width := StolenZone.Width;
  if Image.Height < StolenZone.Height then
    Image.Height := StolenZone.Height;

  UpdateSizing;

  // Get rect
  SelectionImage := Rect(0, 0, StolenZone.Width, StolenZone.Height);
  SelectionImage.Offset(Location);

  // Translate image to canvas selection
  TranslateScale;

  // Select tool 
  SelectTool(SpeedButton13);

  // Set
  SelectMode := TSelectionMode.Exists;

  // Update
  UpdateCanvasDrawn;
end;

procedure TMsPaint.PopupMenu1Popup(Sender: TObject);
var
  HasSelect: boolean;
begin
  HasSelect := (SelectMode = TSelectionMode.Exists) and (Tool = TToolType.Select);

  Cut1.Enabled := HasSelect;
  Copy1.Enabled := HasSelect;

  Crop1.Enabled := HasSelect;
  SelectAll1.Enabled := HasSelect;
  Delete1.Enabled := HasSelect;

  Rotate1.Enabled := HasSelect;
  Flip1.Enabled := HasSelect;
  InvertColor1.Enabled := HasSelect;
end;

procedure TMsPaint.PrinterPrint(Sender: TObject);
begin
  // Print
  BeginPrint;

  TogglePrintPreview(false);
end;

procedure TMsPaint.ResetHistory;
var
  I: Integer;
begin
  for I := 0 to High(History) do
    History[I].Free;

  SetLength(History, 0);
  
  CacheNew;
end;

function TMsPaint.ReverseScale: real;
begin
  Result := 1 / Scale;
end;

procedure TMsPaint.Rotate1801Click(Sender: TObject);
begin
  RotateBitmap90Degrees(StolenZone);
  RotateBitmap90Degrees(StolenZone);

  UpdateCanvas;
end;

procedure TMsPaint.RotateRight1Click(Sender: TObject);
begin
  RotateBitmapNegative90Degrees(StolenZone);
  FlipSelectionSize;

  UpdateCanvas;
end;

procedure TMsPaint.Rotateright901Click(Sender: TObject);
begin
  RotateBitmap90Degrees(StolenZone);
  FlipSelectionSize;

  UpdateCanvas;
end;

procedure TMsPaint.DoRedo;
var
  NewPos: integer;
begin
  NewPos := DoPos - 1;
  if NewPos >= 0 then
    begin
      LoadHistory(NewPos);
    end;
end;

procedure TMsPaint.DoUndo;
var
  NewPos: integer;
begin
  FinishSelection();

  NewPos := DoPos + 1;
  if NewPos < Length(History) then
    begin
      LoadHistory(NewPos);
    end;
end;

procedure TMsPaint.DrawBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbMiddle then
    Exit;

  // UI
  HideMiniPanels;
  AnimateKeys.Enabled := false;
    
  // Down
  CanvasMouseDown := true;
  DownButton := Button;

  DownCanvas := Point(X, Y);
  DownImage := Point(round(X/Scale), round(Y/Scale));

  // Select Color
  case DownButton of
    TMouseButton.mbLeft: DrawColor := PrimaryColor;
    TMouseButton.mbRight: DrawColor := SecondaryColor;
  end;

  // All
  StartedMoving := false;

  // Tool
  if CanvasMouseDown then
    begin
      case Tool of
        TToolType.Select: begin
          // Set Freeform
          if SelectionType = TSelectionType.FreeForm then
            begin
              SetLength(FreeFormBorder, 0, 0);
              SetLength(FreeFormBorder, Image.Width+1, Image.Height+1);
            end;
        end;

        TToolType.Fill: with Image.Canvas do
          begin
            Brush.Color := DrawColor;

            FloodFill( DownImage.X, DownImage.Y, Pixels[DownImage.X, DownImage.Y], TFillStyle.fsSurface );

            UpdateCanvasDrawn;
          end;

        TToolType.Brush: begin
          if BrushId = 1 then
            BrushTick.Enabled := true;
        end;

        TToolType.ColorPick: with Image.Canvas do
          begin
            if DownButton = mbLeft then
              PrimaryColor := Pixels[DownImage.X, DownImage.Y]
            else
              SecondaryColor := Pixels[DownImage.X, DownImage.Y];

            UpdateColorIcons;
          end;

        TToolType.Zoom: with Image.Canvas do
          begin
            if DownButton = mbLeft then

          end;

        TToolType.Text: InvisibleEdit.SetFocus;
      end;
    end;

  // Move Also
  DrawBoxMouseMove(Sender, Shift, X, Y);

  // Last
  LastDownImage := DownImage;
  LastDownCanvas := DownCanvas;
end;

procedure TMsPaint.DrawBoxMouseLeave(Sender: TObject);
begin
  MouseOnCanvas := false;

  // Update
  Label5.Caption := '';
end;

function RandomPointInEllipse(const rect: TRect): TPoint;
var
  centerX, centerY: Integer;
  semiMajorAxis, semiMinorAxis: Integer;
  theta, r: Double;
  angle: Double;
begin
  // Step 1: Calculate the center of the ellipse
  centerX := (rect.Left + rect.Right) div 2;
  centerY := (rect.Top + rect.Bottom) div 2;

  // Step 2: Calculate the semi-major and semi-minor axes
  semiMajorAxis := rect.Width div 2;
  semiMinorAxis := rect.Height div 2;

  // Step 3: Generate random angle and radius
  theta := Random * 2 * PI;
  r := Sqrt(Random);

  // Step 4: Calculate x and y coordinates
  angle := theta;
  Result.X := Round(centerX + semiMajorAxis * r * Cos(angle));
  Result.Y := Round(centerY + semiMinorAxis * r * Sin(angle));
end;

procedure TMsPaint.DrawBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  PreviousImage: TPoint;
  ARect: TRect;
  APoint: TPoint;
  I, DistX, DistY, ACount: Integer;
begin
  // Previous
  PreviousImage := PositionImage;

  // Position
  PositionCanvas := Point(X, Y);
  PositionImage := Point(round(X / Scale), round(Y / Scale));

  // On Canvas
  MouseOnCanvas := Image.Canvas.ClipRect.Contains(PositionImage);

  // Update
  Label5.Caption := ConvertUnit(PositionImage.X) + ', ' + ConvertUnit(PositionImage.Y) + GetUnit;

  // Cursor
  with DrawBox do
    case Tool of
      TToolType.Select: begin
        if MouseOverSelection then
          Cursor := crSizeAll
        else
          Cursor := crCross;
      end;
      TToolType.Text: Cursor := crIBeam;
      else Cursor := crCross;
    end;

  // Draw
  if CanvasMouseDown then
    begin
      case Tool of
        TToolType.Select, TToolType.Text, TToolType.Shape: begin
          //
          case SelectMode of
            TSelectionMode.None:
            begin
              // Create Selection
              SelectMode := TSelectionMode.Creating;

              SelectionCanvas := TRect.Create(DownCanvas, PositionCanvas, true);
              SelectionImage := TRect.Create(DownImage, PositionImage, true);
            end;

            TSelectionMode.Creating:
            begin
              SelectionCanvas := TRect.Create(DownCanvas, PositionCanvas, true);
              SelectionImage := TRect.Create(DownImage, PositionImage, true);

              // Corner
              CornerStart := GetCorner(SelectionCanvas, DownCanvas);
              CornerEnd := GetCorner(SelectionCanvas, PositionCanvas);

              // Proportional
              if ssShift in Shift then
                begin
                  if SelectionCanvas.Width < SelectionCanvas.Height then
                    begin
                      SelectionCanvas.Height := SelectionCanvas.Width;
                      SelectionImage.Height := SelectionImage.Width;

                      if PositionCanvas.Y < DownCanvas.Y then
                        begin
                          SelectionCanvas.Offset(0, DownCanvas.Y-SelectionCanvas.Bottom);
                          SelectionImage.Offset(0, DownImage.Y-SelectionImage.Bottom);
                        end;
                    end
                  else
                    begin
                      SelectionCanvas.Width := SelectionCanvas.Height;
                      SelectionImage.Width := SelectionImage.Height;

                      if PositionCanvas.X < DownCanvas.X then
                        begin
                          SelectionCanvas.Offset(DownCanvas.X-SelectionCanvas.Right, 0);
                          SelectionImage.Offset(DownImage.X-SelectionImage.Right, 0);
                        end;
                    end;
                end;

              // Custom Settings
              if Tool = TToolType.Shape then
                begin
                  case ShapeID of
                    2: begin
                      DrawingPoints := [];
                      PointIndex := -1;
                    end;
                    6: begin
                      DrawingPoints := [DownImage, PositionImage];
                      PointIndex := 1;
                    end;
                  end;
                end;

              // Free-Form
              if (SelectionType = TSelectionType.FreeForm) and MouseOnCanvas then
                begin
                  // Largest Distance
                  DistX := PositionImage.X - LastValidPointImage.X;
                  DistY := PositionImage.Y - LastValidPointImage.Y;

                  // Count
                  if abs(DistX) > abs(DistY) then
                    ACount := abs(DistX)
                  else
                    ACount := abs(DistY);

                  // Set pixel
                  if (ACount = 0) or not Image.Canvas.ClipRect.Contains(LastValidPointImage) then
                    FreeFormBorder[PositionImage.X, PositionImage.Y] := true
                  else
                    // Set Pixels
                    for I := 1 to ACount do
                      begin
                        APoint.X := LastValidPointImage.X + trunc(I / ACount * DistX);
                        APoint.Y := LastValidPointImage.Y + trunc(I / ACount * DistY);

                        FreeFormBorder[APoint.X, APoint.Y] := true;
                      end;
                end;
            end;

            TSelectionMode.Exists:
            begin
              if ((SizePoint <> -1) or MouseOverSelection) and SelectionSupportsMoving then
                // Alter
                begin
                  if not StartedMoving then
                    begin
                      StartedMoving := true;

                      // Move
                      if SizePoint = -1 then
                        begin
                          APoint := SelectionCanvas.CenterPoint;
                          MoveOffsetCanvas.X := APoint.X-PositionCanvas.X;
                          MoveOffsetCanvas.Y := APoint.Y-PositionCanvas.Y;

                          APoint := SelectionImage.CenterPoint;
                          MoveOffsetImage.X := APoint.X-PositionImage.X;
                          MoveOffsetImage.Y := APoint.Y-PositionImage.Y;
                        end;
                    end;

                  if SizePoint = -1 then
                    // Move
                    begin
                      CenterRectAtPoint(SelectionCanvas, PositionCanvas);
                      CenterRectAtPoint(SelectionImage, PositionImage);

                      SelectionCanvas.Offset(MoveOffsetCanvas);
                      SelectionImage.Offset(MoveOffsetImage);
                    end
                  else
                    // Size
                    begin
                      case SizePoint of
                        1: SelectionCanvas.TopLeft := PositionCanvas;
                        2: SelectionCanvas.Top := PositionCanvas.Y;
                        3: begin
                          SelectionCanvas.Top := PositionCanvas.Y;
                          SelectionCanvas.Right := PositionCanvas.X;
                        end;
                        4: SelectionCanvas.Left := PositionCanvas.X;
                        5: SelectionCanvas.Right := PositionCanvas.X;
                        6: begin
                          SelectionCanvas.Bottom := PositionCanvas.Y;
                          SelectionCanvas.Left := PositionCanvas.X;
                        end;
                        7: SelectionCanvas.Bottom := PositionCanvas.Y;
                        8: SelectionCanvas.BottomRight := PositionCanvas;
                      end;

                      // Fix Image Rect
                      SelectionImage.Left := round(SelectionCanvas.Left * ReverseScale);
                      SelectionImage.Top := round(SelectionCanvas.Top * ReverseScale);
                      SelectionImage.Right := round(SelectionCanvas.Right * ReverseScale);
                      SelectionImage.Bottom := round(SelectionCanvas.Bottom * ReverseScale);

                      SelectionImage.NormalizeRect;
                    end;
                end
              else
                // Finish
                begin
                  case Tool of
                    TToolType.Shape:
                      case ShapeID of
                        2: begin
                          if PointIndex <> -1 then
                            DrawingPoints[PointIndex] := PositionImage
                          else
                            begin
                              if Length(DrawingPoints) <= 1 then
                              // New point
                              begin
                                PointIndex := Length(DrawingPoints);
                                SetLength(DrawingPoints, PointIndex+1);
                                DrawingPoints[PointIndex] := PositionImage;
                              end
                                else
                              // Done
                              FinishSelection;
                            end;
                        end;
                        6: begin
                          if PointIndex = -1 then
                            begin
                              if (DownCanvas = LastDownCanvas) or (PositionImage = DrawingPoints[High(DrawingPoints)]) then
                                // End Selection (dbl click)
                                FinishSelection
                              else
                                begin
                                  Title.Caption := Length(DrawingPoints).ToString;
                                  // Move previous point
                                  for I := 0 to High(DrawingPoints) do begin
                                      ARect := TRect.Create(ScaleToCanvas(DrawingPoints[I]));

                                      ARect.Inflate(13, 13);

                                      if ARect.Contains(PositionCanvas) then
                                        begin
                                          PointIndex := I;
                                          Break;
                                        end;
                                    end;

                                  // New point (index still -1)
                                  if PointIndex = -1 then
                                  begin
                                    PointIndex := Length(DrawingPoints);
                                    SetLength(DrawingPoints, PointIndex+1);
                                    DrawingPoints[PointIndex] := PositionImage;
                                  end;
                                end;
                            end
                          else
                            DrawingPoints[PointIndex] := PositionImage;
                        end;

                        else FinishSelection;
                      end;

                    else FinishSelection;
                  end;
                end;
            end;
          end;

          // Text
          UpdateRectSize;

          // Paint, no update
          UpdateCanvas;
        end;

        TToolType.Pencil: with Image.Canvas do
        begin
          Pen.Style := psSolid;
          Pen.Color := DrawColor;
          Pen.Width := PenSize;

          if (PenSize = 1) and (PreviousImage = PositionImage) then
            Pixels[PositionImage.X, PositionImage.Y] := Pen.Color
          else
            begin
              MoveTo(PreviousImage.X, PreviousImage.Y);
              LineTo(PositionImage.X, PositionImage.Y);
            end;

          // Paint
          UpdateCanvas;
        end;

        TToolType.Brush: with Image.Canvas do
        begin
          Pen.Style := psSolid;
          Pen.Color := DrawColor;
          Pen.Width := BrushSize;

          case BrushID of
            0: begin
              MoveTo(PreviousImage.X, PreviousImage.Y);
              LineTo(PositionImage.X, PositionImage.Y);
            end;
            1: begin
              ARect := TRect.Create(PositionImage);
              ARect.Inflate(BrushSize, BrushSize);
            
              for I := 1 to 20 do
                begin
                  APoint := RandomPointInEllipse(ARect);
                  Pixels[APoint.X, APoint.Y] := DrawColor;
                end;
            end;
            2: begin
              ARect := TRect.Create(PositionImage);
              ARect.Inflate(BrushSize div 2, BrushSize div 2);
              
              GDICircle(ARect, GetRGB(DrawColor, 100).MakeGDIBrush, nil);
            end;
            3: begin
              GDILine(MakeLine(PReviousImage, PositionImage), GetRGB(DrawColor, 200).MakeGDIPen(BrushSize));
            end;
            4: begin
              ARect := TRect.Create(PositionImage);
              ARect.Inflate(BrushSize div 2, BrushSize div 2);
            
              for I := 1 to BrushSize * 10 do
                begin
                  APoint := RandomPointInEllipse(ARect);
                  Pixels[APoint.X, APoint.Y] := ChangeColorSat(DrawColor, random(100));
                end;
            end;
          end;


          // Paint
          UpdateCanvas;
        end;

        TToolType.Eraser: with Image.Canvas do
        begin
          Pen.Style := psClear;
          Brush.Color := SecondaryColor;
          Brush.Style := bsSolid;

          ARect := Rect(PositionImage.X, PositionImage.Y, PositionImage.X, PositionImage.Y);
          ARect.Inflate(EraserSize, EraserSize);

          FillRect(ARect);

          // Paint
          UpdateCanvas;
        end;
      end;
    end;

  // Mouse press not required
  case Tool of
    TToolType.Select, TToolType.Text, TToolType.Shape: begin
      if (SelectMode = TSelectionMode.Exists) and not StartedMoving then
        begin
          SizePoint := -1;
          for I := 1 to 8 do
            if GetSizeRect(I, 10).Contains(PositionCanvas) then
              begin
                // Cursor
                with DrawBox do
                  case I of
                    1, 8: Cursor := crSizeNWSE;
                    2, 7: Cursor := crSizeNS;
                    3, 6: Cursor := crSizeNESW;
                    4, 5: Cursor := crSizeWE;
                  end;

                // Point
                SizePoint := I;
                Break;
              end;

          if Tool = TToolType.Shape then
            case ShapeID of
              6: for I := 0 to High(DrawingPoints) do
                begin
                  ARect := TRect.Create(ScaleToCanvas(DrawingPoints[I]));
                  ARect.Inflate(13, 13);

                  if ARect.Contains(PositionCanvas) then
                    begin
                      DrawBox.Cursor := crSizeAll;
                      Break;
                    end;
                end;
            end;
        end;
    end;

    TToolType.Zoom: begin
      UpdateCanvas;
    end;
  end;

  // Last Valid
  if MouseOnCanvas then
    LastValidPointImage := PositionImage;
  
  // Rulers
  UpdateRulers;
end;

procedure TMsPaint.DrawBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  AHeight, AWidth: integer;
begin
  if Button = mbMiddle then
    Exit;

  // Not down
  CanvasMouseDown := false;

  // Draw
  case Tool of
    TToolType.Pencil, TToolType.Eraser: UpdateCanvasDrawn;

    TToolType.Brush: begin
      BrushTick.Enabled := false;
      UpdateCanvasDrawn;
    end;
    
    TToolType.Select, TToolType.Text, TToolType.Shape: begin
      // Stop move
      StartedMoving := false;

      // Create
      if SelectMode = TSelectionMode.Creating then
        begin
          // Set
          SelectMode := TSelectionMode.Exists;

          // Additional
          case Tool of
            TToolType.Select: begin
              // Freeform Calculate
              CalculateFreeForm;

              // No points
              if (SelectionType = TSelectionType.FreeForm) and (FreeFormPoints = 0) then
                begin
                  SelectMode := TSelectionMode.None;

                  // Close
                  UpdateCanvas;
                  Exit;
                end;

              // Steal Zone
              StealSelectionZone;

              // Transparent
              ApplyTransparent;

              // Fill
              FillSelectionZone;

              // Invalid
              if SelectionImage.IsEmpty then
                SelectMode := TSelectionMode.None;

              // Changed
              UpdateCanvas;
            end;

            TToolType.Text: begin
              ApplyFontStyling(Image.Canvas.Font);
              AHeight := Image.Canvas.TextHeight('A');
              AWidth := Image.Canvas.TextWidth('AAAAAAAAAAAAA');

              if SelectionImage.Height < AHeight then
                begin
                  SelectionImage.Height := AHeight;
                  SelectionCanvas.Height := round(AHeight * Scale);
                end;

              if SelectionImage.Height < AWidth then
                begin
                  SelectionImage.Width := AWidth;
                  SelectionCanvas.Width := round(AWidth * Scale);
                end;

              // Menu
              ToggleTextPage(True);

              // Edit
              DrawText := '';
              InvisibleEdit.Text := DrawText;
              InvisibleEdit.SetFocus;
            end;
          end;

          // Text
          UpdateRectSize;

          // Draw
          UpdateCanvas;
        end;

      // Always on TM
      case Tool of
        TToolType.Shape: begin
          case ShapeID of
            2, 6: begin
              PointIndex := -1;
            end;
          end;
        end;
      end;

      // Invalid
      if SelectMode = TSelectionMode.None then
        Label8.Caption := '';
    end;

    TToolType.Zoom: begin
      case Button of
        TMouseButton.mbLeft: begin
          TrackBar1.Position := TrackBar1.Position * 2;

          Scrollbox1.HorzScrollBar.Position := EnsureRange(ZoomRect.CenterPoint.X div 2, 0, Scrollbox1.HorzScrollBar.Range);
          Scrollbox1.VertScrollBar.Position := EnsureRange(ZoomRect.CenterPoint.Y div 2, 0, Scrollbox1.VertScrollBar.Range);
        end;
        TMouseButton.mbRight: TrackBar1.Position := TrackBar1.Position div 2;
      end;
    end;
  end;

  // Popup Menu
  if (Tool = TToolType.Select) and (Button = mbRight) then
    begin
      PopupMenu1.Popup( Mouse.CursorPos.X, Mouse.CursorPos.Y );
    end;
end;

procedure TMsPaint.DrawBoxPaint(Sender: TObject);
var
  AX, AY: integer;
  I, J: integer;
  ADrawText: string;
  ARect: TRect;
  AllowInvertedSelect: boolean;
begin
  // Layer 1
  with DrawBox.Canvas do
    StretchDraw(DrawBox.ClientRect, Image);

  // Overlay
  with DrawBox.Canvas do               
    begin
      case Tool of
        TToolType.Select, TToolType.Text, TToolType.Shape:
          begin
            // Selection
            if SelectMode <> TSelectionMode.None then
              begin
                // General
                AllowInvertedSelect := true;
                
                // Stolen Zone Pathc
                if Tool = TToolType.Select then
                  begin
                    if SelectMode = TSelectionMode.Exists then
                      DrawStolen(DrawBox.Canvas, SelectionCanvas);
                  end;

                // Text
                if Tool = TToolType.Text then
                  begin
                    Brush.Color := SecondaryColor;
                    if SpeedButton67.Down then
                      Brush.Style := bsClear
                    else
                      Brush.Style := bsSolid;

                    ApplyFontStyling(Font);
                    Font.Height := trunc(Font.Height * Scale);

                    if SelectionCanvas.Height < TextHeight('A') then
                      begin
                        SelectionCanvas.Height := TextHeight('A');
                        SelectionImage.Height := round(SelectionCanvas.Height * ReverseScale);
                      end;

                    ADrawText := DrawText;

                    ADrawText.Insert(InvisibleEdit.SelStart, '|');

                    TextRect(SelectionCanvas, ADrawText, [tfWordBreak]);

                    // Enabled editor
                    if CheckBox4.Checked then
                      begin
                        InvisibleEdit.Font.Assign( Font );
                        InvisibleEdit.Color := SecondaryColor;

                        InvisibleEdit.Left := SelectionCanvas.Left+1;
                        InvisibleEdit.Top := SelectionCanvas.Top+1;
                        InvisibleEdit.Width := SelectionCanvas.Width-2;
                        InvisibleEdit.Height := SelectionCanvas.Height-2;
                      end;
                  end;

                // Shapes
                if Tool = TToolType.Shape then
                  begin
                    Pen.Width := round(ShapePen * Scale);
                    
                    DrawShapeCanvas(DrawBox.Canvas, SelectionCanvas, ShapeID);

                    if ShapeID = 1 then
                      AllowInvertedSelect := false;
                  end;

                // Inverted Selection color
                if AllowInvertedSelect and not SelectionCanvas.IsEmpty
                  and ((SelectionType = TSelectionType.Rectangular) or (Tool <> TToolType.Select))
                  and SelectionSupportsMoving then
                  with TBitMap.Create do
                    begin
                      SetSize(SelectionCanvas.Width, SelectionCanvas.Height);

                      with Canvas do
                        begin
                          Brush.Color := clBlack;
                          FillRect(ClipRect);

                          if SelectMode = TSelectionMode.Creating then
                            Pen.Color := clWhite
                          else
                            Pen.Color := InvertColor(ColorToRGB(clHighlight));
                          Pen.Style := psDash;

                          Brush.Style := bsClear;
                          Rectangle(Canvas.ClipRect);
                        end;

                      StretchInvertedMask(Canvas, DrawBox.Canvas, SelectionCanvas);
                    end;

                // Free form
                if (Tool = TToolType.Select) and (SelectionType = TSelectionType.FreeForm) then
                  with TBitMap.Create do
                    begin
                      SetSize(DrawBox.Width, DrawBox.Height);

                      with Canvas do
                        begin
                          Brush.Color := clBlack;
                          FillRect(ClipRect);
                          Pen.Color := clWhite;

                          for AX := 0 to High(FreeFormBorder) do
                            for AY := 0 to High(FreeFormBorder[AX]) do
                              if FreeFormBorder[AX, AY] then
                                Pixels[round(AX * Scale), round(AY * Scale)] := clWhite;
                        end;

                      StretchInvertedMask(Canvas, DrawBox.Canvas, DrawBox.ClientRect);
                    end;

                // Draw Size buttons
                if SelectMode = TSelectionMode.Exists then
                  begin
                    Pen.Style := psSolid;
                    Pen.Width := 1;
                    Pen.Color := 0;

                    Brush.Style := bsSolid;
                    Brush.Color := TColors.White;

                    if (Tool = TToolType.Shape) then
                    case ShapeID of
                      1: begin
                        if (CornerStart = TCornerPos.TopLeft) or (CornerEnd = TCornerPos.TopLeft) then
                          Rectangle(GetSizeRect(1));
                        if (CornerStart = TCornerPos.TopRight) or (CornerEnd = TCornerPos.TopRight) then
                          Rectangle(GetSizeRect(3));
                        if (CornerStart = TCornerPos.BottomLeft) or (CornerEnd = TCornerPos.BottomLeft) then
                          Rectangle(GetSizeRect(6));
                        if (CornerStart = TCornerPos.BottomRight) or (CornerEnd = TCornerPos.BottomRight) then
                          Rectangle(GetSizeRect(8));
                      end;

                      2: ;

                      6: for I := 0 to High(DrawingPoints) do
                        begin
                          ARect := TRect.Create(ScaleToCanvas(DrawingPoints[I]));
                          ARect.Inflate(3, 3);

                          Rectangle( ARect );
                        end

                      else for I := 1 to 8 do
                        Rectangle(GetSizeRect(I));
                    end;
                  end;
              end;
          end;

        TToolType.Zoom: begin
          if DrawBox.Height < ScrollBox1.Height div 2 then
            begin
              ZoomRect := DrawBox.ClientRect;
            end
          else
            begin
              ZoomRect := TRect.Create(PositionCanvas);
              ZoomRect.Inflate(DrawBox.Canvas.ClipRect.Width div 4, DrawBox.Canvas.ClipRect.Height div 4);
            end;

          ContainRectInRect(ZoomRect, DrawBox.ClientRect);

          // Inverted Selection color
          with TBitMap.Create do
            begin
              SetSize(ZoomRect.Width, ZoomRect.Height);

              with Canvas do
                begin
                  Brush.Color := clBlack;
                  FillRect(ClipRect);
                  Pen.Color := clWhite;
                  Pen.Width := 2;

                  ARect := ClipRect;
                  ARect.Inflate(-1, -1, 0, 0);

                  Brush.Style := bsClear;
                  Rectangle(ARect);
                end;

              StretchInvertedMask(Canvas, DrawBox.Canvas, ZoomRect);
            end;
        end;
      end;
    end;

  // Sizing
  if SizePreview.Enabled then
    begin
      DrawBox.Canvas.TextOut(10, 10, 'drawin');
      with TBitMap.Create do
        begin
          SetSize(DotsSize.Width-4, DotsSize.Height-4);

          with Canvas do
            begin
              Brush.Color := clBlack;
              FillRect(ClipRect);
              Pen.Color := clWhite;
              Pen.Width := 1;
              Pen.Style := psDot;

              ARect := ClipRect;
              ARect.Inflate(1, 1, 0, 0);

              Brush.Style := bsClear;
              Rectangle(ARect);
            end;

          StretchInvertedMask(Canvas, DrawBox.Canvas, DotsSize.ClientRect);
        end;
    end;

  // Gridlines
  if CheckBox2.Checked then
    with DrawBox.Canvas do
      begin
        Pen.Style := psDot;
        Pen.Width := 1;
        Pen.Color := clGray;

        AX := DrawBox.Width div LINE_SPACING;
        AY := DrawBox.Height div LINE_SPACING;

        for I := 0 to AX do
          for J := 0 to AY do
            begin
              MoveTo(I * LINE_SPACING, J * LINE_SPACING);
              LineTo((I+1) * LINE_SPACING, (J) * LINE_SPACING);

              MoveTo(I * LINE_SPACING, J * LINE_SPACING);
              LineTo((I) * LINE_SPACING, (J+1) * LINE_SPACING);
            end;
      end;
end;

procedure TMsPaint.DrawShapeCanvas(Canvas: TCanvas; ARect: TRect;
  Index: integer; Finale: boolean);
var
  APoints: TArray<TPoint>;
  I: integer;
  AH, AW, SH, SW: integer;
  Center: TPoint;
  P1, P2: TPoint;

  DrawSPoints: TPoints;
begin
  with Canvas do
    begin
      Pen.Color := PrimaryColor;
      Brush.Color := SecondaryColor;

      // Scaled Points
      SetLength(DrawSPoints, Length(DrawingPoints));
      if Finale then
        DrawSPoints := DrawingPoints
      else
        for I := 0 to High(DrawSPoints) do
          begin
            DrawSPoints[I].X := round(DrawingPoints[I].X * Scale);
            DrawSPoints[I].Y := round(DrawingPoints[I].Y * Scale);
          end;

      P1 := GetPoint(ARect, CornerStart);
      P2 := GetPoint(ARect, CornerEnd);

      if SpeedButton72.Down then
        Pen.Style := psSolid
      else
        Pen.Style := psClear;
      if SpeedButton73.Down then
        Brush.Style := bsSolid
      else
        Brush.Style := bsClear;

      case ShapeID of
        1: begin
          MoveTo(P1.X, P1.Y);
          LineTo(P2.X, P2.Y);
        end;
        2: begin
          if Length(DrawingPoints) = 0 then
            Line(P1, P2)
          else
            PolyBezier([P1, DrawSPoints[Low(DrawSPoints)], DrawSPoints[High(DrawSPoints)], P2]);
        end;
        3: begin
          Ellipse(ARect);
        end;
        4: begin
          Rectangle(ARect);
        end;
        5: begin
          RoundRect(ARect, 30, 30);
        end;
        6: begin
          if Finale then
            Polygon(DrawSPoints)
          else
            if Length(DrawSPoints) > 0 then
            
            begin
              MoveTo( DrawSPoints[0] );
              for I := 1 to High(DrawSPoints) do
                LineTo( DrawSPoints[I] );
            end;
        end;
        7, 8: begin
          SetLength(APoints, 3);
          if Index = 7 then
            APoints[0] := Point(ARect.CenterPoint.X, ARect.Top)
          else
            APoints[0] := ARect.TopLeft;
          APoints[1] := Point(ARect.Left, ARect.Bottom);
          APoints[2] := ARect.BottomRight;
                        
          Polygon(APoints);
        end;
        9: begin
          SetLength(APoints, 4);
          APoints[0] := ARect.CenterPoint;
          for I := 1 to 3 do
            APoints[I] := APoints[0];

          AW := ARect.Width div 2;
          AH := ARect.Height div 2;

          Dec(APoints[0].Y, AH);
          Inc(APoints[1].X, AW);
          Inc(APoints[2].Y, AH);
          Dec(APoints[3].X, AW);

          Polygon(APoints);
        end;
        10: begin
          SetLength(APoints, 5);
          APoints[0] := ARect.CenterPoint;
          for I := 1 to 4 do
            APoints[I] := APoints[0];

          AW := ARect.Width div 2;
          AH := ARect.Height div 2;

          Dec(APoints[0].Y, AH);
          Inc(APoints[1].X, AW);
          
          Inc(APoints[2].Y, AH);
          Inc(APoints[2].X, AW div 2);
          
          Inc(APoints[3].Y, AH);
          Dec(APoints[3].X, AW div 2);
          
          Dec(APoints[4].X, AW);

          Polygon(APoints);
        end;
        11: begin
          SetLength(APoints, 6);
          APoints[0] := ARect.CenterPoint;
          for I := 1 to 5 do
            APoints[I] := APoints[0];

          AW := ARect.Width div 2;
          AH := ARect.Height div 2;

          Dec(APoints[0].Y, AH);
          
          Inc(APoints[1].X, AW);
          Dec(APoints[1].Y, AH div 2);
          Inc(APoints[2].X, AW);
          Inc(APoints[2].Y, AH div 2);
          
          Inc(APoints[3].Y, AH);

          Dec(APoints[4].X, AW);
          Inc(APoints[4].Y, AH div 2);
          Dec(APoints[5].X, AW);
          Dec(APoints[5].Y, AH div 2);

          Polygon(APoints);
        end;
        12, 13: begin
          SetLength(APoints, 7);
          Center := ARect.CenterPoint;
          for I := 0 to 6 do
            APoints[I] := Center;

          AW := ARect.Width div 2;
          AH := ARect.Height div 2;

          Dec(APoints[0].X, AW);
          Inc(APoints[0].Y, AH div 2);
          Dec(APoints[1].X, AW);
          Dec(APoints[1].Y, AH div 2);

          Dec(APoints[2].Y, AH div 2);
          Dec(APoints[3].Y, AH);

          Inc(APoints[4].X, AW);
          
          Inc(APoints[5].Y, AH);
          Inc(APoints[6].Y, AH div 2);

          // Rotate
          if (Index = 13) and (not ARect.IsEmpty) then
            for I := 0 to High(APoints) do
              APoints[I] := RotatePointAroundPoint(APoints[I], Center, 180);

          Polygon(APoints);
        end;
        14, 15: begin
          SetLength(APoints, 7);
          Center := ARect.CenterPoint;
          for I := 0 to 6 do
            APoints[I] := Center;

          AW := ARect.Width div 2;
          AH := ARect.Height div 2;

          Dec(APoints[0].Y, AH);
          Inc(APoints[0].X, AW div 2);
          Dec(APoints[1].Y, AH);
          Dec(APoints[1].X, AW div 2);

          Dec(APoints[2].X, AW div 2);
          Dec(APoints[3].X, AW);

          Inc(APoints[4].Y, AH);
          
          Inc(APoints[5].X, AW);
          Inc(APoints[6].X, AW div 2);

          // Rotate
          if (Index = 14) and (not ARect.IsEmpty) then
            for I := 0 to High(APoints) do
              APoints[I] := RotatePointAroundPoint(APoints[I], Center, 180);


          Polygon(APoints);
        end;
        16: begin
          SetLength(APoints, 8);
          APoints[0] := ARect.CenterPoint;
          for I := 1 to 7 do
            APoints[I] := APoints[0];

          AW := ARect.Width div 2;
          AH := ARect.Height div 2;

          Dec(APoints[0].Y, AH);

          Dec(APoints[1].Y, AH div 4);
          Inc(APoints[1].X, AW div 4);

          Inc(APoints[2].X, AW);

          Inc(APoints[3].Y, AH div 4);
          Inc(APoints[3].X, AW div 4);

          Inc(APoints[4].Y, AH);

          Inc(APoints[5].Y, AH div 4);
          Dec(APoints[5].X, AW div 4);

          Dec(APoints[6].X, AW);

          Dec(APoints[7].Y, AH div 4);
          Dec(APoints[7].X, AW div 4);

          Polygon(APoints);
        end;
        17, 18: begin
          SetLength(APoints, 10);
          APoints[0] := ARect.CenterPoint;
          for I := 1 to 9 do
            APoints[I] := APoints[0];

          AW := ARect.Width div 2;
          AH := ARect.Height div 2;

          SW := AW div 4;
          SH := AH div 4;

          Dec(APoints[0].Y, AH);

          Dec(APoints[1].Y, SH);
          Inc(APoints[1].X, SW);

          Dec(APoints[2].Y, SH);
          Inc(APoints[2].X, AW);

          Inc(APoints[3].Y, SH);
          Inc(APoints[3].X, AW div 2);

          Inc(APoints[4].Y, AH);
          Inc(APoints[4].X, AW-SW);

          Inc(APoints[5].Y, AH div 2);

          Inc(APoints[6].Y, AH);
          Dec(APoints[6].X, AW-SW);

          Inc(APoints[7].Y, SH);
          Dec(APoints[7].X, AW div 2);

          Dec(APoints[8].Y, SH);
          Dec(APoints[8].X, AW);

          Dec(APoints[9].Y, SH);
          Dec(APoints[9].X, SW);

          Polygon(APoints);
        end;
      end;
    end;
end;

procedure TMsPaint.DrawStolen(Canvas: TCanvas; ARect: TRect);
var
  ATemp: TBitMap;
begin
  ATemp := TBitMap.Create(StolenZone.Width, StolenZone.Height);
  try
    // Transparecy
    with ATemp.Canvas do
      begin
        Brush.Color := TRANSPARENT_COLOR;
        FillRect(ClipRect);

        ATemp.Transparent := true;
        ATemp.TransparentColor := Brush.Color;

        StretchDraw(ClipRect, StolenZone);
      end;

    // Draw
    Canvas.StretchDraw(ARect, ATemp);
  finally
    ATemp.Free;
  end;
end;

procedure TMsPaint.SaveFile;
var
  ImageType: TImageType;
  Ext: string;

  G: TGraphic;
begin
  // Image Type
  ImageType := TImageType.Bitmap;

  Ext := AnsiLowerCase(ExtractFileExt(FileName));
  if Ext = '.png' then
    ImageType := TImageType.PNG
  else
  if (Ext = '.jpeg') or (Ext = '.jpg') then
    ImageType := TImageType.Jpeg
  else
  if Ext = '.gif' then
    ImageType := TImageType.Gif;
  
  // Save
  case ImageType of
    TImageType.PNG: G := TPngImage.Create;
    TImageType.Jpeg: G := TJpegImage.Create;
    TImageType.Gif: G := TGifImage.Create;
    else G := TBitMap.Create; 
  end;
  
  try
    G.Assign(Image);
    G.SaveToFile(FileName);
  finally
    G.Free;
  end;

  // Status
  FileSaved := true;
  ChangesUnsaved := false;

  // Update
  UpdateFileSize;
  UpdateSizing;
end;

procedure TMsPaint.SaveFileOptional(SaveAs: boolean);
var
  Ext: string;
  I: integer;
begin
  // Finish editing
  FinishSelection();

  // Save
  if FileSaved and (FileName <> '') and not SaveAs then
    SaveFile
  else
    if SavePictureDialog1.Execute then
      begin
        FileName := SavePictureDialog1.FileName;

        // Extension
        if ExtractFileExt(FileName) = '' then
          begin
            case SavePictureDialog1.FilterIndex of
              1: Ext := 'png';
              2: Ext := 'jpeg';
              3: Ext := 'bmp';
              4: Ext := 'gif';
              5: Ext := 'ico';
            end;

            FileName := FileName + '.' + Ext;
          end;

        // Add to recents
        I := RecentFiles.IndexOf(FileName);
        if I <> -1 then
          RecentFiles.Delete(I);

        RecentFiles.Add(FileName);

        // Save
        SaveFile;
      end;
end;

function TMsPaint.ScaleToCanvas(P: TPoint): TPoint;
begin
  Result := P;
  Result.X := round(Result.X * Scale);
  Result.Y := round(Result.Y * Scale);
end;

procedure TMsPaint.ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  // Rulers
  UpdateRulers;
end;

procedure TMsPaint.ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  Value: integer;
begin
  Value := 0;
  if WheelDelta <> 0 then
    Value := WheelDelta div -abs(WheelDelta);

  with TScrollBox(Sender) do
    if ssCtrl in Shift then
      TrackBar1.Position := TrackBar1.Position + Value * -5
    else
    if ssShift in Shift then
      HorzScrollBar.Position := HorzScrollBar.Position + Value * 20
    else
      VertScrollBar.Position := VertScrollBar.Position + Value * 20;

  // Rulers
  UpdateRulers;
end;

procedure TMsPaint.SelectPanel(Index: integer);
var
  APoint: TPoint;
begin
  // Index
  if Index > 0 then
    begin
      Page_Home.Hide;
      Page_View.Hide;
      Page_Text.Hide;
      Page_Print.Hide;
    end;

  // For All
  MenuOutline := clAppWorkSpace;

  // Individual
  case Index of
    0: begin
      APoint := PaintBox2.ClientToScreen(Point(0,0));

      MenuPopup.Left := APoint.X;
      MenuPopup.Top := APoint.Y;

      MenuPopup.Show;
    end;
    1: Page_Home.Show;
    2: Page_View.Show;
    3: begin
      Page_Text.Show;
      MenuOutline := $003FF900;
    end;
    4: Page_Print.Show;
  end;

  // Move Color Picker
  if (Index = 1) and (ColorPicker.Parent <> Page_Home) then
    begin
      ColorPicker.Parent := Page_Home;
      ColorPicker.Left := Label23.Left;
    end;

  if (Index = 3) and (ColorPicker.Parent <> Page_Text) then
    begin
      ColorPicker.Parent := Page_Text;
      ColorPicker.Left := Label28.Left;
    end;
end;

procedure TMsPaint.SelectTool(Sender: TObject);
begin
  // Buttons
  ClearAllSelect(TSpeedButton(Sender));

  // Selection Finalise
  FinishSelection;

  // Tool
  ChangeTool( TToolType(TSpeedButton(Sender).Tag+1) );
end;

procedure TMsPaint.ShapeSelect(Sender: TObject);
begin
   // Buttons
  ClearAllSelect(TSpeedButton(Sender));

  // Finish previous or Switch shape
  //if Tool <> TToolType.Shape then
    FinishSelection();

  // Tool
  ChangeTool(TToolType.Shape);
  
  // Select Shape
  ShapeID := TSpeedButton(Sender).Tag;

  // Draw
  UpdateCanvas;
end;

procedure TMsPaint.SizePreviewTimer(Sender: TObject);
var
  AMouse: TPoint;
begin
  AMouse := ScrollBox1.ScreenToClient(Mouse.CursorPos);
  AMouse.X := AMouse.X - CanvasHolder.Left;
  AMouse.Y := AMouse.Y - CanvasHolder.Top;

  // Dots
  if SizePreview.Tag <> 2 then
    DotsSize.Width := AMouse.X;
  if SizePreview.Tag <> 1 then
    DotsSize.Height := AMouse.Y;

  // Over dots
  DrawBox.Repaint;

  // Text
  Label10.Caption := ConvertUnit(round((DotsSize.Width-4) * ReverseScale)) + ' x ' + ConvertUnit(round((DotsSize.Height-4)*ReverseScale)) + GetUnit;

  // Corners
  CornerSize.Left := AMouse.X;
  CornerSize.Top := AMouse.Y;
end;

procedure TMsPaint.CopyCut(Sender: TObject);
begin
  if (SelectMode = TSelectionMode.Exists) and (Tool = TToolType.Select) then
    begin
      // Load into clipboard
      Clipboard.Assign(StolenZone);
    
      // Delete
      if TSpeedButton(Sender).Tag = 1 then
        FinishSelection(TCloseMode.Fail);
    end;
end;

procedure TMsPaint.SpeedButton103Click(Sender: TObject);
begin
  TogglePrintPreview(false);
end;

procedure TMsPaint.SpeedButton11Click(Sender: TObject);
begin
  if not Panel54.Visible then
    HideMiniPanels;

  Panel54.Visible := not Panel54.Visible;
end;

procedure TMsPaint.SpeedButton14Click(Sender: TObject);
begin
  if not Panel55.Visible then
    HideMiniPanels;

  Panel55.Visible := not Panel55.Visible;
end;

procedure TMsPaint.SpeedButton15Click(Sender: TObject);
begin
  if (SelectMode = TSelectionMode.Exists) and (Tool = TToolType.Select) then
    begin
      // Clear Selection
      Image.Assign(StolenZone);

      FinishSelection(TCloseMode.Fail);

      // Sizing
      UpdateSizing;
    end;
end;

procedure TMsPaint.SpeedButton16Click(Sender: TObject);
begin
  if not Panel58.Visible then
    HideMiniPanels;

  Panel58.Visible := not Panel58.Visible;
end;

procedure TMsPaint.SpeedButton17Click(Sender: TObject);
begin
  Properties := TProperties.Create(Self);
  try
    Properties.LoadImageData;
    Properties.ShowModal;
  finally
    Properties.Free;
  end;
end;

procedure TMsPaint.SpeedButton22Click(Sender: TObject);
begin
  if not Panel59.Visible then
    HideMiniPanels;

  Panel59.Visible := not Panel59.Visible;
end;

procedure TMsPaint.SpeedButton26Click(Sender: TObject);
begin
  HideMiniPanels;
    
  if Tool in [TToolType.Pencil, TToolType.Eraser, TToolType.Shape, TToolType.Brush] then
    begin
      case Tool of
        TToolType.Pencil: TrackBar2.Position := PenSize;
        TToolType.Eraser: TrackBar2.Position := EraserSize;
        TToolType.Shape: TrackBar2.Position := ShapePen;
        TToolType.Brush: TrackBar2.Position := BrushSize;
      end;

      Panel53.Show;
    end;
end;

procedure TMsPaint.SpeedButton29Click(Sender: TObject);
begin
  InvisibleEdit.PasteFromClipboard;
end;

procedure TMsPaint.SpeedButton31Click(Sender: TObject);
begin
  InvisibleEdit.CutToClipboard;
end;

procedure TMsPaint.SpeedButton32Click(Sender: TObject);
begin
  InvisibleEdit.CopyToClipboard;
end;

procedure TMsPaint.SpeedButton33Click(Sender: TObject);
begin
  ShellRun('ms-paint://', true);
end;

procedure TMsPaint.SpeedButton3Click(Sender: TObject);
begin
  if Fullscreen = nil then
    Fullscreen := TFullscreen.Create(Application);


  Fullscreen.Preview.Picture.Assign(Image);

  FullScreen.Show;
end;

procedure TMsPaint.SpeedButton4Click(Sender: TObject);
begin
  if Thumbnail = nil then
    Thumbnail := TThumbnail.Create(Application);
  Thumbnail.Preview.Picture.Assign(Image);

  Thumbnail.Preview.Picture.Graphic := Image;
  Thumbnail.Show;
end;

procedure TMsPaint.ColorSelect(Sender: TObject);
var
  AColor: TColor;
begin
  // Set Color
  AColor := GetColorTag(TSpeedButton(Sender).Tag);

  if AColor = TRANSPARENT_COLOR then
    AColor := TRANSPARENT_COLOR+1;

  if SpeedButton27.Down then
    PrimaryColor := AColor
  else
    SecondaryColor := AColor;

  // Update
  UpdateColorIcons;
end;

function PixelsToCm(Pixels: Integer; DPI: Integer): Double;
begin
  Result := Pixels / DPI * 2.54; // 2.54 cm = 1 inch
end;

function PixelsToInches(Pixels: Integer; DPI: Integer): Double;
begin
  Result := Pixels / DPI;
end;

function TMsPaint.ConvertUnit(Value: integer): string;
begin
  case Units of                                      
    TUnit.Pixel: Result := Value.ToString; 
    TUnit.Cm: Result := (trunc(PixelsToCm(Value, ADPI)*100)/100).ToString; 
    TUnit.Inch: Result := (trunc(PixelsToInches(Value, ADPI)*100)/100).ToString; 
  end;
end;

procedure TMsPaint.SpeedButton5Click(Sender: TObject);
begin
  TrackBar1.Position := 100;
end;

procedure TMsPaint.SpeedButton63Click(Sender: TObject);
var
  AColor: TColor;
begin
  // Set Color
  if SpeedButton27.Down then
    ColorDialog1.Color := PrimaryColor
  else
    ColorDialog1.Color := SecondaryColor;

  if ColorDialog1.Execute then
    begin
      AColor := ColorDialog1.Color;

      if SpeedButton27.Down then
        PrimaryColor := AColor
      else
        SecondaryColor := AColor;

      // Update
      UpdateColorIcons;

      AddColorHistory(AColor);
    end;
end;

procedure TMsPaint.SpeedButton66Click(Sender: TObject);
begin
  UpdateCanvas;
end;

procedure TMsPaint.SpeedButton6Click(Sender: TObject);
begin
  TrackBar1.Position := TrackBar1.Position + 10;
end;

procedure TMsPaint.SpeedButton7Click(Sender: TObject);
begin
  TrackBar1.Position := TrackBar1.Position - 10;
end;

procedure TMsPaint.SpeedButton84Click(Sender: TObject);
begin
  HideMiniPanels;
  ActionPasteClipboard.Execute;
end;

procedure TMsPaint.SpeedButton85Click(Sender: TObject);
begin
  HideMiniPanels;
  ActionClipboardFile.Execute;
end;

procedure TMsPaint.SpeedButton86Click(Sender: TObject);
begin
  SelectionType := TSelectionType(TSpeedButton(Sender).Tag);
  SpeedButton13.ImageIndex := TSpeedButton(Sender).Tag;

  HideMiniPanels;
end;

procedure TMsPaint.SpeedButton87Click(Sender: TObject);
begin
  FinishSelection(TCloseMode.Fail);
  ActionSelectAll.Execute;
end;

procedure TMsPaint.SpeedButton88Click(Sender: TObject);
begin
  FinishSelection(TCloseMode.Fail);
  HideMiniPanels;
end;

procedure TMsPaint.SpeedButton89Click(Sender: TObject);
begin
  TransparentSelection := TSpeedButton(Sender).Down;
  HideMiniPanels;

  ApplyTransparent;
  UpdateCanvas;
end;

procedure RotateBitmap90Degrees(var Bitmap: TBitmap);
var
  TempBitmap: TBitmap;
  I, J: Integer;
begin
  TempBitmap := TBitmap.Create;
  try
    TempBitmap.SetSize(Bitmap.Height, Bitmap.Width);

    for I := 0 to Bitmap.Width - 1 do
    begin
      for J := 0 to Bitmap.Height - 1 do
      begin
        TempBitmap.Canvas.Pixels[J, Bitmap.Width - I - 1] := Bitmap.Canvas.Pixels[I, J];
      end;
    end;

    Bitmap.Assign(TempBitmap);
  finally
    TempBitmap.Free;
  end;
end;         

procedure RotateBitmapNegative90Degrees(var Bitmap: TBitmap);
var
  TempBitmap: TBitmap;
  I, J: Integer;
begin
  TempBitmap := TBitmap.Create;
  try
    TempBitmap.SetSize(Bitmap.Height, Bitmap.Width);

    for I := 0 to Bitmap.Width - 1 do
    begin
      for J := 0 to Bitmap.Height - 1 do
      begin
        TempBitmap.Canvas.Pixels[Bitmap.Height - J - 1, I] := Bitmap.Canvas.Pixels[I, J];
      end;
    end;

    Bitmap.Assign(TempBitmap);
  finally
    TempBitmap.Free;
  end;
end;

procedure TMsPaint.SpeedButton90Click(Sender: TObject);
begin
  // Work
  FinishSelection();
  
  // Rotate
  case TSpeedButton(Sender).Tag of
    1: begin
      RotateBitmapNegative90Degrees(Image);
    end;
    2: begin
      RotateBitmap90Degrees(Image);
    end;
    3: begin
      RotateBitmap90Degrees(Image);
      RotateBitmap90Degrees(Image);
    end;
    4: begin
      Image.Canvas.StretchDraw(Rect(Image.Width, 0, 0, Image.Height), Image);
    end;
    5: begin
      Image.Canvas.StretchDraw(Rect(0, Image.Height, Image.Width, 0), Image);
    end;
  end;

  // Panel
  HideMiniPanels;

  // Update
  UpdateSizing;
end;

procedure TMsPaint.SelectBrush(Sender: TObject);
begin
  // Tool
  SelectTool(SpeedButton21);
  
  // Brush
  BrushID := TSpeedButton(Sender).Tag;

  // Icon
  SpeedButton21.Glyph.Assign( TSpeedButton(Sender).Glyph );
  
  // Panel
  HideMiniPanels;
end;

function TMsPaint.SelectionSupportsMoving: boolean;
begin
  case Tool of
    TToolType.Shape:
      case ShapeID of
        1: Result := false;
        2: Result := {Length(DrawingPoints) = 2} false;
        6: Result := false;
        else Result := true;
      end;

    else Result := true;
  end;
end;

procedure TMsPaint.SpeedButton9Click(Sender: TObject);
begin
  ActionPasteClipboard.Execute;
end;

procedure TMsPaint.StealSelectionZone;
var
  I: integer;
  ARect: TRect;
begin
  if SelectionType = TSelectionType.Rectangular then
    begin
      StolenZone := TBitMap.Create(SelectionImage.Width, SelectionImage.Height);

      // Steal
      StolenZone.Canvas.CopyRect(StolenZone.Canvas.ClipRect, Image.Canvas, SelectionImage);
    end
  else
    begin
      StolenZone := TBitMap.Create(SelectionImage.Width, SelectionImage.Height);

      // Transparency
      with StolenZone.Canvas do
        if TransparentSelection then
          begin
            Brush.Color := SecondaryColor;
            FillRect(ClipRect);
          end
        else
          begin
            //FakeTransparency := true;
            Brush.Color := TRANSPARENT_COLOR;
            FillRect(ClipRect);

            {StolenZone.Transparent := true;
            StolenZone.TransparentColor := Brush.Color;   }
          end;

      // Steal
      for I := 0 to High(FreeFormLines) do
        begin
          // Copy
          ARect := FreeFormLines[I];
          ARect.Offset(-SelectionImage.Left, -SelectionImage.Top);
          
          StolenZone.Canvas.CopyRect(ARect, Image.Canvas, FreeFormLines[I]);
        end;
    end;
end;

procedure TMsPaint.TogglePrintPreview(Enter: boolean);
begin
  // Finish anything
  FinishSelection();

  // Toggle
  if Enter then
    begin
      PaintBox3.Hide;
      PaintBox4.Hide;

      PaintBox10.Show;

      // Tool
      Tool := TToolType.None;

      // Page
      ClickPB(PaintBox10);

      // Scroll
      ScrollBox1.BorderStyle := bsSingle;

      CheckBox2.Checked := false;
      Panel60.Hide;

      // Extra
      TrackBar1.Position := 100;
    end
  else
    begin
      PaintBox4.Show;
      PaintBox3.Show;

      PaintBox10.Hide;
      
      // Tool
      Tool := TToolType.Select;
      
      // Page
      ClickPB(PaintBox3);

      // Scroll
      ScrollBox1.BorderStyle := bsNone;

      CheckBox2.Checked := false;
      Panel60.Show;
    end;

  PaintBox10.Repaint;
    
  // Update
  UpdateRulers;    
  UpdateSizing;
end;

procedure TMsPaint.ToggleTextPage(Enabled: boolean);
begin
  // Titlebar icon
  Text_View.Visible := Enabled;

  // Painbox
  if Enabled then
    begin
      if not PaintBox1.Visible then
        begin
          PaintBox1.Show;
          ClickPB(PaintBox1);
        end;
    end
  else
    begin
      PaintBox1.Hide;
      if SelectedTop = 3 then
        ClickPB(PaintBox3);
    end;
end;

procedure TMsPaint.TrackBar1Change(Sender: TObject);
begin
  Scale := TrackBar1.Position / 100;

  TranslateScale;
  UpdateSizing;
end;

procedure TMsPaint.TrackBar1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if SelectMode = TSelectionMode.Exists then
    Abort;
end;

procedure TMsPaint.Z(Sender: TObject);
begin
  case Tool of
    TToolType.Pencil: PenSize := TrackBar2.Position;
    TToolType.Eraser: EraserSize := TrackBar2.Position;
    TToolType.Shape: ShapePen := TrackBar2.Position;
    TToolType.Brush: BrushSize := TrackBar2.Position;
  end;
  
  PaintBox9.Repaint;
  UpdateCanvas;
end;

procedure TMsPaint.TranslateScale;
begin
  DownCanvas.X := round(DownImage.X * Scale);
  DownCanvas.Y := round(DownImage.Y * Scale);

  SelectionCanvas.Left := round(SelectionImage.Left * Scale);
  SelectionCanvas.Top := round(SelectionImage.Top * Scale);
  SelectionCanvas.Right := round(SelectionImage.Right * Scale);
  SelectionCanvas.Bottom := round(SelectionImage.Bottom * Scale);
end;

procedure TMsPaint.UpdateCanvas;
begin
  DrawBox.Repaint;

  // Thumbnail
  if (Thumbnail <> nil) and Thumbnail.Visible then
    begin
      Thumbnail.Preview.Picture.Graphic := Image;
    end;
end;

procedure TMsPaint.UpdateCanvasDrawn;
begin
  ChangesUnsaved := true;
  CacheNew;

  UpdateCanvas;
end;

procedure TMsPaint.UpdateColorIcons;
var
  ARect: TRect;
  AButton: TSpeedButton;
  I: Integer;
begin
  for I := 1 to 2 do
    begin
      if I = 1 then
        AButton := SpeedButton27
      else
        AButton := SpeedButton28;

      // Draw
      with AButton.Glyph.Canvas do
        begin
          Pen.Width := 1;
          ARect := ClipRect;
          if I = 1 then
            ARect.Inflate(-1, -1)
          else
            ARect.Inflate(-6, -6);

          Pen.Color := clGray;
          RoundRect(ARect, 4, 4);

          ARect.Inflate(-2, -2);
          Pen.Color := clWhite;
          if I = 1 then
            Brush.Color := PrimaryColor
          else
            Brush.Color := SecondaryColor;
          if Brush.Color = 0 then
            Brush.Color := 1;

          RoundRect(ARect, 4, 4);
        end;
    end;

  // Paint
  UpdateCanvas;
end;

procedure TMsPaint.UpdateFileSize;
begin
  FileDisplayName := ExtractFileName(FileName);

  Label12.Show;
  Label13.Caption := 'Size: ' + GetFileSizeInStr( FileName );
end;

procedure TMsPaint.UpdateRectSize;
begin
  Label8.Caption := ConvertUnit(SelectionImage.Width) + ' x ' + ConvertUnit(SelectionImage.Height) + GetUnit;
end;

procedure TMsPaint.UpdateRulers;
begin
  PaintBox7.Visible := CheckBox1.Checked and not Page_Print.Visible;
  PaintBox8.Visible := CheckBox1.Checked and not Page_Print.Visible;

  if CheckBox1.Checked then
    begin
      PaintBox7.OnPaint(PaintBox7);
      PaintBox8.OnPaint(PaintBox8);
    end;
end;

procedure TMsPaint.UpdateSizing;
var
  NewSize: TPoint;
  Anew: integer;
begin
  NewSize.X := round(Image.Width * Scale + 4);
  NewSize.Y := round(Image.Height * Scale + 4);
  if (NewSize.X <> CanvasHolder.Width) or (NewSize.Y <> CanvasHolder.Height) then
    begin
      CanvasHolder.Width := NewSize.X;
      CanvasHolder.Height := NewSize.Y;
    end;

  // Text
  Label10.Caption := ConvertUnit(Image.Width) + ' x ' + ConvertUnit(Image.Height) + GetUnit;
  Label3.Caption := (Scale * 100).ToString + '%';
  Title.Caption := FileDisplayName + ' - Paint';

  // Canvas
  UpdateCanvas;

  // Image
  SpeedButton4.Enabled := IsZoomExtend;

  // Arrange size icons
  CornerSize.Top := CanvasHolder.BoundsRect.Bottom;
  CornerSize.Left := CanvasHolder.BoundsRect.Right;

  LeftSize.Top := CanvasHolder.BoundsRect.Bottom - CanvasHolder.Height div 2;
  LeftSize.Left := CanvasHolder.BoundsRect.Right;

  TopSize.Top := CanvasHolder.BoundsRect.Bottom;
  TopSize.Left := CanvasHolder.BoundsRect.Right - CanvasHolder.Width div 2;

  // Print Preview
  if Page_Print.Visible then
    begin
      if CanvasHolder.Left + CanvasHolder.Width < ScrollBox1.Width - 5 then
        begin
          Anew := (ScrollBox1.Width-(CanvasHolder.Left + CanvasHolder.Width)) div 2;

          if Anew >= 5 then
            CanvasHolder.Left := Anew;
        end
      else
        CanvasHolder.Left := 5;
    end
      else
        if (CanvasHolder.Left <> 5) and (CanvasHolder.Width < ScrollBox1.Width) then
          CanvasHolder.Left := 5;
end;

procedure TMsPaint.UserSettings(Load: boolean);
const
  SEC = 'Prefrences';
var
  Setting: TIniFile;
begin
  Setting := TIniFile.Create( AppData + 'Configuration.ini' );
  try
    if Load then
      begin
        CheckBox1.Checked := Setting.ReadBool(SEC, 'Rulers', CheckBox1.Checked);
        CheckBox2.Checked := Setting.ReadBool(SEC, 'Gridlines', CheckBox2.Checked);
        CheckBox3.Checked := Setting.ReadBool(SEC, 'Status bar', CheckBox3.Checked);
        CheckBox4.Checked := Setting.ReadBool(SEC, 'View Text Editor', CheckBox4.Checked);

        Units := TUnit(Setting.ReadInteger(SEC, 'Units', 0));

        // Recent
        if TFile.Exists(AppData + 'Recents.ini') then
          RecentFiles.LoadFromFile(AppData + 'Recents.ini');
      end
    else
      begin
        Setting.WriteBool(SEC, 'Rulers', CheckBox1.Checked);
        Setting.WriteBool(SEC, 'Gridlines', CheckBox2.Checked);
        Setting.WriteBool(SEC, 'Status bar', CheckBox3.Checked);
        Setting.WriteBool(SEC, 'View Text Editor', CheckBox4.Checked);

        Setting.WriteInteger(SEC, 'Units', integer(Units));

        // Recent
        RecentFiles.SaveToFile(AppData + 'Recents.ini');
      end;
  finally
    Setting.Free;       
  end;
end;

procedure TMsPaint.SaveActionExecute(Sender: TObject);
begin
  SaveFile;
end;

procedure TMsPaint.Action2Execute(Sender: TObject);
begin
  SaveFileOptional;
end;

procedure TMsPaint.Action3Execute(Sender: TObject);
begin
  DoUndo;
end;

procedure TMsPaint.Action4Execute(Sender: TObject);
begin
  DoRedo;
end;

procedure TMsPaint.ActionClipboardFileExecute(Sender: TObject);
var
  ABitMap: TBitMap;
begin
  if OpenPictureDialog1.Execute then
    begin
      ABitMap := TBitMap.Create;
      try
        try
          LoadGraphicAsBitmap(OpenPictureDialog1.FileName, ABitMap);

          PastePicture(ABitMap, GetTopmostPoint);
        except

        end;
      finally
        ABitMap.Free;
      end;
    end;
end;

procedure TMsPaint.ActionCopyExecute(Sender: TObject);
begin
  SpeedButton12.OnClick(SpeedButton12);
end;

procedure TMsPaint.ActionCutExecute(Sender: TObject);
begin
  SpeedButton10.OnClick(SpeedButton10);
end;

procedure TMsPaint.ActionPasteClipboardExecute(Sender: TObject);
var
  ABitMap: TBitMap;
begin
  // Load
  ABitMap := TBitMap.Create;
  try
    try
      ABitMap.Assign(Clipboard);

      // Finish Selection
      FinishSelection();

      // Paste
      PastePicture(ABitMap, GetTopmostPoint);
    except

    end;
  finally
    ABitMap.Free;
  end;
end;

procedure TMsPaint.ActionPrintExecute(Sender: TObject);
begin
  BeginPrint;
end;

procedure TMsPaint.ActionSelectAllExecute(Sender: TObject);
begin
  // Finalise
  FinishSelection();
  
  // Tool
  SelectTool(SpeedButton13);
  
  // Select
  SelectMode := TSelectionMode.Exists;
  SelectionCanvas := DrawBox.ClientRect;
  SelectionImage := Rect(0, 0, Image.Width, Image.Height);
  
  StolenZone := TBitMap.Create;
  StolenZone.Assign( Image );
  
  with Image.Canvas do
    begin
      Brush.Style := bsSolid;
      Brush.Color := SecondaryColor;
      
      FillRect(SelectionImage);
    end;
  
  // Update
  UpdateCanvas;
end;

procedure TMsPaint.AddColorHistory(AColor: TColor);
var
  I: Integer;
begin
  // Add Color
  for I := 10 downto 2 do
    ColorHistory[I] := ColorHistory[I-1];

  ColorHistory[1] := AColor;

  // Update
  LoadColorIcons(Panel42);
end;

procedure TMsPaint.AnimateKeysTimer(Sender: TObject);
begin
  SelectionImage.Offset(KeyOffset);
  TranslateScale;

  // Paint
  UpdateCanvas;
end;

procedure TMsPaint.ApplyFontStyling(Font: TFont);
begin
  Font.Color := PrimaryColor;
  Font.Name := Font_List.Text;
  Font.Size := strtoint(Font_Size.Text);

  Font.Style := [];
  if Font_Bold.Down then
    Font.Style := Font.Style + [fsBold];

  if Font_Italic.Down then
    Font.Style := Font.Style + [fsItalic];

  if Font_Underline.Down then
    Font.Style := Font.Style + [fsUnderline];

  if Font_Striked.Down then
    Font.Style := Font.Style + [fsStrikeOut];
end;

procedure TMsPaint.ApplyTransparent;
begin
  if StolenZone <> nil then
    begin
      if TransparentSelection then
        begin
          StolenZone.TransparentColor := SecondaryColor;
        end;
      StolenZone.Transparent := TransparentSelection;
    end;
end;

procedure TMsPaint.BeginPrint;
begin
  if CPrintDialog1.Execute then
    begin
      CPrintDialog1.StartDocument;     

      CPrintDialog1.NewPage;
      with CPrintDialog1.Canvas do
        begin
          DrawImageInRect(CPrintDialog1.Canvas, ClipRect, Image, TDrawMode.Fit);
        end;

      CPrintDialog1.EndDocument;
    end;
end;

procedure TMsPaint.BrushTickTimer(Sender: TObject);
begin
  DrawBox.OnMouseMove(DrawBox, [], PositionCanvas.X, PositionCanvas.Y);
end;

procedure TMsPaint.ButtonPressRepaint(Sender: TObject);
begin
  UpdateCanvas;
end;

procedure TMsPaint.CacheNew;
var
  I: Integer;
begin
  if DoPos > 0 then
    begin
      for I := 0 to High(History)-DoPos do
        History[I] := History[I+DoPos];

      SetLength( History, Length(History)-DoPos );

      DoPos := 0;
    end;

  // Move
  SetLength(History, Length(History)+1);
  for I := High(History) downto 1 do
    History[I] := History[I-1];

  // Add
  History[0] := TBitMap.Create;
  with History[0] do
    History[0].Assign(Image);

  // Limit
  if Length(History) > MAX_UNDO then
    SetLength(History, MAX_UNDO);
end;

procedure TMsPaint.CalculateFreeForm;
var
  AX, AY: integer;
  SmL, SmT, SmR, SmB: integer;
  Began, Selected, NextIs, LastWas, Ended: boolean;
  X, Y, I, LastFound, Total, Index: Integer;
  StartPos: TPoint;
begin
  if SelectionType = TSelectionType.FreeForm then
    begin
      // Finish Circle
      FinaliseFreeForm;

      // Get points
      SmL := Image.Width;
      SmT := Image.Height;
      SmR := 0;
      SmB := 0;

      FreeFormPoints := 0;

      // Rect
      for AX := 0 to High(FreeFormBorder) do
        for AY := 0 to High(FreeFormBorder[AX]) do
          if FreeFormBorder[AX, AY] then
            begin
              if AX < SmL then
                SmL := AX;
              if AY < SmT then
                SmT := AY;

              if AX > SmR then
                SmR := AX;
              if AY > SmB then
                SmB := AY;

              Inc(FreeFormPoints);
            end;

      SelectionImage.TopLeft := Point(SmL, SmT);
      SelectionImage.BottomRight := Point(SmR, SmB);

      SelectionImage.NormalizeRect;
      
      // Translate
      TranslateScale;

      // Calculate Zone
      SetLength(FreeFormLines, 0);
      SetLength(FreeFormSelection, 0, 0);
      SetLength(FreeFormSelection, SelectionImage.Width+1, SelectionImage.Height+1);
      
      for Y := 0 to SelectionImage.Height do
        begin
          Began := false;
          Selected := false;
          Ended := false;
          Total := 0;
          LastFound := -1;
              
          // Delete single point lines
          for X := 0 to SelectionImage.Width do
            begin        
              // Last
              LastWas := Selected;

              // Get Data
              AX := SelectionImage.Left + X;
              AY := SelectionImage.Top + Y;
            
              // Began
              Selected := FreeFormBorder[AX, AY];

              // Found New
              if LastWas and not Selected then
                begin
                  Inc(Total);
                  LastFound := AX;
                end;
            end;

          // Delete Item
          if (Total mod 2 <> 0) then
            begin
              AY := SelectionImage.Top + Y;
              
              FreeFormBorder[LastFound, AY] := false;
            end;

          // Analise
          for X := 0 to SelectionImage.Width do
            begin
              if Ended then
                begin
                  Ended := false;
                  Continue;
                end;
            
              // Get Data
              AX := SelectionImage.Left + X;
              AY := SelectionImage.Top + Y;
            
              // Began
              Selected := FreeFormBorder[AX, AY];

              // Next
              NextIs := (X < SelectionImage.Width) and FreeFormBorder[AX+1, AY];

              // Skip
              if Selected and NextIs then
                Continue;
              
              // Line Ended
              if Began and NextIs then
                begin
                  // Offset
                  AX := AX;
                  AY := AY - SelectionImage.Top;

                  // Set values
                  for I := StartPos.X - SelectionImage.Left to AX - SelectionImage.Left do
                    FreeFormSelection[I, AY] := true;

                  // Document Line
                  Index := Length(FreeFormLines);
                  SetLength(FreeFormLines, Index+1);
                  FreeFormLines[Index] := 
                    Rect(StartPos.X, AY + SelectionImage.Top, 
                    AX, AY + SelectionImage.Top+1);
                    
                  // Ended
                  Began := false;
                  Ended := true;
                  Continue;
                end;
              
              // Line began
              if not Began and Selected then
                begin
                  StartPos := Point(AX, AY);

                  // Started
                  Began := true;
                  Continue;
                end;
            end;
        end;
    end;
end;

procedure TMsPaint.CanvasHolderMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  // Rulers
  UpdateRulers;
end;

procedure TMsPaint.CanvasUpdaterTimer(Sender: TObject);
begin
  UpdateCanvas;
end;

procedure TMsPaint.CButton1Click(Sender: TObject);
begin
  ShellRun('https://www.codrutsoft.com/', false);
end;

procedure TMsPaint.CButton2Click(Sender: TObject);
begin
  TrackBar1.Position := TrackBar1.Position + 5;
end;

procedure TMsPaint.CButton3Click(Sender: TObject);
begin
  TrackBar1.Position := TrackBar1.Position - 5;
end;

procedure TMsPaint.ChangeTool(ATool: TToolType);
begin
  Tool := ATool;

  // UI
  HideMiniPanels;
end;

procedure TMsPaint.CheckBox1Click(Sender: TObject);
begin
  UpdateRulers;
end;

procedure TMsPaint.CheckBox2Click(Sender: TObject);
begin
  UpdateCanvas;
end;

procedure TMsPaint.CheckBox3Click(Sender: TObject);
begin
  StatusBar.Visible := CheckBox3.Checked;
end;

procedure TMsPaint.CheckBox4Click(Sender: TObject);
begin
  if not CheckBox4.Checked then
    InvisibleEdit.Width := 0
  else
    UpdateCanvas;
end;

procedure TMsPaint.ClearAllSelect(Exception: TSpeedButton);
procedure FixButtons(Search: TPanel);
  var
    I: Integer;
begin
  for I := 0 to Search.ControlCount-1 do
    begin
      if Search.Controls[I] is TPanel then
        FixButtons(TPanel(Search.Controls[I]));

      if Search.Controls[I] is TSpeedButton then
        TSpeedButton(Search.Controls[I]).Down := false;
    end;
end;
begin
  //
  SpeedButton13.Down := false;

  SpeedButton18.Down := false;
  SpeedButton19.Down := false;
  SpeedButton20.Down := false;

  SpeedButton23.Down := false;
  SpeedButton24.Down := false;
  SpeedButton25.Down := false;

  SpeedButton21.Down := false;

  FixButtons(Panel48);

  // Except
  Exception.Down := true;
end;

procedure TMsPaint.ClickPB(Sender: TObject);
begin
  SelectedTop := TPaintBox(Sender).Tag;

  SelectPanel(SelectedTop);

  // Redraw All
  Panel1.Repaint;
  PaintBox5.Repaint;
end;

end.
