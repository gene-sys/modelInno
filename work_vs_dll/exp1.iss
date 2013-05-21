[Setup]
AppName=exp1
AppVersion=1
DefaultDirName=d:\exp
OutputBaseFilename=expins
[Files]
;Source: "D:\enetex\proser.dll";Flags: dontcopy
Source: libexpdll.dll; Flags: dontcopy

[Code]
function Doubles(s: Integer):Integer; external 'Doubles@files:libexpdll.dll stdcall'; // описание
//function hellod(s: string):Integer; external 'hellod@files:proser.dll stdcall'; // описание
//procedure hello(s: String); external 'hello@files:proser.dll stdcall'; // описание
//...
procedure RunTest(s: PAnsiChar); external 'run_test@files:libexpdll.dll stdcall'; //

function InitializeSetup(): Boolean;
var
  d: Integer;
  s: string;
begin
//  FileCopy(ExpandConstant('{app}\libproser.dll'), ExpandConstant('{tmp}\libproser.dll'), False);
  //hello('ask');
  //d:=hellod('ask');
  d:=Doubles(333);
  s:=IntToStr(d);
  MsgBox(s,mbError, MB_OK);
  RunTest('Вах!');
  //WizardForm.Close;
  Result:=True;
end; 

