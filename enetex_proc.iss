;NeedSize=NN Мб
; NeedInstallSize=NN Мб
#define NeedSize 29
#define NeedInstallSize 21 

[Setup]
AppName=enetex
AppVersion=1.0
DefaultDirName=c:\enetex
DefaultGroupName=enetex
UninstallDisplayIcon={app}\48.ico
OutputDir=d:\enetex.inst\output
AppCopyright=(c) ISA, 2012-2013
PrivilegesRequired=none
RestartIfNeededByRun=False
SetupIconFile=d:\enetex.inst\install\pic\64.ico
OutputBaseFilename=enetexin

[Types]
Name: "host"; Description: "инсталляция HOST"
Name: "webui"; Description: "инсталляция WEBUI"
Name: "c"; Description: "выборочная инсталляция HOST/WEBUI"; Flags: iscustom

[Components]
Name: "ihost"; Description: "host файлы"; Types: host
Name: "iwebui"; Description: "webui файлы"; Types: webui
;Name: "simul"; Description: "симулятор"; Types: host webui c
Name: "doc"; Description: "документация"; Types: host webui c
Name: "base"; Description: "базы данных"; Types: host webui c; Flags: fixed
Name: "base\my"; Description: "mysql"; Flags: exclusive
Name: "base\ms"; Description: "M$ sql"; Flags: exclusive

[Files]
Source: "D:\enetex.inst\install\doc\Руководство администратора.pdf"; DestDir: "{app}\doc"; Components: doc
Source: "D:\enetex.inst\install\doc\Руководство пользователя.pdf"; DestDir: "{app}\doc"; Components: doc
;Source: "D:\enetex.inst\install\host\CacheDB.jar"; DestDir: "{app}\host"; Components: ihost
Source: "D:\enetex.inst\install\host\RXTXcomm.jar"; DestDir: "{app}\host"; Components: ihost
Source: "D:\enetex.inst\install\host\eNetex.jar"; DestDir: "{app}\host"; Components: ihost
Source: "D:\enetex.inst\install\host\mysql.jar"; DestDir: "{app}\host"; Components: ihost
Source: "D:\enetex.inst\install\host\sqljdbc.jar"; DestDir: "{app}\host"; Components: ihost
Source: "D:\enetex.inst\install\host\startup.bat"; DestDir: "{app}\host"; Components: ihost
Source: "D:\enetex.inst\install\sim\RXTXcomm.jar"; DestDir: "{app}\sim"; Components: ihost 
Source: "D:\enetex.inst\install\sim\Dnp3.poll"; DestDir: "{app}\sim"; Components:ihost  
Source: "D:\enetex.inst\install\sim\Dnp3.resp"; DestDir: "{app}\sim"; Components: ihost 
Source: "D:\enetex.inst\install\sim\eNetexSim.jar"; DestDir: "{app}\sim"; Components: ihost 
Source: "D:\enetex.inst\install\sim\RunFEP.bat"; DestDir: "{app}\sim"; Components: ihost 
Source: "D:\enetex.inst\install\sim\RunRtu.bat"; DestDir: "{app}\sim"; Components: ihost 
Source: "D:\enetex.inst\install\sim\ses92.poll"; DestDir: "{app}\sim"; Components: ihost 
Source: "D:\enetex.inst\install\sim\ses92.resp"; DestDir: "{app}\sim"; Components: ihost 
Source: "D:\enetex.inst\install\web\eNetexWeb.war"; DestDir: "{app}\web"; Components: iwebui
Source: "D:\enetex.inst\install\tmp\SetHost.bat"; DestDir: "{app}\tmp"; Flags: deleteafterinstall; Components: base
;Source: "D:\enetex.inst\install\tmp\updatewar.bat"; DestDir: "{app}\tmp"; Flags: deleteafterinstall; Components: base
;Source: "D:\enetex.inst\install\tmp\zip.exe"; DestDir: "{app}\tmp"; Flags: deleteafterinstall; Components: base
;Source: "D:\enetex.inst\install\tmp\1ca.sql"; DestDir: "{app}\tmp"; Flags: deleteafterinstall; Components: base
Source: "D:\enetex.inst\install\tmp\1ms.sql"; DestDir: "{app}\tmp"; Flags: deleteafterinstall; Components: base
Source: "D:\enetex.inst\install\tmp\1my.sql"; DestDir: "{app}\tmp"; Flags: deleteafterinstall; Components: base
Source: "D:\enetex.inst\install\tmp\2.sql"; DestDir: "{app}\tmp"; Flags: deleteafterinstall; Components: base
Source: "D:\enetex.inst\install\tmp\3.sql"; DestDir: "{app}\tmp"; Flags: deleteafterinstall; Components: base
Source: "D:\enetex.inst\install\pic\48.ico"; DestDir: "{app}\pic"

