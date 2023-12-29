﻿{***********************************************************}
{                  Codruts System Utilities                 }
{                                                           }
{                        version 0.6                        }
{                           BETA                            }
{                                                           }
{                                                           }
{                                                           }
{                                                           }
{                                                           }
{                   -- WORK IN PROGRESS --                  }
{***********************************************************}

{$WARN SYMBOL_PLATFORM OFF}

unit Cod.SysUtils;

interface
  uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Registry, Vcl.Dialogs, Vcl.Forms, Vcl.StdCtrls,
  Vcl.Styles, Vcl.Themes, UITypes, Types, Winapi.shlobj, Cod.Registry, Math,
  IOUtils, ActiveX, ComObj, Variants, ShellApi, Cod.ColorUtils,
  System.TypInfo, Vcl.Imaging.pngimage, PngFunctions, PsApi, Cod.Files, Cod.Types,
  Cod.StringUtils, Winapi.Wbem, System.ImageList, Cod.MesssageConst, IniFiles,
  Cod.Windows;

  type
    { If the number of attributes if ever changed, it is required to update the
    write atttributes procedure with the new number in mind!! }

    TFileVersionInfo = record
      fCompanyName,
      fFileDescription,
      fFileVersion,
      fInternalName,
      fLegalCopyRight,
      fLegalTradeMark,
      fOriginalFileName,
      fProductName,
      fProductVersion,
      fComments: string;
    end;

    TStrInterval = record
      AStart: integer;
      AEnd: integer;

      function Length: integer;
    end;

  { Forms }
  procedure CenterFormInForm(form, primaryform: TForm; alsoopen: boolean = false);
  procedure CenterFormOnScreen(form: TForm);
  procedure ChangeMainForm(NewForm: TForm);
  function MouseAboveForm(form: TForm): boolean;
  procedure FormPositionSettings(Form: TForm; FileName: string; Load: boolean;
    Closing: boolean = true);

  { Icons }
  procedure GetIconStrIcon(IconString: string; var PngImage: TPngImage);
  procedure GetFileIcon(FileName: string; var PngImage: TPngImage; IconIndex: word = 0);
  procedure GetFileIconEx(FileName: string; var PngImage: TPngImage; IconIndex: word = 0; SmallIcon: boolean = false);
  function GetFileIconCount(FileName: string): integer;
  function GetAllFileIcons(FileName: string): TArray<TPngImage>;

  { Application }
  function IsAdministrator: boolean;

  function GetParameter(Index: integer): string;
  function GetParameters: string;

  { Components }
  procedure CopyObject(ObjFrom, ObjTo: TObject);
  procedure PrepareCustomTitleBar(var TitleBar: TForm; const Background: TColor; Foreground: TColor);
  procedure ResetPropertyValues(const AObject: TObject);
  procedure SetProperty(const AObject: TObject; PropertyName, NewValue: string); overload;
  procedure SetProperty(const AObject: TObject; PropertyName: string; NewValue: integer); overload;
  procedure SetProperty(const AObject: TObject; PropertyName: string; NewValue: boolean); overload;
  procedure SetStringProperty(const AObject: TObject; PropertyName, NewValue: string);
  procedure SetIntegerProperty(const AObject: TObject; PropertyName: string; NewValue: integer);
  procedure SetBooleanProperty(const AObject: TObject; PropertyName: string; NewValue: boolean);

  { File Associations }
  procedure UnregisterFileType(FileExt: String; OnlyForCurrentUser: boolean = true);
  function FileTypeExists(FileExt: String; OnlyForCurrentUser: boolean = true): boolean;
  function GetFileTypeAssociation(FileExt: String; var ADesc, AIcon: string; OnlyForCurrentUser: boolean = true): string;
  procedure RegisterFileType( FileExt: String; FileTypeDescription: String; ICONResourceFileFullPath: String; ApplicationFullPath: String; OnlyForCurrentUser: boolean = true);

  function GetGenericFileType( AExtension: string ): string;
  function GetGenericIconIndex( AExtension: string ): integer;
  function GetGenericFileIcon( AExtension: string; ALargeIcon: boolean = true ): TIcon;

  { Debug }
  procedure Debug(Value: string);

  { Shell }
  procedure ShellRun(Command: string; ShowConsole: boolean; Parameters: string = ''; Administrator: boolean = false; Directory: string = '');
  procedure PowerShellRun(Command: string; ShowConsole: boolean; Administrator: boolean = false; Directory: string = '');
  function PowerShellGetOutput(Command: string; ShowConsole: boolean; WaitFor: boolean = false; WantOutput: boolean = true): TStringList;
  procedure WaitForProgramExecution(CommandLine: string);
  procedure HighlightItemExplorer(ItemPath: string);

  procedure FlashWindowInTaskbar;
  function GetFormMonitorIndex(Form: TForm): integer;

  { File }
  function GetAllFileProperties(filename: string; allowempty: boolean = true): TStringList;
  function GetFileProperty(FileName, PropertyName: string): string;
  //External
  function GetAllFileVersionInfo(FileName: string): TFileVersionInfo;
  function GetFileOwner(const AFileName : string) : string;

  { Misc }
  function IsInIDE: boolean;

implementation

procedure CenterFormOnScreen(form: TForm);
begin
  form.Left := Screen.Width div 2 - form.Width div 2;
  form.Top := Screen.Height div 2 - form.Height div 2;
