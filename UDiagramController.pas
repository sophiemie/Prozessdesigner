{
  Bachelorthesis ueber die Entwicklung einer grafischen Oberflaeche zur
  Erstellung von Workflows am ZMT (Leibniz-Zentrum fuer Marine Tropenforschung)
  Duales Studium Informatik, Hochschule Bremen
  Sophie Miessner 5046830, 2023

  Unit UDiagramController: Hier wird die Controller Klasse der Diagramme
  verwaltet.
}
unit UDiagramController;

interface

uses
  UDiagram, VCL.TMSFNCBloxControl, Vcl.Dialogs, System.Classes, System.SysUtils,
  Vcl.Grids, ULanguage, UDatabase;

type
  { Dynamisches Array fuer die Eintraege der Diagramme in der Liste der Startseite }
  TDiagramEntry = array of TDiagram;

  { Klasse des Diagramm-Controllers}
  TDiagramController = class abstract
  public
    class procedure loadDiagramToFile(diagram : TDiagram; openDialog:
                         TOpenDialog; control : TTMSFNCBloxControl); overload;
    class procedure loadDiagramToFile(diagram : TDiagram; control:
                              TTMSFNCBloxControl; fileName : String); overload;
    class function saveDiagramToFile(diagram : TDiagram; saveDialog:
                          TSaveDialog; control : TTMSFNCBloxControl) : boolean;
    class procedure fillLoadingList(list : TStringGrid); overload;
    class procedure fillLoadingList(list : TStringGrid; database :
                                      TDiagramDatabase); overload;
    class function selectDiagramFromList(list: TStringGrid; diagram: TDiagram;
                                        row : Integer) : TDiagram; overload;
    class function selectDiagramFromList(list : TStringGrid; diagram : TDiagram;
      row : Integer; database : TDiagramDatabase) : TDiagram; overload;
    class function getNewID(list : TStringGrid) : Integer; overload;
    class function getNewID(database : TDiagramDatabase) : Integer; overload;
    class function compareTwoDiagramsIfSimilar(firstDiagram : TDiagram;
                    secondDiagram : TDiagram) : boolean;
    var IsLoadesDiagram : boolean;
  protected { Damit die in den Unittests verwendet werden koennen }
    class procedure replaceNodeNames(fileName : String);
    class function filterIDFromFileName(fileName : String) : String;
    class function filterNameFromFileName(fileName : String) : String;
    class function filterVersionFromFileName(fileName : String) : String;
  end;

implementation

{ Es wird verglichen ob die beiden Diagramme dieselben Inhalt enthalten }
class function TDiagramController.compareTwoDiagramsIfSimilar(firstDiagram :
                TDiagram; secondDiagram : TDiagram) : boolean;
begin
  Result := (firstDiagram.getGermanName = secondDiagram.getGermanName) and
    (firstDiagram.getEnglishName = firstDiagram.getEnglishName) and
    (firstDiagram.getClassName = secondDiagram.getClassName) and
    (firstDiagram.getInUse = secondDiagram.getInUse) and
    (firstDiagram.getGermanDescription = secondDiagram.getGermanDescription) and
    (firstDiagram.getEnglishDescription = secondDiagram.getEnglishDescription);
end;

{ Diagramm von Designer-Formular laden}
class procedure TDiagramController.loadDiagramToFile(diagram : TDiagram;
                      openDialog : TOpenDialog; control : TTMSFNCBloxControl);
var
  fileName : String;
begin
  openDialog.Execute();
  replaceNodeNames(openDialog.FileName);

  fileName := openDialog.Files[0];
  control.LoadFromFile(fileName); {In Editor Diagramm laden}

  { Pfad entfernen und Daten in Diagramm laden }
  fileName := fileName.Remove(0, openDialog.InitialDir.Length);
  diagram.setID(filterIDfromFileName(fileName).ToInteger);
  diagram.setVersionNumber(filterVersionFromFileName(fileName).ToInteger);
  diagram.setGermanName(filterNameFromFileName(fileName));
end;

class procedure TDiagramController.loadDiagramToFile(diagram : TDiagram;
                              control : TTMSFNCBloxControl; fileName : String);