[Icons]
Name: "{group}\uninstall"; Filename: "{app}\unins000.exe"
Name: "{group}\Документация\Руководство пользователя"; Filename: "{app}\doc\Руководство пользователя.pdf"; Components: doc
Name: "{group}\Документация\Руководство администратора"; Filename: "{app}\doc\Руководство администратора.pdf"; Components: doc
Name: "{group}\host startup"; Filename: "{app}\host\startup.bat"; IconFilename: "{app}\pic\48.ico"; Components: ihost
;Name: "{group}\симулятор FEP"; Filename: "{app}\sim\RunFEP.bat"; IconFilename: "{app}\pic\48.ico"; Components: ihost 
;Name: "{group}\симулятор RTU"; Filename: "{app}\sim\RunRtu.bat"; IconFilename: "{app}\pic\48.ico"; Components: ihost 
Name: "{userdesktop}\host startup"; Filename: "{app}\host\startup.bat"; WorkingDir: "{app}\host"; IconFilename: "{app}\pic\48.ico"; Components: ihost
;Name: "{userdesktop}\симулятор FEP"; Filename: "{app}\sim\RunFEP.bat"; WorkingDir: "{app}"; IconFilename: "{app}\pic\48.ico"; Components: ihost 
;Name: "{userdesktop}\симулятор RTU"; Filename: "{app}\sim\RunRtu.bat"; WorkingDir: "{app}"; IconFilename: "{app}\pic\48.ico"; Components: ihost 

[Run]
Filename: "{app}\tmp\SetHost.bat"; Parameters: "mysql {code:GetUser|UserName} {code:GetUser|Password} {code:GetUser|IP} {code:GetUser|Port} {code:GetUser|DBNAME} {code:GetUser|Sem}"; WorkingDir: "{app}\tmp"; Components: base\my
Filename: "{app}\tmp\SetHost.bat"; Parameters: "sqlserver {code:GetUser|UserName} {code:GetUser|Password} {code:GetUser|IP} {code:GetUser|Port} {code:GetUser|DBNAME} {code:GetUser|Sem}"; WorkingDir: "{app}\tmp"; Components: base\ms

[Languages]
Name: "Russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Messages]
Russian.DiskSpaceMBLabel=enetex на защите ваших данных
Russian.ComponentsDiskSpaceMBLabel=enetex это хорошо

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[Code]
const 
   MAX_PATH = 260;
   MAX_MODULE_NAME32 = 258;
   LEN_EXEFILE = 260;
    TH32CS_SNAPPROCESS = $00000002;
    TH32CS_SNAPMODULE = $00000008; 

type
	SERVICE_STATUS = record
    	dwServiceType				: cardinal;
    	dwCurrentState				: cardinal;
    	dwControlsAccepted			: cardinal;
    	dwWin32ExitCode				: cardinal;
    	dwServiceSpecificExitCode	: cardinal;
    	dwCheckPoint				: cardinal;
    	dwWaitHint					: cardinal;
	end;
   SERVICE_CONFIG = record
        dwServiceType      : cardinal;
        dwStartType        : cardinal;
        dwErrorControl     : cardinal;
        lpBinaryPathName   : PChar;
        lpLoadOrderGroup   : cardinal;
        dwTagId            : cardinal;
        lpDependencies     : cardinal;
        lpServiceStartName : cardinal;
        lpDisplayName      : cardinal;
      end;
	HANDLE = cardinal;// состояние процесса  
