{
  Bachelorthesis ueber die Entwicklung einer grafischen Oberflaeche zur
  Erstellung von Workflows am ZMT (Leibniz-Zentrum fuer Marine Tropenforschung)
  Duales Studium Informatik, Hochschule Bremen
  Sophie Miessner 5046830, 2023

  Unit UNodeController: In der Unit wird die Controller-Klasse der Knoten
  verwaltet.
}
unit UNodeController;

interface

uses UNodes, UNodeSelection, UDatabase;

type
  TNodeController = class abstract
  public
    class function createNewNode(database : TNodeDatabase; start : TStart) :
                                                              TStart; overload;
    class function createNewNode(database : TNodeDatabase; endNode : TEnd) :
                                                                TEnd; overload;
    class function createNewNode(database : TNodeDatabase; MT : TMachineTask) :
                                                        TMachineTask; overload;
    class function createNewNode(database : TNodeDatabase; MD: TMachineDecision)
                                                  : TMachineDecision; overload;
    class function createNewNode(database : TNodeDatabase; HT : THumanTask) :
                                                          THumanTask; overload;
    class function createNewNode(database : TNodeDatabase; HD : THumanDecision)
                                                    : THumanDecision; overload;
    class var IDohneDB : Integer;
  private
    class procedure openNodeSelection(classType : String);
    class function getNewID : Integer; overload;
    class function getNewID(database : TNodeDatabase) : Integer; overload;
  end;

implementation

{ Erstellung eines neuen Startknotens }
class function TNodeController.createNewNode(database : TNodeDatabase;
start : TStart) : TStart;
begin
  start := TStart.Create(getNewID(database));
  Result := start;
end;

{ Erstellung eines neuen Endknotens }
class function TNodeController.createNewNode(database : TNodeDatabase;
endNode : TEnd) : TEnd;
begin
  openNodeSelection(TEnd.getClassType);
  endNode := TEnd.Create(getNewID(database), NodeSelectionForm.getSelectedNodeDescription);
  Result := endNode;
end;

{ Erstellung einer neuen maschinellen Aufgabe }
class function TNodeController.createNewNode(database : TNodeDatabase;
MT : TMachineTask) : TMachineTask;
begin
  openNodeSelection(TMachineTask.getClassType);
  MT := TMachineTask.Create(getNewID(database),
                    NodeSelectionForm.getSelectedNodeDescription);
  Result := MT;
end;

{ Erstellung eines neuen maschinellen Entscheidung }
class function TNodeController.createNewNode(database : TNodeDatabase;
MD : TMachineDecision) : TMachineDecision;
begin
  openNodeSelection(TMachineDecision.getClassType);
  MD := TMachineDecision.Create(getNewID(database),
                    NodeSelectionForm.getSelectedNodeDescription);
  Result := MD;
end;

{ Erstellung eines neuen menschlichen Aufgabe }
class function TNodeController.createNewNode(database : TNodeDatabase;
HT : THumanTask) : THumanTask;
begin
  openNodeSelection(THumanTask.getClassType);
  HT := THumanTask.Create(getNewID(database),
                    NodeSelectionForm.getSelectedNodeDescription);
  Result := HT;
end;

{ Erstellung eines neuen menschlichen Entscheidung }
class function TNodeController.createNewNode(database : TNodeDatabase;
HD : THumanDecision) : THumanDecision;
begin
  openNodeSelection(THumanDecision.getClassType);
  HD := THumanDecision.Create(getNewID(database),
                    NodeSelectionForm.getSelectedNodeDescription);
  Result := HD;
end;

{ Formular fuer Auswahl der Kontenspezifikation oeffnen }
class procedure TNodeController.openNodeSelection(classType : String);
begin
  NodeSelectionForm.FillList(classType);
  NodeSelectionForm.ShowModal;
end;

{ Bestimmung neuer Knoten ID ohne Datenbankanbindung }
class function TNodeController.getNewID : Integer;
begin
  Result := IDohneDB +1;
end;

{ Bestimmung neuer Knoten ID mit Datenbankanbindung }
class function TNodeController.getNewID(database : TNodeDatabase) : Integer;
begin
  Result := database.getHighestNodeID +1;
end;

end.
