unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, strutils;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    mGuids: TMemo;
    Edit1: TEdit;
    mFind: TEdit;
    Button3: TButton;
    Edit2: TEdit;
    Button4: TButton;
    Edit3: TEdit;
    Button5: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Button6: TButton;
    Button7: TButton;
    Edit6: TEdit;
    Edit7: TEdit;
    Button8: TButton;
    Edit8: TEdit;
    Edit9: TEdit;
    Button9: TButton;
    Edit10: TEdit;
    Edit11: TEdit;
    Button10: TButton;
    Edit12: TEdit;
    Edit13: TEdit;
    Button11: TButton;
    Edit14: TEdit;
    Edit15: TEdit;
    Button12: TButton;
    Edit16: TEdit;
    Memo2: TMemo;
    Edit17: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Button13: TButton;
    Edit18: TEdit;
    Edit19: TEdit;
    Label35: TLabel;
    Edit20: TEdit;
    Label36: TLabel;
    Button14: TButton;
    Label37: TLabel;
    Edit21: TEdit;
    Label38: TLabel;
    Button15: TButton;
    Label39: TLabel;
    Edit22: TEdit;
    Label40: TLabel;
    Edit23: TEdit;
    Edit24: TEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure PilotSearch(var result: PWideChar; { XML результат }
  pilotUri: PWideChar; { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  condition: PWideChar { Строка поиска }
  ); stdcall; external 'ExportExternalNative' name 'Search';

procedure PilotExport(var result: PWideChar; { XML результат }
  pilotUri: PWideChar; { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  Guids: Array of TGuid; { Массив GUID, которые будут выгружены }
  idsCount: Integer; { Длина массива GUID }
  reserv: Integer); stdcall; external 'ExportExternalNative' name 'Export';

function PilotCreateDocument(pilotUri: PWideChar;
  { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidObjectString: PWideChar; { GUID, по которому будет доступен новый документ, требуется создать самому }
  guidParentString: PWideChar; { GUID родителя этого документа, валидная папка проекта или папка документа }
  typeName: PWideChar { наименование типа объекта }
  ): Integer; stdcall; external 'ExportExternalNative' name 'CreateDocument';

function PilotDeleteDocument(pilotUri: PWideChar;
  { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidObjectString: PWideChar { GUID документа, который будет удален }
  ): Integer; stdcall; external 'ExportExternalNative' name 'DeleteDocument';

function PilotFreezeDocument(pilotUri: PWideChar;
  { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidObjectString: PWideChar { GUID документа, который будет заморожен }
  ): Integer; stdcall; external 'ExportExternalNative' name 'FreezeDocument';

function PilotUnFreezeDocument(pilotUri: PWideChar;
  { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidObjectString: PWideChar { GUID документа, который будет заморожен }
  ): Integer; stdcall; external 'ExportExternalNative' name 'UnFreezeDocument';

function PilotAttachSourceFile(pilotUri: PWideChar;
  { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidObjectString: PWideChar; { GUID документа, который будет заморожен }
  filePath: PWideChar { Путь (на сервере) к файлу, который будет загружен как Исходный }
  ): Integer; stdcall; external 'ExportExternalNative' name 'AttachSourceFile';

function PilotDeleteSourceFile(pilotUri: PWideChar;
  { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidObjectString: PWideChar { GUID исходного файла, который будет удален }
  ): Integer; stdcall; external 'ExportExternalNative' name 'DeleteSourceFile';

function PilotDeleteLink(pilotUri: PWideChar; { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidFirstObjectString: PWideChar; { первый GUID документа, у которого будет удалена связь }
  guidSecondObjectString: PWideChar { второй GUID документа, у которого будет удалена связь }
  ): Integer; stdcall; external 'ExportExternalNative' name 'DeleteLink';

function PilotCreateLink(pilotUri: PWideChar; { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidFirstObjectString: PWideChar; { первый GUID документа, у которого будет создана связь }
  guidSecondObjectString: PWideChar { второй GUID документа, у которого будет создана связь }
  ): Integer; stdcall; external 'ExportExternalNative' name 'CreateLink';

function PilotAttachXPS(pilotUri: PWideChar; { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidObjectString: PWideChar; { GUID документа, который будет заморожен }
  filePath: PWideChar { Путь (на сервере) к файлу, который будет загружен как XPS }
  ): Integer; stdcall; external 'ExportExternalNative' name 'AttachXPS';

function PilotSignDocument(pilotUri: PWideChar; { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidObjectString: PWideChar; { GUID документа, который будет заморожен }
  role: PWideChar { Указание роли, под которой был подписан документ }
  ): Integer; stdcall; external 'ExportExternalNative' name 'SignDocument';

function PilotCreateTaskToReadDocument(pilotUri: PWideChar;
  { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidDocumentString: PWideChar; { GUID документа, который будет заморожен }
  positionId: Integer; { Идентификатор пользователя, которому будет адресовано задание }
  taskHeader: PWideChar; { Заголовок задания на ознакомление }
  taskText: PWideChar { Текст задания на ознакомление }
  ): Integer; stdcall; external 'ExportExternalNative' name 'CreateTaskToReadDocument';

function PilotSetAttribute(pilotUri: PWideChar; { адрес сервера вида net.tcp://localhost:8005/exportExternal }
  guidObjectString: PWideChar; { GUID документа, который будет заморожен }
  attributeName: PWideChar; { наименование аттрибута }
  attributeValue: PWideChar { значение аттрибута }
  ): Integer; stdcall; external 'ExportExternalNative' name 'SetAttribute';

{ Возвращаемый код ошибки:
  0 – без ошибок,
  1 – нет связи с сервером,
  2 – объект не найден (при переданном GUID),
  3 – неверный формат параметров
  (при неверном имени атрибута, формате его значения,
  передан непубликуемый тип файла,
  переданный GUID в формате строки не может быть распознан как GUID)
  4- файл не найден (функции, которым передается путь),
  9 – неизвестная ошибка. }
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button10Click(Sender: TObject);
var
  PURI, Guid, Path: PWideChar;
  res: Integer;
begin
  //
  PURI := PWideChar(Edit1.Text);
  Guid := PWideChar(Edit12.Text);
  Path := PWideChar(Edit13.Text);
  res := 0;
  res := PilotAttachXPS(PURI, Guid, Path);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  PURI, Guid, role: PWideChar;
  res: Integer;
begin
  //
  PURI := PWideChar(Edit1.Text);
  Guid := PWideChar(Edit14.Text);
  role := PWideChar(Edit15.Text);
  res := 0;
  res := PilotSignDocument(PURI, Guid, role);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  PURI, Guid, taskHeader, taskText: PWideChar;
  id, i, res: Integer;
  Ids: Array of Integer;

begin

  PURI := PWideChar(Edit1.Text);
  Guid := PWideChar(Edit16.Text);
  taskHeader := PWideChar(Edit17.Text);
  taskText := PWideChar(Memo2.Text);
  id := strtoint(Edit23.Text);

  res := 0;
  res := PilotCreateTaskToReadDocument(PURI, Guid, id, taskHeader, taskText);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

procedure TForm1.Button13Click(Sender: TObject);
var
  PURI, Guid, AttrName, AttrValue: PWideChar;
  res: Integer;
  Val: Variant;
begin
  //
  PURI := PWideChar(Edit1.Text);
  Guid := PWideChar(Edit18.Text);
  AttrName := PWideChar(Edit19.Text);
  AttrValue := PWideChar(Edit20.Text);
  res := 0;
  Val := (Edit20.Text);
  res := PilotSetAttribute(PURI, Guid, AttrName, AttrValue);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

procedure TForm1.Button14Click(Sender: TObject);
var
  PURI, Guid: PWideChar;
  res: Integer;
begin
  //
  PURI := PWideChar(Edit1.Text);
  Guid := PWideChar(Edit21.Text);
  res := 0;
  res := PilotDeleteSourceFile(PURI, Guid);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

procedure TForm1.Button15Click(Sender: TObject);
var
  PURI, Guid: PWideChar;
  res: Integer;
begin
  //
  PURI := PWideChar(Edit1.Text);
  Guid := PWideChar(Edit22.Text);
  res := 0;
  res := PilotUnFreezeDocument(PURI, Guid);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  PR { XML результат } , PURI { адрес сервера вида net.tcp://localhost:8005/exportExternal } ,
    PCOND { Строка поиска } : PWideChar;
begin
  // Search
  PURI := PWideChar(Edit1.Text);
  PCOND := PWideChar(mFind.Text);
  PilotSearch(PR, PURI, PCOND);
  Memo1.Text := PR;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  PR, PURI: PWideChar;
  Guids: Array of TGuid;
  i: Integer;
begin
  // Export несколько GUID
  // формируем массив GUID из StringList
  for i := 0 to mGuids.Lines.Count - 1 do
  begin
    try
      StringToGUID('{' + mGuids.Lines[i] + '}');
      SetLength(Guids, Length(Guids) + 1);
      Guids[Length(Guids) - 1] := StringToGUID('{' + mGuids.Lines[i] + '}');
    except
      // если не удается StringToGUID(), то не добавляет в массив
    end;

  end;

  PURI := PWideChar(Edit1.Text);
  PilotExport(PR, PURI, Guids, Length(Guids), 0);
  Memo1.Text := PR;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  PURI, NewGUID, ParentGUID, TypeName: PWideChar;
  S: String;
  id: Integer;
  Guid: TGuid;
  res: Integer;
begin
  //
  PURI := PWideChar(Edit1.Text);
  CreateGUID(Guid);

  S := ReplaceStr(Guid.ToString, '}', '');
  S := ReplaceStr(S, '{', '');
  NewGUID := PWideChar(S);

  NewGUID := PWideChar(Edit5.Text);
  ParentGUID := PWideChar(Edit2.Text);
  TypeName:=  PWideChar(Edit24.Text);
  id := 18; // scheme - документ
  res := 0;
  res := PilotCreateDocument(PURI, NewGUID, ParentGUID, TypeName);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  PURI, Guid: PWideChar;
  res: Integer;
begin
  //
  PURI := PWideChar(Edit1.Text);
  Guid := PWideChar(Edit3.Text);
  res := 0;
  res := PilotDeleteDocument(PURI, Guid);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  PURI, sGUID: PWideChar;
  res: Integer;
  _GUID: TGuid;
begin
  //
  PURI := PWideChar(Edit1.Text);
  sGUID := PWideChar(Edit3.Text);
  res := 0;
  res := PilotFreezeDocument(PURI, sGUID);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  Guid: TGuid;
  S: String;
begin
  CreateGUID(Guid);
  S := ReplaceStr(Guid.ToString, '}', '');
  S := ReplaceStr(S, '{', '');
  Edit5.Text := PWideChar(S);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  PURI, Guid1, Guid2: PWideChar;
  res: Integer;
begin
  //
  PURI := PWideChar(Edit1.Text);
  Guid1 := PWideChar(Edit6.Text);
  Guid2 := PWideChar(Edit7.Text);
  res := 0;
  res := PilotCreateLink(PURI, Guid1, Guid2);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  PURI, Guid1, Guid2: PWideChar;
  res: Integer;
begin
  //
  PURI := PWideChar(Edit1.Text);
  Guid1 := PWideChar(Edit8.Text);
  Guid2 := PWideChar(Edit9.Text);
  res := 0;
  res := PilotDeleteLink(PURI, Guid1, Guid2);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  PURI, Guid, Path: PWideChar;
  res: Integer;
begin
  //
  PURI := PWideChar(Edit1.Text);
  Guid := PWideChar(Edit10.Text);
  Path := PWideChar(Edit11.Text);
  res := 0;
  res := PilotAttachSourceFile(PURI, Guid, Path);
  if res <> 0 then
    showmessage('Ошибка ' + inttostr(res));
end;

end.