begin
  replaceNodeNames('Diagramme/' + fileName);
  control.LoadFromFile('Diagramme/' + fileName); {In Editor Diagramm laden}
end;

 { Diagramm in lokaler Datei speichern }
class function TDiagramController.saveDiagramToFile(diagram : TDiagram;
  saveDialog : TSaveDialog; control : TTMSFNCBloxControl) : boolean;
var
  fileName : String;
begin
  fileName := diagram.getID.ToString + '_' + 'v'
                + diagram.getVersionNumber.ToString + '_' + diagram.getGermanName;
  saveDialog.FileName := fileName;  // So wird Dateiname vorgeschlagen
  if saveDialog.Execute then
  begin
    control.SaveToFile(saveDialog.InitialDir + fileName + '.blox');
    Result := true;
  end
  else Result := false;
end;

{ Ersetzt in gespeicherter Datei die selbst erstellten Klassen durch Klassen
  von der geerbt wird. }
class procedure TDiagramController.replaceNodeNames(fileName : String);
var
  openFile : TStringList;
  I : Integer;
begin
  openFile := TStringList.Create;
  openFile.LoadFromFile(fileName);
  for I := 0 to openFile.Count-1 do
  begin
    openFile[I] := StringReplace(openFile[I], 'TEnd',
              'TTMSFNCBloxUMLFinalStateBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'TStart',
              'TTMSFNCBloxUMLInitialStateBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'THumanTask',
              'TTMSFNCBloxUMLActionStateBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'THumanDecision',
              'TTMSFNCBloxUMLDecisionBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'TMachineTask',
              'TTMSFNCBloxUMLActionStateBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'TMachineDecision',
              'TTMSFNCBloxUMLDecisionBlock', [rfReplaceAll, rfIgnoreCase]);
    openFile[I] := StringReplace(openFile[I], 'TEdge',
              'TTMSFNCBloxDFDDataFlowLine', [rfReplaceAll, rfIgnoreCase]);
  end;
  openFile.SaveToFile(fileName);
end;

{ Aus Dateinamen ID bestimmen, verwendet fuer die Version ohne DB-Anbindung }
class function TDiagramController.filterIDFromFileName(fileName : String)
                                                                      : String;
var
  I : Integer;
  id : String;
begin
  I := 0;
  while fileName.Chars[I] <> '_' do
  begin
    id := id + fileName.Chars[I];
    I := I +1;
  end;
  Result := id;
end;

{ Aus Dateinamen Version bestimmen, verwendet fuer die Version ohne DB-Anbindung }
class function TDiagramController.filterVersionFromFileName(fileName : String)
                                                                      : String;
var
  I : Integer;
  version : String;
begin
  // ID aus Filenamen entfernen sowie das folgenden _v
  fileName := fileName.Remove(0, filterIDFromFileName(fileName).Length + 2);

  I := 0;
  while fileName.Chars[I] <> '_' do
  begin
    version := version + fileName.Chars[I];
    I := I +1;
  end;
  Result := version;
end;

{ Aus Dateinamen Namen bestimmen, verwendet fuer die Version ohne DB-Anbindung }
class function TDiagramController.filterNameFromFileName(fileName : String)
                                                                      : String;
var
  I : Integer;
  name : String;
  idLength : Integer;
begin
  idLength := filterIDFromFileName(fileName).Length +3;
  fileName := fileName.Remove(0, filterVersionFromFileName(fileName).Length
                                                                    +idLength);

  I := 0;
  while fileName.Chars[I] <> '.' do
  begin
    name := name + fileName.Chars[I];
    I := I +1;
  end;
  Result := name;
end;


{ Fuelle Ladeliste mit lokalen Dateien, ohne Anbindung der Datenbank }
class procedure TDiagramController.fillLoadingList(list : TStringGrid);
var
  dir, cellText : String;
  searchRec : TSearchRec;
  I : Integer;