end;

procedure ChangeMainForm(NewForm: TForm);
begin
  Pointer((@Application.MainForm)^) := NewForm;
end;

procedure CenterFormInForm(form, primaryform: TForm; alsoopen: boolean);
begin
  if form.Position <> poDesigned then
    form.Position := poDesigned;

  form.Left := primaryform.Left + primaryform.Width div 2 -form.Width div 2;
  form.Top := primaryform.Top + primaryform.Height div 2 -form.Height div 2;

  if alsoopen then
    form.Show;
end;

function MouseAboveForm(form: TForm): boolean;
begin
  Result := false;

  if (mouse.CursorPos.X > form.Left)
    and (mouse.CursorPos.Y > form.Top)
    and (mouse.CursorPos.X < form.Left + form.Width)
    and (mouse.CursorPos.Y < form.Top + form.Height) then
      Result := true;
end;

procedure FormPositionSettings(Form: TForm; FileName: string;
  Load, Closing: boolean);
const
  SECT_DAT = 'Positions';
var
  Ini: TIniFile;

  // Previous
  PrevState: TWindowState;
  PrevValue: byte;
  PrevEn: boolean;
begin
  with Form do
    begin
      if Load and not TFile.Exists(FileName) then
        begin
          Left := (Screen.Width - Width) div 2;
          Top := (Screen.Height - Height) div 2;
        end;

      Ini := TIniFile.Create(FileName);
      with Ini do
        try
          if Load then
            begin
              WindowState := TWindowState.wsNormal;

              Left := ReadInteger(SECT_DAT, 'Left', Left);
              Top := ReadInteger(SECT_DAT, 'Top', Top);
              Width := ReadInteger(SECT_DAT, 'Width', Width);
              Height := ReadInteger(SECT_DAT, 'Height', Height);

              WindowState := TWindowState(ReadInteger(SECT_DAT, 'State', integer(WindowState)));
              if WindowState = wsMinimized then
                WindowState := wsNormal;
            end
          else
            begin
              PrevEn := false;
              PrevValue := 255;

              WriteInteger(SECT_DAT, 'State', integer(WindowState));
              if WindowState = wsMinimized then
                begin
                  PrevEn := AlphaBlend;
                  PrevValue := AlphaBlendValue;

                  AlphaBlend := true;
                  AlphaBlendValue := 0;
                end;
              PrevState := WindowState;
              WindowState := TWindowState.wsNormal;

              WriteInteger(SECT_DAT, 'Left', Left);
              WriteInteger(SECT_DAT, 'Top', Top);
              WriteInteger(SECT_DAT, 'Width', Width);
              WriteInteger(SECT_DAT, 'Height', Height);

              // Revert
              if not Closing then
                begin
                  WindowState := PrevState;
                  if WindowState = wsMinimized then
                    begin
                      AlphaBlend := PrevEn;
                      AlphaBlendValue := PrevValue;
                    end;
                end;
            end;
        finally
          Free;
        end;
    end;
end;

procedure RegisterFileType(FileExt, FileTypeDescription,
  ICONResourceFileFullPath, ApplicationFullPath: String;
  OnlyForCurrentUser: boolean);
var
  R: TRegistry;