const
	SERVICE_QUERY_CONFIG		= $1;
	SERVICE_CHANGE_CONFIG		= $2;
	SERVICE_QUERY_STATUS		= $4;
	SERVICE_START				= $10;
	SERVICE_STOP				= $20;
	SERVICE_ALL_ACCESS			= $f01ff;
	SC_MANAGER_ALL_ACCESS		= $f003f;
	SERVICE_WIN32_OWN_PROCESS	= $10;
	SERVICE_WIN32_SHARE_PROCESS	= $20;
	SERVICE_WIN32				= $30;
	SERVICE_INTERACTIVE_PROCESS = $100;
	SERVICE_BOOT_START          = $0;
	SERVICE_SYSTEM_START        = $1;
	SERVICE_AUTO_START          = $2;
	SERVICE_DEMAND_START        = $3;
	SERVICE_DISABLED            = $4;
	SERVICE_DELETE              = $10000;
	SERVICE_CONTROL_STOP		= $1;
	SERVICE_CONTROL_PAUSE		= $2;
	SERVICE_CONTROL_CONTINUE	= $3;
	SERVICE_CONTROL_INTERROGATE = $4;
	SERVICE_STOPPED				= $1;
	SERVICE_START_PENDING       = $2;
	SERVICE_STOP_PENDING        = $3;
	SERVICE_RUNNING             = $4;
	SERVICE_CONTINUE_PENDING    = $5;
	SERVICE_PAUSE_PENDING       = $6;
	SERVICE_PAUSED              = $7;
  // статус службы
function OpenSCManager(lpMachineName, lpDatabaseName: string; dwDesiredAccess :cardinal): HANDLE;
external 'OpenSCManagerA@advapi32.dll stdcall';
function OpenService(hSCManager :HANDLE;lpServiceName: string; dwDesiredAccess :cardinal): HANDLE;
external 'OpenServiceA@advapi32.dll stdcall';
function CloseServiceHandle(hSCObject :HANDLE): boolean;
external 'CloseServiceHandle@advapi32.dll stdcall';
function QueryServiceStatus(hService :HANDLE;var ServiceStatus :SERVICE_STATUS) : boolean;
external 'QueryServiceStatus@advapi32.dll stdcall';
//function QueryServiceConfig(hService: HANDLE; var ServiceConfig: SERVICE_CONFIG; cbBufsize: Integer; pcbBytesNeeded: cardinal) : boolean;
//external 'QueryServiceConfigA@advapi32.dll stdcall';


var
  UserPage: TInputQueryWizardPage;
  UsagePage: TInputOptionWizardPage;
  LightMsgPage: TOutputMsgWizardPage;
  KeyPage: TInputQueryWizardPage;
  ProgressPage: TOutputProgressWizardPage;
  DataDirPage: TInputDirWizardPage;
  IDEPage, ISPPPage: TWizardPage;
 ISPPCheckBox: TCheckBox;
 TE:TEdit ;
    //CheckBox: TNewCheckBox;
    
  TotalSpaceLabel, FreeSpaceLabel, NeedSpacelabel, InstallSpaceLabel: TLabel;
  FreeMB, TotalMB: Cardinal;
  
  AskExit: boolean; // запрос на выход или выход без запроса
 
function NumToStr(Float: Extended): String;
begin
  Result:= format('%.2n', [Float]); StringChange(Result, ',', '.');
  while (Result[Length(Result)] = '0')or((Result[Length(Result)] = '.')and(Pos('.', Result) > 0)) do
    SetLength(Result, Length(Result)-1);
end;
 
function MbOrTb(Float: Extended): String;
begin
  if Float < 1024 then Result:= NumToStr(Float)+' Мб' else
    if Float/1024 < 1024 then Result:= NumToStr(Float/1024)+' Гб' else
      Result:= NumToStr(Float/(1024*1024))+' Тб';
end;
 