begin
  dir := IncludeTrailingPathDelimiter(GetCurrentDir)+ 'Diagramme/';

  if FindFirst(dir + '*.*', faAnyFile, searchRec) = 0 then
  begin
   repeat
    if searchRec.Attr and faDirectory = 0 then
     begin
      list.RowCount := list.RowCount +1;
      list.Cells[1,list.RowCount-1] := searchRec.Name;
     end;
   until FindNext(searchRec) <> 0;
   FindClose(searchRec);
  end;

  for I := 1 to list.RowCount-1 do
  begin
    cellText := list.Cells[1,I];
    list.Cells[0,I] := cellText.Chars[0];
    list.Cells[3,I] := cellText.Chars[3];
    cellText := cellText.Remove(0,5);
    cellText := cellText.Remove(cellText.Length-5);
    list.Cells[1,I] := cellText;
  end;
end;

{ Fuelle Ladeliste mit Diagrammen aus der Datenbank }
class procedure TDiagramController.fillLoadingList(list : TStringGrid;
                                                  database : TDiagramDatabase);
var
  I, entryNumber : Integer;
  entry : TDiagramEntry; // Array mit Diagrammen
  diagram : TDiagram; // aktuelles Diagramm
begin
  entryNumber := 0;
  list.RowCount := database.getDataCount() +1; // Maximale Reihen setzen
  SetLength(entry,list.RowCount-1); // Array Groe�e festlegen

  // Alle IDs durchgehen
  for I := 0 to database.getHighestDiagramID do
  begin
    diagram := TDiagram.Create(I,'',''); // Diagramm erstellen
    // Beziehe vorhandene Daten zum Diagramm aus der Datenbank
    diagram := database.giveDiagramSavedDatas(diagram);
    // 0 = kein Eintrag zu dem Diagramm in der Datenbank
    if diagram.getID <> 0 then
    begin
      entry[entryNumber] := TDiagram.Create
                      (diagram.getID, diagram.getGermanName, diagram.getGermanDescription);
      entry[entryNumber].setVersionNumber(diagram.getVersionNumber);
      entryNumber := entryNumber +1;
    end;
  end;

  // Fuer jeden Eintrag folgende Werte eintragen
  for I := 0 to Length(entry)-1 do
  begin
      list.Invalidate;
      list.Cells[0,I+1] := entry[I].getID.ToString;
      list.Cells[1,I+1] := entry[I].getGermanName;
      list.Cells[2,I+1] := entry[I].getGermanDescription;
      list.Cells[3,I+1] := entry[I].getVersionNumber.ToString;
      list.Cells[4,I+1] := entry[I].getGermanDescription;
      {list.Cells[6,I+1] := 'Open';
      list.Cells[7,I+1] := 'Edit';
      list.Cells[8,I+1] := 'Copy';}  // Erstmal rausgenommen
  end;
end;

{ Waehle Diagramm aus Liste, ohne Datenbankanbindung }
class function TDiagramController.selectDiagramFromList(list : TStringGrid;
                  diagram : TDiagram; row : Integer) : TDiagram;
var
  name, description : String;
  ID, version : Integer;
  inUse : boolean;
begin
  ID := list.Cells[0,row].ToInteger;
  Name := list.Cells[1,row];
  Description := list.Cells[2,row];
  Version := list.Cells[3,row].ToInteger();

  if list.Cells[4,row].Equals(YES_DE) or list.Cells[4,row].Equals(YES_EN) then
    InUse := true
  else
    InUse := false;

  diagram := TDiagram.Create(ID, name, description);
  diagram.setInUse(InUse);
  diagram.setVersionNumber(version);
  Result := diagram;
end;

{ Waehle Diagramm aus Liste }
class function TDiagramController.selectDiagramFromList(list : TStringGrid;
    diagram : TDiagram; row : Integer; database : TDiagramDatabase) : TDiagram;
var
  ID : Integer;
begin
  ID := list.Cells[0,row].ToInteger;
  diagram := TDiagram.Create(ID,'','');
  diagram := database.giveDiagramSavedDatas(diagram);
  Result := diagram;
end;

{ Ermittle neue Diagramm-ID, ohne Datenbankanbindung }
class function TDiagramController.getNewID(list : TStringGrid) : Integer;
begin
  Result := list.RowCount;
end;

{ Ermittle neue Diagramm-ID }
class function TDiagramController.getNewID(database : TDiagramDatabase) : Integer;
begin
  Result := database.getHighestDiagramID +1;
end;

end.