begin
  R := TRegistry.Create;
  try
    if OnlyForCurrentUser then
      R.RootKey := HKEY_CURRENT_USER
    else
      R.RootKey := HKEY_LOCAL_MACHINE;

    if R.OpenKey('\Software\Classes\.' + FileExt, true) then begin
      R.WriteString('', FileExt + 'File');
      if R.OpenKey('\Software\Classes\' + FileExt + 'File', true) then begin
        R.WriteString('', FileTypeDescription);
        if R.OpenKey('\Software\Classes\' + FileExt + 'File\DefaultIcon', true) then
        begin
          R.WriteString('', ICONResourceFileFullPath);
          if R.OpenKey('\Software\Classes\' + FileExt + 'File\shell\open\command', true) then
          R.WriteString('', ApplicationFullPath + ' "%1"');
          end;
        end;
      end;
    finally
    R.Free;
  end;
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
end;

function GetGenericFileType( AExtension: string ): string;
{ Get file type for an extension }
var
  AInfo: TSHFileInfo;
begin
  SHGetFileInfo( PChar( AExtension ), FILE_ATTRIBUTE_NORMAL, AInfo, SizeOf( AInfo ),
    SHGFI_TYPENAME or SHGFI_USEFILEATTRIBUTES );
  Result := AInfo.szTypeName;
end;

function GetGenericIconIndex( AExtension: string ): integer;
{ Get icon index for an extension type }
var
  AInfo: TSHFileInfo;
begin
  if SHGetFileInfo( PChar( AExtension ), FILE_ATTRIBUTE_NORMAL, AInfo, SizeOf( AInfo ),
    SHGFI_SYSICONINDEX or SHGFI_SMALLICON or SHGFI_USEFILEATTRIBUTES ) <> 0 then
  Result := AInfo.iIcon
  else
    Result := -1;
end;

function GetGenericFileIcon( AExtension: string; ALargeIcon: boolean ): TIcon;
{ Get icon for an extension }
var
  AInfo: TSHFileInfo;
  AIcon: TIcon;
  AFlags: integer;
begin
  AFlags :=SHGFI_ICON+SHGFI_TYPENAME+SHGFI_USEFILEATTRIBUTES;
  if ALargeIcon then
    AFlags := AFlags + SHGFI_LARGEICON
  else
    AFlags := AFlags + SHGFI_SMALLICON;

  if SHGetFileInfo( PChar( AExtension ), FILE_ATTRIBUTE_NORMAL, AInfo, SizeOf( AInfo ),
    AFlags ) <> 0 then
  begin
    AIcon := TIcon.Create;
    try
      AIcon.Handle := AInfo.hIcon;
      Result := AIcon;
    except
      AIcon.Free;
      raise;
    end;
  end
  else
    Result := nil;
end;

function FileTypeExists(FileExt: String;
  OnlyForCurrentUser: boolean): boolean;
var
  key: HKEY;
  Reg: TWinRegistry;
begin
  if OnlyForCurrentUser then
    key := HKEY_CURRENT_USER
  else
    key := HKEY_LOCAL_MACHINE;

  Result := false;

  Reg := TWinRegistry.Create;
  try
    Reg.ManualHive := key;
    if
      Reg.KeyExists('\Software\Classes\.' + FileExt) AND
      Reg.KeyExists('\Software\Classes\' + FileExt + 'File')
    then Result := true;
  finally
    Reg.Free;
  end;
end;

function GetFileTypeAssociation(FileExt: String; var ADesc, AIcon: string;
         OnlyForCurrentUser: boolean): string;
var
  R: TRegistry;
begin
  R := TRegistry.Create(KEY_READ);
  try
    if FileExt[1] = '.' then
      FileExt := Copy(FileExt, 2, Length(FileExt));

    if OnlyForCurrentUser then
      R.RootKey := HKEY_CURRENT_USER
    else
      R.RootKey := HKEY_LOCAL_MACHINE;

    if R.OpenKey('\Software\Classes\.' + FileExt, false) then begin
      if R.OpenKey('\Software\Classes\' + FileExt + 'File', false) then begin
        ADesc := R.ReadString('');
        if R.OpenKey('\Software\Classes\' + FileExt + 'File\DefaultIcon', false) then
        begin
          AIcon := R.ReadString('');
          if R.OpenKey('\Software\Classes\' + FileExt + 'File\shell\open\command', false) then
          Result := R.ReadString('');

          Result := StringReplace(Result, ' "%1"', '', [rfReplaceAll]);
          end;
        end;
      end;
    finally
    R.Free;
  end;
end;

procedure FlashWindowInTaskbar;
var
  Flash: FLASHWINFO;
begin
  FillChar(Flash, SizeOf(Flash), 0);
  Flash.cbSize := SizeOf(Flash);
  Flash.hwnd := Application.Handle;
  Flash.uCount := 5;
  Flash.dwTimeOut := 2000;
  Flash.dwFlags := FLASHW_ALL;
  FlashWindowEx(Flash);
end;

function GetFormMonitorIndex(Form: TForm): integer;
var
  I: Integer;
  CenterPosition: TPoint;
begin
  // Default
  Result := Screen.PrimaryMonitor.MonitorNum;

  // Position
  CenterPosition := Point(Form.Left + Form.Width div 2, Form.Top + Form.Height div 2);

  // Scan Monitors
  for I := 0 to Screen.MonitorCount -1 do
    if Screen.Monitors[I].BoundsRect.Contains( CenterPosition ) then
      Exit( Screen.Monitors[I].MonitorNum );
end;

procedure Debug(Value: string);
begin
  OutPutDebugString( PChar(Value) );
end;

procedure ShellRun(Command: string; ShowConsole: boolean; Parameters: string; Administrator: boolean; Directory: string);
var
  OperationType: string;
  Parameter: integer;
begin
  if Administrator then
    OperationType := 'runas'
  else
    OperationType := 'open';

  if ShowConsole then
    Parameter := SW_NORMAL
  else
    Parameter := SW_HIDE;

  ShellExecute(0, PChar(OperationType), PChar(Command), PChar(Parameters), PChar(Directory), Parameter);
end;

procedure PowerShellRun(Command: string; ShowConsole: boolean; Administrator: boolean; Directory: string);
var
  Parameter: integer;
  OperationType: string;

  ShellParams: string;
begin
  // Settings
  if Administrator then
    OperationType := 'runas'
  else
    OperationType := 'open';

  if ShowConsole then
    Parameter := SW_NORMAL
  else
    Parameter := SW_HIDE;

  // Replace quote mark
  Command := Command.Replace('"', #$27);

  // As Param
  ShellParams := '-c "' + Command + '"';

  ShellExecute(0, PChar(OperationType), 'powershell', PChar(ShellParams), PChar(Directory), Parameter);
end;

function PowerShellGetOutput(Command: string; ShowConsole, WaitFor, WantOutput: boolean): TStringList;
const
    READ_BUFFER_SIZE = 2400;
var
    Security: TSecurityAttributes;
    readableEndOfPipe, writeableEndOfPipe: THandle;
    start: TStartUpInfo;
    ProcessInfo: TProcessInformation;
    Buffer: PAnsiChar;
    BytesRead: DWORD;
    AppRunning: DWORD;
    DosApp: string;
begin
    Security.nLength := SizeOf(TSecurityAttributes);
    Security.bInheritHandle := True;
    Security.lpSecurityDescriptor := nil;

    // Prepare Executable
    DosApp := 'powershell -c "' + Command.Replace('"', #$27) + '"';

    // Output
    Result := TStringList.Create;

    if CreatePipe({var}readableEndOfPipe, {var}writeableEndOfPipe, @Security, 0) then
    begin
        Buffer := AllocMem(READ_BUFFER_SIZE+1);
        FillChar(Start, Sizeof(Start), #0);
        start.cb := SizeOf(start);

        // Set up members of the STARTUPINFO structure.
        // This structure specifies the STDIN and STDOUT handles for redirection.
        // - Redirect the output and error to the writeable end of our pipe.
        // - We must still supply a valid StdInput handle (because we used STARTF_USESTDHANDLES to swear that all three handles will be valid)
        start.dwFlags := start.dwFlags or STARTF_USESTDHANDLES;
        start.hStdInput := GetStdHandle(STD_INPUT_HANDLE); //we're not redirecting stdInput; but we still have to give it a valid handle
        if WantOutput then
          start.hStdOutput := writeableEndOfPipe; //we give the writeable end of the pipe to the child process; we read from the readable end
        start.hStdError := writeableEndOfPipe;

        //We can also choose to say that the wShowWindow member contains a value.
        //In our case we want to force the console window to be hidden.
        start.dwFlags := start.dwFlags + STARTF_USESHOWWINDOW;
        if ShowConsole then
          start.wShowWindow := SW_NORMAL
        else
          start.wShowWindow := SW_HIDE;  // SW_HIDE makes the wait process stuck in a loop!

        // Don't forget to set up members of the PROCESS_INFORMATION structure.
        ProcessInfo := Default(TProcessInformation);

        //WARNING: The unicode version of CreateProcess (CreateProcessW) can modify the command-line "DosApp" string.
        //Therefore "DosApp" cannot be a pointer to read-only memory, or an ACCESS_VIOLATION will occur.
        //We can ensure it's not read-only with the RTL function: UniqueString
        UniqueString({var}DosApp);

        if CreateProcess(nil, PChar(DosApp), nil, nil, True, NORMAL_PRIORITY_CLASS, nil, nil, start, {var}ProcessInfo) then
        begin
            //Wait for the application to terminate, as it writes it's output to the pipe.
            //WARNING: If the console app outputs more than 2400 bytes (ReadBuffer),
            //it will block on writing to the pipe and *never* close.
            repeat
                Apprunning := WaitForSingleObject(ProcessInfo.hProcess, 100);

                if not WaitFor then
                  Application.ProcessMessages;
            until (Apprunning <> WAIT_TIMEOUT);

            //Read the contents of the pipe out of the readable end
            //WARNING: if the console app never writes anything to the StdOutput, then ReadFile will block and never return
            // If you just want to wait for a process to finish, set WantOutput to false
            if WantOutput then
              repeat
                BytesRead := 0;
                ReadFile(readableEndOfPipe, Buffer[0], READ_BUFFER_SIZE, {var}BytesRead, nil);
                Buffer[BytesRead]:= #0;
                OemToAnsi(Buffer,Buffer);
                Result.Text := Result.text + String(Buffer);
              until (BytesRead < READ_BUFFER_SIZE);
        end;
        FreeMem(Buffer);
        CloseHandle(ProcessInfo.hProcess);
        CloseHandle(ProcessInfo.hThread);
        CloseHandle(readableEndOfPipe);
        CloseHandle(writeableEndOfPipe);
    end;
end;

procedure WaitForProgramExecution(CommandLine: string);
const
    READ_BUFFER_SIZE = 2400;
var
    Security: TSecurityAttributes;
    readableEndOfPipe, writeableEndOfPipe: THandle;
    start: TStartUpInfo;
    ProcessInfo: TProcessInformation;
    Buffer: PAnsiChar;
    AppRunning: DWORD;
begin
    Security.nLength := SizeOf(TSecurityAttributes);
    Security.bInheritHandle := True;
    Security.lpSecurityDescriptor := nil;

    if CreatePipe({var}readableEndOfPipe, {var}writeableEndOfPipe, @Security, 0) then
    begin
        Buffer := AllocMem(READ_BUFFER_SIZE+1);
        FillChar(Start, Sizeof(Start), #0);
        start.cb := SizeOf(start);

        // Set up members of the STARTUPINFO structure.
        // This structure specifies the STDIN and STDOUT handles for redirection.
        // - Redirect the output and error to the writeable end of our pipe.
        // - We must still supply a valid StdInput handle (because we used STARTF_USESTDHANDLES to swear that all three handles will be valid)
        start.dwFlags := start.dwFlags or STARTF_USESTDHANDLES;
        start.hStdInput := GetStdHandle(STD_INPUT_HANDLE); //we're not redirecting stdInput; but we still have to give it a valid handle
        start.hStdOutput := writeableEndOfPipe; //we give the writeable end of the pipe to the child process; we read from the readable end
        start.hStdError := writeableEndOfPipe;

        start.dwFlags := start.dwFlags + STARTF_USESHOWWINDOW;
        start.wShowWindow := SW_HIDE;

        ProcessInfo := Default(TProcessInformation);

        UniqueString({var}CommandLine);

        if CreateProcess(nil, PChar(CommandLine), nil, nil, True, NORMAL_PRIORITY_CLASS, nil, nil, start, {var}ProcessInfo) then
        begin
            //Wait for the application to terminate, as it writes it's output to the pipe.
            //WARNING: If the console app outputs more than 2400 bytes (ReadBuffer),
            //it will block on writing to the pipe and *never* close.
            repeat
                Apprunning := WaitForSingleObject(ProcessInfo.hProcess, 100);
            until (Apprunning <> WAIT_TIMEOUT);
        end;
        FreeMem(Buffer);
        CloseHandle(ProcessInfo.hProcess);
        CloseHandle(ProcessInfo.hThread);
        CloseHandle(readableEndOfPipe);
        CloseHandle(writeableEndOfPipe);
    end;
end;

procedure HighlightItemExplorer(ItemPath: string);
begin
  ShellRun('explorer.exe', true, Format('/select,"%S"', [ItemPath]));
end;

function IsAdministrator: boolean;
const
  SECURITY_NT_AUTHORITY: TSIDIdentifierAuthority =
    (Value: (0, 0, 0, 0, 0, 5));
  SECURITY_BUILTIN_DOMAIN_RID = $00000020;
  DOMAIN_ALIAS_RID_ADMINS = $00000220;
var
  AdminGroup: PSID;
  Res: longbool;
begin
  // IsUserAdmin from Shell32 also works
  if AllocateAndInitializeSid(
    SECURITY_NT_AUTHORITY, 2,
    SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS,
    0, 0, 0, 0, 0, 0, AdminGroup) then
  begin
    try
      CheckTokenMembership(0, AdminGroup, Res);
      Result := Res;
    finally
      FreeSid(AdminGroup);
    end;
  end
  else
    Result := False;
end;

function GetParameter(Index: integer): string;
begin
  Result := ParamStr(Index);

  // Fix WinNT
  if (Result[1] = '/') then
    Result[1] := '-';

  // Caps for parameter
  if (Result[1] = '/') then
    Result := AnsiLowerCase( Result );
end;

function GetParameters: string;
var
  I: Integer;
  Parameter: string;
  ACount: integer;
begin
  ACount := ParamCount;
  for I := 1 to ParamCount do
    begin
      Parameter := GetParameter(I);

      if Parameter.IndexOf(' ') <> -1 then
        Parameter := Format('"%S"', [Parameter]);

      Result := Result + Parameter;
      if I <> ACount then
        Result := Result + ' ';
    end;
end;

procedure GetIconStrIcon(IconString: string; var PngImage: TPngImage);
var
  ic: TIcon;
  FileName: string;
  IconIndex: word;
  Sep: integer;
begin
  if TFile.Exists(IconString) then
    begin
      IconIndex := 0;
      FileName := IconString;
    end
  else
    begin
      Sep := IconString.LastIndexOf(',');
      FileName := Copy(IconString, 1, Sep);
      IconIndex := Copy(IconString, Sep+2, Length(IconString)).ToInteger;
    end;

  // Get TIcon
  ic := TIcon.Create;
  try
    ic.Handle := ExtractAssociatedIcon(HInstance, PChar(FileName), IconIndex);
    ic.Transparent := true;

    // Convert to PNG
    ConvertToPNG(ic, PngImage);
  finally
    ic.Free;
  end;
end;

procedure GetFileIcon(FileName: string; var PngImage: TPngImage; IconIndex: word);
var
  ic: TIcon;
begin
  // Get TIcon
  ic := TIcon.Create;
  try
    ic.Handle := ExtractAssociatedIcon(HInstance, PChar(FileName), IconIndex);
    ic.Transparent := true;

    // Convert to PNG
    ConvertToPNG(ic, PngImage);
  finally
    ic.Free;
  end;
end;

procedure GetFileIconEx(FileName: string; var PngImage: TPngImage; IconIndex: word;
  SmallIcon: boolean);
var
  ic: TIcon;
  SHFileInfo: TSHFileInfo;
  Flags: Cardinal;
begin
  Flags := SHGFI_ICON or SHGFI_USEFILEATTRIBUTES;
  if SmallIcon then
    Flags := Flags or SHGFI_SMALLICON
  else
    Flags := Flags or SHGFI_LARGEICON;

  SHGetFileInfo(PChar(FileName), 0, SHFileInfo, SizeOf(TSHFileInfo),
    Flags);

  // Get TIcon
  ic := TIcon.Create;
  try
    ic.Handle := SHFileInfo.hIcon;;
    ic.Transparent := true;

    // Convert to PNG
    PngImage := TPngImage.Create;

    ConvertToPNG(ic, PngImage);
  finally
    ic.Free;

  end;
end;

function GetFileIconCount(FileName: string): integer;
begin
  Result := ExtractIcon(0, PChar(FileName), Cardinal(-1));
end;

function GetAllFileIcons(FileName: string): TArray<TPngImage>;
var
  cnt: integer;
  I: Integer;
begin
  // Get Count
  cnt := GetFileIconCount(FileName);

  SetLength(Result, cnt);

  for I := 0 to cnt - 1 do
    begin
      Result[I] := TPngImage.Create;

      try
        GetFileIcon(FileName, Result[I], I);
      except
        // Invalid icon handle
      end;
    end;
end;

procedure CopyObject(ObjFrom, ObjTo: TObject);
  var
PropInfos: PPropList;
PropInfo: PPropInfo;
Count, Loop: Integer;
OrdVal: Longint;
StrVal: String;
FloatVal: Extended;
MethodVal: TMethod;
begin
//{ Iterate thru all published fields and properties of source }
//{ copying them to target }

//{ Find out how many properties we'll be considering }
Count := GetPropList(ObjFrom.ClassInfo, tkAny, nil);
//{ Allocate memory to hold their RTTI data }
GetMem(PropInfos, Count * SizeOf(PPropInfo));
try
//{ Get hold of the property list in our new buffer }
GetPropList(ObjFrom.ClassInfo, tkAny, PropInfos);
//{ Loop through all the selected properties }
for Loop := 0 to Count - 1 do
begin
  PropInfo := GetPropInfo(ObjTo.ClassInfo, String(PropInfos^[Loop]^.Name));
 // { Check the general type of the property }
  //{ and read/write it in an appropriate way }
  case PropInfos^[Loop]^.PropType^.Kind of
    tkInteger, tkChar, tkEnumeration,
    tkSet, tkClass{$ifdef Win32}, tkWChar{$endif}:
    begin
      OrdVal := GetOrdProp(ObjFrom, PropInfos^[Loop]);
      if Assigned(PropInfo) then
        SetOrdProp(ObjTo, PropInfo, OrdVal);
    end;
    tkFloat:
    begin
      FloatVal := GetFloatProp(ObjFrom, PropInfos^[Loop]);
      if Assigned(PropInfo) then
        SetFloatProp(ObjTo, PropInfo, FloatVal);
    end;
    {$ifndef DelphiLessThan3}
    tkWString,
    {$endif}
    {$ifdef Win32}
    tkLString,
    {$endif}
    tkString:
    begin
      { Avoid copying 'Name' - components must have unique names }
      if UpperCase(String(PropInfos^[Loop]^.Name)) = 'NAME' then
        Continue;
      StrVal := GetStrProp(ObjFrom, PropInfos^[Loop]);
      if Assigned(PropInfo) then
        SetStrProp(ObjTo, PropInfo, StrVal);
    end;
    tkMethod:
    begin
      MethodVal := GetMethodProp(ObjFrom, PropInfos^[Loop]);
      if Assigned(PropInfo) then
        SetMethodProp(ObjTo, PropInfo, MethodVal);
    end
  end
end
finally
  FreeMem(PropInfos, Count * SizeOf(PPropInfo));
end;
end;

procedure PrepareCustomTitleBar(var TitleBar: TForm; const Background: TColor; Foreground: TColor);
var
  CB, CF, SCB, SCF: integer;
begin
  if GetColorSat(BackGround) < 100 then
    CB := 30
  else
    CB := -30;

  if GetColorSat(Foreground) < 100 then
    CF := 30
  else
    CF := -30;

  SCF := CF div 2;
  SCB := CF div 2;

  with TitleBar.CustomTitleBar do
    begin
      BackgroundColor := BackGround;
      InactiveBackgroundColor := ChangeColorSat(BackGround, CB);
      ButtonBackgroundColor := BackGround;
      ButtonHoverBackgroundColor := ChangeColorSat(BackGround, SCB);
      ButtonInactiveBackgroundColor := ChangeColorSat(BackGround, CB);
      ButtonPressedBackgroundColor := ChangeColorSat(BackGround, CB);

      ForegroundColor := Foreground;
      ButtonForegroundColor := Foreground;
      ButtonHoverForegroundColor := ChangeColorSat(ForeGround, SCF);
      InactiveForegroundColor := ChangeColorSat(Foreground, CF);
      ButtonInactiveForegroundColor := ChangeColorSat(Foreground, CF);
      ButtonPressedForegroundColor := ChangeColorSat(Foreground, CF);
    end;
end;

procedure ResetPropertyValues(const AObject: TObject);
var
  PropIndex: Integer;
  PropCount: Integer;
  PropList: PPropList;
  PropInfo: PPropInfo;
const
  TypeKinds: TTypeKinds = [tkEnumeration, tkString, tkLString, tkWString,
    tkUString];
begin
  PropCount := GetPropList(AObject.ClassInfo, TypeKinds, nil);
  GetMem(PropList, PropCount * SizeOf(PPropInfo));
  try
    GetPropList(AObject.ClassInfo, TypeKinds, PropList);
    for PropIndex := 0 to PropCount - 1 do
    begin
      PropInfo := PropList^[PropIndex];

      // Set
      if Assigned(PropInfo^.SetProc) then
      case PropInfo^.PropType^.Kind of
        tkString, tkLString, tkUString, tkWString:
          SetStrProp(AObject, PropInfo, '');
        tkEnumeration:
          if GetTypeData(PropInfo^.PropType^)^.BaseType^ = TypeInfo(Boolean) then
            SetOrdProp(AObject, PropInfo, 0);

      end;
    end;
  finally
    FreeMem(PropList);
  end;
end;

procedure SetProperty(const AObject: TObject; PropertyName, NewValue: string); overload;
begin
  if AObject <> nil then
    SetStringProperty( AObject, PropertyName, NewValue);
end;

procedure SetProperty(const AObject: TObject; PropertyName: string; NewValue: integer); overload;
begin
  if AObject <> nil then
    SetIntegerProperty( AObject, PropertyName, NewValue);
end;

procedure SetProperty(const AObject: TObject; PropertyName: string; NewValue: boolean); overload;
begin
  if AObject <> nil then
    SetBooleanProperty( AObject, PropertyName, NewValue);
end;

procedure SetStringProperty(const AObject: TObject; PropertyName, NewValue: string);
var
  PropIndex: Integer;
  PropCount: Integer;
  PropList: PPropList;
  PropInfo: PPropInfo;
  PropRest: string;
  PropDot: Integer;
const
  TypeKinds: TTypeKinds = [tkString, tkLString, tkWString, tkUString, tkClass];
begin
  PropCount := GetPropList(AObject.ClassInfo, TypeKinds, nil);
  GetMem(PropList, PropCount * SizeOf(PPropInfo));
  try
    GetPropList(AObject.ClassInfo, TypeKinds, PropList);
    for PropIndex := 0 to PropCount - 1 do
    begin
      PropInfo := PropList^[PropIndex];

      // Multi Class
      if Pos('.', PropertyName) <> 0 then
        begin
          PropDot := Pos('.', PropertyName);
          PropRest := Copy( PropertyName, PropDot + 1, length(Propertyname) );
          PropertyName := Copy( PropertyName, 0, PropDot - 1 );
        end;

      // Set
      if AnsiLowerCase(string(PropInfo.Name)) = AnsiLowerCase(PropertyName) then
        if Assigned(PropInfo^.SetProc) then
        case PropInfo^.PropType^.Kind of
          tkString, tkLString, tkUString, tkWString:
            SetStrProp(AObject, PropInfo, NewValue);
          tkClass: SetStringProperty( GetObjectProp(AObject, PropInfo), PropRest, NewValue );
        end;
    end;
  finally
    FreeMem(PropList);
  end;
end;

procedure SetIntegerProperty(const AObject: TObject; PropertyName: string; NewValue: integer);
var
  PropIndex: Integer;
  PropCount: Integer;
  PropList: PPropList;
  PropInfo: PPropInfo;
  PropRest: string;
  PropDot: Integer;
const
  TypeKinds: TTypeKinds = [tkInteger, tkEnumeration, tkClass];
begin
  PropCount := GetPropList(AObject.ClassInfo, TypeKinds, nil);
  GetMem(PropList, PropCount * SizeOf(PPropInfo));
  try
    GetPropList(AObject.ClassInfo, TypeKinds, PropList);
    for PropIndex := 0 to PropCount - 1 do
    begin
      PropInfo := PropList^[PropIndex];

      // Multi Class
      if Pos('.', PropertyName) <> 0 then
        begin
          PropDot := Pos('.', PropertyName);
          PropRest := Copy( PropertyName, PropDot + 1, length(Propertyname) );
          PropertyName := Copy( PropertyName, 0, PropDot - 1 );
        end;

      // Set
      if AnsiLowerCase(string(PropInfo.Name)) = AnsiLowerCase(PropertyName) then
        if Assigned(PropInfo^.SetProc) then
        case PropInfo^.PropType^.Kind of
          tkEnumeration, tkInteger:
            SetOrdProp(AObject, PropInfo, NewValue);
          tkClass: SetIntegerProperty( GetObjectProp(AObject, PropInfo), PropRest, NewValue );
        end;
    end;
  finally
    FreeMem(PropList);
  end;
end;

procedure SetBooleanProperty(const AObject: TObject; PropertyName: string; NewValue: boolean);
var
  PropIndex: Integer;
  PropCount: Integer;
  PropList: PPropList;
  PropInfo: PPropInfo;
  PropRest: string;
  PropDot: Integer;
const
  TypeKinds: TTypeKinds = [tkEnumeration, tkClass];
begin
  PropCount := GetPropList(AObject.ClassInfo, TypeKinds, nil);
  GetMem(PropList, PropCount * SizeOf(PPropInfo));
  try
    GetPropList(AObject.ClassInfo, TypeKinds, PropList);
    for PropIndex := 0 to PropCount - 1 do
    begin
      PropInfo := PropList^[PropIndex];

      // Multi Class
      if Pos('.', PropertyName) <> 0 then
        begin
          PropDot := Pos('.', PropertyName);
          PropRest := Copy( PropertyName, PropDot + 1, length(Propertyname) );
          PropertyName := Copy( PropertyName, 0, PropDot - 1 );
        end;

      // Set
      if AnsiLowerCase(string(PropInfo.Name)) = AnsiLowerCase(PropertyName) then
        if Assigned(PropInfo^.SetProc) then
        case PropInfo^.PropType^.Kind of
          tkEnumeration, tkInteger:
            SetOrdProp(AObject, PropInfo, integer(NewValue));
          tkClass: SetBooleanProperty( GetObjectProp(AObject, PropInfo), PropRest, NewValue );
        end;
    end;
  finally
    FreeMem(PropList);
  end;
end;

function IsInIDE: boolean;
begin
  if TStyleManager.ActiveStyle.Name = 'Mountain_Mist' then
    Result := true
  else
    Result := false;
end;

procedure UnregisterFileType(FileExt: String;
  OnlyForCurrentUser: boolean);
var
  R: TRegistry;
begin
  R := TRegistry.Create;
  try
    if OnlyForCurrentUser then
      R.RootKey := HKEY_CURRENT_USER
    else
      R.RootKey := HKEY_LOCAL_MACHINE;

    R.DeleteKey('\Software\Classes\.' + FileExt);
    R.DeleteKey('\Software\Classes\' + FileExt + 'File');
  finally
    R.Free;
  end;
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
end;

{File}
function GetAllFileProperties(filename: string; allowempty: boolean = true): TStringList;
var
  Shell : Variant;
  OleFolder : OleVariant;
  OleFolderItem: OleVariant;
  VsFilePath : Variant;
  VsFileName : Variant;
  PropName,
  PropValue: string;
  I: integer;

  Directory: string;
begin
  Result := TStringList.Create;

  Directory := Copy(FileName, 0, FileName.LastIndexOf('\'));

  if NOT TDirectory.Exists(directory) or NOT TFile.Exists(filename) then
    Exit;

  Shell := CreateOleObject('Shell.Application');
  VsFilePath := Directory;
  OleFolder := Shell.Namespace(VsFilePath);
  VsFileName := ExtractFileName(FileName);
  OleFolderItem := OleFolder.ParseName(VsFileName);


  I := 0;
  PropName := 'File Name';

  while (PropName <> '') or (I = 0) do
  begin
    PropValue := OleFolder.GetDetailsOf(OleFolderItem, I);
    if (NOT (PropValue = '')) or Allowempty then
      Result.Add(Format('%s = %s', [PropName, PropValue]));

    //if uppercase('Contributing artists') = uppercase(PropName) then

    I := I + 1;
    PropName := OleFolder.GetDetailsOf(null, I);
  end;
end;

function GetFileProperty(FileName, PropertyName: string): string;
var
  R: TStringList;
  s1, s2: string;
  I: Integer;
begin
  Result := NOT_FOUND;

  R := GetAllFileProperties(FileName);

  for I := 0 to R.Count - 1 do
  begin
    s1 := Copy(R[I], 0, Pos(' =', R[I]) - 1);
    s2 := Copy(R[I], length(s1) + 4, Length(R[I]) );

    if AnsiLowerCase(s1) = AnsiLowerCase(PropertyName) then
    begin
      Result := s2;
      Break;
    end;
  end;

  R.Free;
end;

function GetAllFileVersionInfo(FileName: string): TFileVersionInfo;
{ proc to get all version info from a file. }
var
  Buf       : PChar;
  fInfoSize : DWord;
  procedure InitVersion;
  var
    FileNamePtr  : PChar;
  begin
    with Result do
      begin
        FileNamePtr := PChar(FileName);
        fInfoSize := GetFileVersionInfoSize(FileNamePtr, fInfoSize);
        if fInfoSize > 0 then
          begin
            ReAllocMem(Buf, fInfoSize);
            GetFileVersionInfo(FileNamePtr, 0, fInfoSize, Buf);
          end;
      end;
  end;
  function GetVersion(What : String): string;
  var
    tmpVersion: string;
    Len       : Dword;
    Value     : PChar;
  begin
    Result := NOT_DEFINED;
    if fInfoSize > 0 then
      begin
        SetLength(tmpVersion, 200);
        Value := @tmpVersion;
        { If you are not using an English OS, then replace the language &  }
        { code-page identifier with the correct one.  English (U.S.) is    }
        { 0409 (language) & 04E4 (code-page).  See Code-Page Identifiers & }
        { Language Identifiers in the Win32 help file for info.            }
        if VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + What),
                         Pointer(Value), Len) then
          Result := Value;
      end;
  end;
begin
  Buf := nil;
  with Result do
    begin
      InitVersion;
      fCompanyName      := GetVersion('CompanyName');
      fFileDescription  := GetVersion('FileDescription');
      fFileVersion      := GetVersion('FileVersion');
      fInternalName     := GetVersion('InternalName');
      fLegalCopyRight   := GetVersion('LegalCopyRight');
      fLegalTradeMark   := GetVersion('LegalTradeMark');
      fOriginalFileName := GetVersion('OriginalFileName');
      fProductName      := GetVersion('ProductName');
      fProductVersion   := GetVersion('ProductVersion');
      fComments         := GetVersion('Comments');
    end;
  if Buf <> nil then
    FreeMem(Buf);
end;

function GetFileOwner(const AFileName : string) : string;
var
  LSWbemLocator, LWMIService, LObjects, LObject : OLEVariant;
  FileName       : string;
  LEnumerator    : IEnumvariant;
  iValue         : LongWord;
begin;
  Result := '';
  LSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  LWMIService   := LSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');

  //Escape the `\` chars in the FileName value because the '\' is a reserved character in WMI.
  FileName        := StringReplace(AFileName, '\', '\\', [rfReplaceAll]);
  LObjects   := LWMIService.ExecQuery(Format('ASSOCIATORS OF {Win32_LogicalFileSecuritySetting="%s"} WHERE Assoc= Win32_LogicalFileOwner ResultRole = Owner', [FileName]));

  LEnumerator  := IUnknown(LObjects._NewEnum) as IEnumVariant;
  if LEnumerator.Next(1, LObject, iValue) = 0 then
     Result := string(LObject.AccountName);   //
end;

{ TStrInterval }

function TStrInterval.Length: integer;
begin
  Result := AEnd - AStart;
end;

end.