procedure DirEditOnChange(Sender: TObject);
var Drive: String;
begin
  Drive:= ExtractFileDrive(WizardForm.DirEdit.Text);
  GetSpaceOnDisk(Drive, True, FreeMB, TotalMB);
  TotalSpaceLabel.Caption:= 'Всего места на диске: '+MbOrTb(TotalMB);
  FreeSpaceLabel.Caption:= 'Доступно места на диске: '+MbOrTb(FreeMB)+' ('+IntToStr(round(FreeMB*100/TotalMB))+'%)';
  InstallSpacelabel.Caption:= 'Требуется места для установки: '+MbOrTb({#NeedInstallSize});
  NeedSpaceLabel.Caption:= 'Требуется места на диске: '+MbOrTb({#NeedSize});
  WizardForm.NextButton.Enabled:= (FreeMB>{#NeedInstallSize})and(FreeMB>{#NeedSize})  ;
end;
 
procedure CurPageChanged(CurPageID: Integer);
var
  ErrorCode: Integer;
begin
  if CurPageID=wpSelectDir then begin
    DirEditOnChange(nil)
  end;
  if CurPageID=DataDirPage.ID then begin
       if DataDirPage.Values[0] = '' then begin
         if (ISPPCheckBox.Checked = True) then 
            WizardForm.NextButton.Enabled:= False
         else  WizardForm.NextButton.Enabled:= True;
          //DataDirPage.Values[0] := 'C:\' + UserPage.Values[0];
       end;
  end;
end;

function OpenServiceManager() : HANDLE;
begin
	if UsingWinNT() = true then begin
		Result := OpenSCManager('','ServicesActive',SC_MANAGER_ALL_ACCESS);
		if Result = 0 then
			MsgBox('servicemanager не доступен', mbError, MB_OK)
	end
	else begin
			MsgBox('Только системы nt-ядра поддерживают сервисы', mbError, MB_OK)
			Result := 0;
	end
end;

function IsServiceInstalled(ServiceName: string) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := OpenService(hSCM,ServiceName,SERVICE_QUERY_CONFIG);
        if hService <> 0 then begin
            Result := true;
            CloseServiceHandle(hService)
		end;
        CloseServiceHandle(hSCM)
	end
end;
function IsServiceRunning(ServiceName: string) : boolean;
var
	hSCM	: HANDLE;
	hService: HANDLE;
	Status	: SERVICE_STATUS;
begin
	hSCM := OpenServiceManager();
	Result := false;
	if hSCM <> 0 then begin
		hService := OpenService(hSCM,ServiceName,SERVICE_QUERY_STATUS);
    	if hService <> 0 then begin
			if QueryServiceStatus(hService,Status) then begin
				Result :=(Status.dwCurrentState = SERVICE_RUNNING)
        	end;
            CloseServiceHandle(hService)
		    end;
        CloseServiceHandle(hSCM)
	end
end;

function ProgRunning(): boolean;
begin
 {if IsServiceRunning('tomcat5') then} // проверка запущена ли служба
 if IsServiceInstalled('tomcat5') then // проверка установлена ли служба
		Result := True
 else
    Result:=False;
end;

{
function GetServiceConfig(AServiceName: String): String;
var
  BufferSize: DWORD;
  BytesNeeded: DWORD;
  ServiceHandle: HANDLE;
  ServiceManager: HANDLE;
  ServiceConfig: SERVICE_CONFIG;
begin
  Result := '';
  ServiceManager := OpenServiceManager();
  if ServiceManager <> 0 then
  try
    ServiceHandle := OpenService(ServiceManager, PChar(AServiceName),
      SERVICE_QUERY_CONFIG);
    if ServiceHandle <> 0 then
    try
      if not QueryServiceConfig(ServiceHandle, ServiceConfig, 0, BufferSize) then
      begin
        //ServiceConfig := AllocMem(BufferSize);
        try
          if QueryServiceConfig(ServiceHandle, ServiceConfig, BufferSize,
            BytesNeeded)
          then
            Result := String(ServiceConfig.lpBinaryPathName);
        finally
          //FreeMem(ServiceConfig);
        end;
      end;
    finally
      CloseServiceHandle(ServiceHandle);
    end;
  finally
    CloseServiceHandle(ServiceManager);
  end;
end; 
}

Procedure ObjectOnClick(Sender: TObject); 
Begin
 Case TObject(Sender) of
	ISPPCheckBox:	
       if DataDirPage.Values[0] = '' then begin
         if (ISPPCheckBox.Checked = True) then 
            WizardForm.NextButton.Enabled:= False
         else  WizardForm.NextButton.Enabled:= True;
          //DataDirPage.Values[0] := 'C:\' + UserPage.Values[0];
        end;
  TE:
     if DataDirPage.Values[0] <> '' then begin
         if (ISPPCheckBox.Checked = True) then 
            WizardForm.NextButton.Enabled:= True;
          //DataDirPage.Values[0] := 'C:\' + UserPage.Values[0];
     end
     else if (ISPPCheckBox.Checked = True) then WizardForm.NextButton.Enabled:= False;
 end;
End;


function KeyValue(): string;
var
  InsPath: String;
  x1: Byte;
begin
  InsPath:='';
  RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\services\Tomcat5', 'ImagePath', InsPath);
  RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\services\Tomcat6', 'ImagePath', InsPath);
  //InsPath= GetServiceConfig('tomcat5');
  x1 := pos('\bin', InsPath); 
  delete(InsPath, x1, length(InsPath));
  x1 := pos('"', InsPath); 
  delete(InsPath, x1, 1);
   //MsgBox(InsPath, mbError, MB_OK);
 Result:=InsPath;
end;

procedure InitializeWizard;

begin
  AskExit:=False;
     UserPage := CreateInputQueryPage(wpSelectTasks,
    'Параметры базы данных', 'Введите для создания',
    'IP адрес размещения БД, имя базы данных, порт доступа, имя пользователя и пароль'); {}
    UserPage.Add('IP:', False);
    UserPage.Add('DBNAME:', False);
    UserPage.Add('Port:', False);
    UserPage.Add('UserName:', False);
    UserPage.Add('Password:', False);
    UserPage.Edits[3].Width:= 200;
    UserPage.Edits[4].Top:= 209;   
    UserPage.Edits[4].Left:= 220;    
    UserPage.Edits[4].Width:= 200;
    UserPage.PromptLabels[3].Width:= 200;
    UserPage.PromptLabels[4].Top:=193;
    UserPage.PromptLabels[4].Left:= 220;
    
    UserPage.Values[0] := GetPreviousData('IP', '127.0.0.1');
    UserPage.Values[1] := GetPreviousData('DBNAME', 'AISbase');
    UserPage.Values[2] := GetPreviousData('Port', '0');
    UserPage.Values[3] := GetPreviousData('UserName', 'root');
    UserPage.Values[4] := GetPreviousData('Password', '111');
 
  TotalSpaceLabel:= TLabel.Create(WizardForm);
  TotalSpaceLabel.AutoSize:= False;
  TotalSpaceLabel.SetBounds(0, 120, 300, 20);
  TotalSpaceLabel.Parent:= WizardForm.SelectDirpage;
 
  FreeSpaceLabel:= TLabel.Create(WizardForm);
  FreeSpaceLabel.AutoSize:= False;
  FreeSpaceLabel.SetBounds(0, 140, 300, 20);
  FreeSpaceLabel.Parent:= WizardForm.SelectDirpage;
 
  InstallSpacelabel:= TLabel.Create(WizardForm);
  InstallSpacelabel.AutoSize:= False;
  InstallSpacelabel.SetBounds(0, 160, 300, 20);
  InstallSpacelabel.Parent:= WizardForm.SelectDirpage;
   
  NeedSpaceLabel:= TLabel.Create(WizardForm);
  NeedSpaceLabel.AutoSize:= False;
  NeedSpaceLabel.SetBounds(0, 180, 300, 20);
  NeedSpaceLabel.Parent:= WizardForm.SelectDirpage;
  { }
  WizardForm.DirEdit.OnChange:=@DirEditOnChange;
  
 // TComboBoxAsk:=TComboBox.Create(WizardForm);
  
  
  
   DataDirPage := CreateInputDirPage(wpSelectComponents,
    'Установка WebUI', 'Укажите путь к сервису tomcat',
    'Настройка сервлета',
    False, '');
    DataDirPage.Add('');
    DataDirPage.Values[0] := GetPreviousData('DataDir', '');
    TE:=DataDirPage.Edits[0];
    TE.OnChange:=@ObjectOnClick;
    
  ISPPCheckBox := TCheckBox.Create(DataDirPage);
  ISPPCheckBox.Top :=  ScaleY(80);
  ISPPCheckBox.Width := ScaleY(200);
  ISPPCheckBox.Height := ScaleY(170);
  ISPPCheckBox.Caption := 'Установить сервлет enetex';
  ISPPCheckBox.Checked := True;
  ISPPCheckBox.Parent := DataDirPage.Surface;
  ISPPCheckBox.OnClick:= @ObjectOnClick;
end;

procedure RegisterPreviousData(PreviousDataKey: Integer);
var
  UsageMode: String;
begin
  { Store the settings so we can restore them next time }
  SetPreviousData(PreviousDataKey, 'IP', UserPage.Values[0]);
  SetPreviousData(PreviousDataKey, 'DBNAME', UserPage.Values[1]);
  SetPreviousData(PreviousDataKey, 'Port', UserPage.Values[2]);
  SetPreviousData(PreviousDataKey, 'UserName', UserPage.Values[3]);
  SetPreviousData(PreviousDataKey, 'Password', UserPage.Values[4]);
  
  SetPreviousData(PreviousDataKey, 'DataDir', DataDirPage.Values[0]);
  
  SetPreviousData(PreviousDataKey, 'ISPP', IntToStr(Ord(ISPPCheckBox.Checked)));
  
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
       if (PageID=DataDirPage.ID) then begin
         if (Not IsComponentSelected('iwebui')) then Result := True
         else Result := False;
       end
    //Result := False;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  I: Integer;
  sPath: String;
begin
  { Validate certain pages before allowing the user to proceed }
  if CurPageID = UserPage.ID then begin
    if UserPage.Values[0] = '' then begin
      MsgBox('Вы должны ввести адрес', mbError, MB_OK);
      Result := False;
    end  
  end;
  if  CurPageID = wpSelectComponents then begin
    if IsComponentSelected('iwebui') then begin
      if not ProgRunning() then begin
            MsgBox('Tomcat не запущен. Укажите путь к нему самостоятельно.', mbError, MB_OK);
            //AskExit:=True;
            //WizardForm.CancelButton.OnClick(WizardForm.CancelButton);
      end
      else DataDirPage.Values[0]:= KeyValue();
    end;   
  end;
 Result := True;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo,
  MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  { Fill the 'Ready Memo' with the normal settings and the custom settings }
  S := '';
  S := S + 'Параметры базы данных:' + NewLine;
  S := S + Space + UserPage.Values[0] + NewLine + Space + UserPage.Values[1] + 
  NewLine + Space + UserPage.Values[2] + NewLine + Space + UserPage.Values[3] + 
  NewLine + Space + UserPage.Values[4] + NewLine;
  S := S + NewLine;
  
  S := S + NewLine + Space;
 S := S + NewLine + NewLine;
  
  S := S + MemoDirInfo + NewLine;
  Result := S;
end;

function GetUser(Param: String): String;
 
var
  sDat: String;
begin
  { Return a user value }
  { Could also be split into separate GetUserName and GetUserCompany functions }
 sDat:='';  
 if Param = 'IP' then
    Result := UserPage.Values[0];
  if Param = 'DBNAME' then
    Result := UserPage.Values[1];
  if Param = 'Port' then
    Result := UserPage.Values[2];
  if Param = 'UserName' then
    Result := UserPage.Values[3];
  if Param = 'Password' then
    Result := UserPage.Values[4];

 if Param = 'Sem' then begin
    if IsComponentSelected('iwebui') then begin
          if ISPPCheckBox.Checked=True then
                        sDat := '"' + DataDirPage.Values[0] + '"';
      Result:=sDat;
    end;    
  end;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
if (CurPageID=wpSelectComponents) and (AskExit) then Confirm:=False
else Confirm:=True;
end; 
