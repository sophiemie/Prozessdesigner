{
  Bachelorthesis ueber die Entwicklung einer grafischen Oberflaeche zur
  Erstellung von Workflows am ZMT (Leibniz-Zentrum fuer Marine Tropenforschung)
  Duales Studium Informatik, Hochschule Bremen
  Sophie Miessner 5046830, 2023

  Unit UDesignerToolbar: Klasse in der Toolbar-Komponenten aufgefuehrt sind. Aktuell
  werden diese noch nicht genutzt, da es einfacher war die Komponenten im
  Design-Formular über den Inspektor hinzuzufuegen. In Zukunft soll jedoch
  diese Klasse verwendet werden.
}
unit UDesignerToolbar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Menus,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.SqlExpr,
  Vcl.StdCtrls, VCL.TMSFNCUtils, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ToolWin,
  Vcl.ComCtrls, System.Classes, UZMTStandard;

  type
  TToolBar = class
  public
    constructor Create;
    procedure setToolBarHeight(newHeight : Integer);
    function getToolBarHeight : Integer;
    var
      { 1: Button fuer den Startknoten
        2: Button fuer den Endknoten
        3: Button fuer die menschliche Aufgabe
        4: Button fuer die maschinelle Aufgabe
        5: Button fuer die menschliche Entscheidung
        6: Button fuer die maschinelle Entscheidung
        7: Button fuer die Kanten }
      toolBarBtn: array[1..7] of TBitBtn;
      { 1: Main-Panel
        2: Start- und Endknoten
        3: Aufgabenknoten
        4: Entscheidungsknoten
        5: Button fuer die menschliche Aufgabe }
      panel: array[1..5] of TPanel;
      { 1: Label fuer den Startknoten
        2: Label fuer den Endknoten
        3: Label fuer die menschliche Aufgabe
        4: Label fuer die maschinelle Aufgabe
        5: Label fuer die menschliche Entscheidung
        6: Label fuer die maschinelle Entscheidung }
      sign: array[1..6] of TLabel;
  private
    var
      MainPanelHeight : Integer; // sich an Form anpassen
    const
      MAIN_PANEL_WIDTH = 260;
      PANEL_HEIGHT = 25;
      PANEL_WIDTH = 274;
      MAIN_PANEL_COLOR = clBtnHighlight;
      MAIN_PANEL_LEFT = 0;
      MAIN_PANEL_TOP = 0;
      PANEL_COLOR = lightBlue;
      PANEL_FONT_COLOR = clBtnHighlight;
      PANEL_STARTEND_TEXT = 'Start/End';
      PANEL_TASK_TEXT = 'Tasks';
      PANEL_DECISION_TEXT = 'Decisions';
      PANEL_EDGE_TEXT = 'Connector';
      PANEL_FONTSIZE = 16;
      PANEL_LEFT = -8;
      PANEL_STARTEND_TOP = -1;
      PANEL_TASK_TOP = 127;
      PANEL_DECISION_TOP = 251;
      PANEL_EDGE_TOP = 387;
      BTN_HEIGHT = 65;
      BTN_TASK_WIDTH = 98;
      BTN_DECISION_WIDTH = 81;
      BTN_DECISION_HEIGHT = 76;
      LABEL_START_TEXT = 'Start';
      LABEL_END_TEXT = 'End';
      LABEL_HT_TEXT = 'Human Task';
      LABEL_MT_TEXT = 'Mashine Task';
      LABEL_HD_TEXT = 'Human Decision';
      LABEL_MD_TEXT = 'Mashine Decision';
      LABEL_FONTSIZE = 11;
  end;

implementation

constructor TToolbar.Create;
var
  I: Integer;
begin
  inherited Create;
  { Initialisierung der Buttons }
  {Start- und End}
  for I := 1 to 2 do
  begin
    toolBarBtn[I].Height := BTN_HEIGHT;
    toolBarBtn[I].Width := BTN_HEIGHT;
  end;
  {Aufgaben}
  for I := 3 to 4 do
  begin
    toolBarBtn[I].Height := BTN_HEIGHT;
    toolBarBtn[I].Width := BTN_TASK_WIDTH;
  end;
  {Entscheidungen}
  for I := 5 to 6 do
  begin
    toolBarBtn[I].Height := BTN_DECISION_HEIGHT;
    toolBarBtn[I].Width := BTN_DECISION_WIDTH;
  end;
  {Kante}
  toolBarBtn[7].Height := BTN_DECISION_HEIGHT;
  toolBarBtn[7].Width := BTN_DECISION_WIDTH;
  {Alle}
  for I := 1 to 7 do
  begin
    toolBarBtn[I].Caption := '';
  end;

  {Initialisierung der Panels}
  panel[1].Color := MAIN_PANEL_COLOR;
  panel[1].Top := MAIN_PANEL_TOP;
  panel[1].Width := MAIN_PANEL_WIDTH;
  panel[1].Caption := '';

  panel[2].Caption := PANEL_STARTEND_TEXT;
  panel[3].Caption := PANEL_TASK_TEXT;
  panel[4].Caption := PANEL_DECISION_TEXT;
  panel[5].Caption := PANEL_EDGE_TEXT;

  panel[2].Top := PANEL_STARTEND_TOP;
  panel[3].Top := PANEL_TASK_TOP;
  panel[4].Top := PANEL_DECISION_TOP;
  panel[5].Top := PANEL_EDGE_TOP;

  for I := 2 to 5 do
  begin
    panel[I].Color := PANEL_COLOR;
    panel[I].Font.Size := PANEL_FONTSIZE;
    panel[I].Font.Name := SECTION_FONT;
    panel[I].Left := PANEL_LEFT;
  end;

  {Initialisierung der Labels}
  sign[1].Caption := LABEL_START_TEXT;
  sign[2].Caption := LABEL_END_TEXT;
  sign[3].Caption := LABEL_HT_TEXT;
  sign[4].Caption := LABEL_MT_TEXT;
  sign[5].Caption := LABEL_HD_TEXT;
  sign[6].Caption := LABEL_MD_TEXT;

  for I := 1 to 6 do
  begin
    sign[I].Font.Size := LABEL_FONTSIZE;
    sign[I].Font.Name := NORMAL_FONT;
  end;

end;

procedure TToolBar.setToolBarHeight(newHeight : Integer);
begin
  MainPanelHeight := newHeight;
end;

function TToolBar.getToolBarHeight : Integer;
begin
  Result := MainPanelHeight;
end;

end.
