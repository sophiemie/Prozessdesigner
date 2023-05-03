unit ULanguage;

interface

const
  {Designer}
  DECISION_EN = 'Decision';
  DECISION_DE = 'Entscheidung';
  STARTEND_EN = 'Start/End';
  STARTEND_DE = 'Start/Ende';
  TASK_EN = 'Task';
  TASK_DE = 'Aufgabe';
  CONNECTOR_EN = 'Connector';
  CONNECTOR_DE = 'Konnektor';
  END_EN = 'End';
  END_DE = 'Ende';
  HD_EN = 'Human Decision';
  HD_DE = 'Menschliche Entscheidung';
  MD_EN = 'Machine Decision';
  MD_DE = 'Maschinelle Entscheidung';
  HT_EN = 'Human Task';
  HT_DE = 'Menschliche Aufgabe';
  MT_EN = 'Machine Task';
  MT_DE = 'Maschinelle Aufgabe';
  PROCESSDESIGNER_EN = 'Processdesigner';
  PROCESSDESIGNER_DE = 'Prozessdesigner';
  NOTSAVED_EN = 'File is not saved. Close anyway?';
  NOTSAVED_DE = 'Sie haben Ihre �nderungen nicht gespeichert. '
                    + 'Wollen Sie wirklich beenden?';
  ENDNODE_FAIL_DE = 'Endknoten kann keine Weiterf�hrung sein';
  ENDNODE_FAIL_EN = 'Endnode can not be a source node';
  STARTNODE_FAIL_DE = 'Startknoten kann keine Weiterf�hrung sein';
  STARTNODE_FAIL_EN = 'Startnode can not be target node';

  {Startpage}
  NEW_EN = 'New';
  NEW_DE = 'Neu';
  LOAD_EN = 'Load';
  LOAD_DE = 'Laden';
  DESCRIPTION_EN = 'Description';
  DESCRIPTION_DE = 'Beschreibung';
  ALLDIAGRAM_EN = 'All Diagrams';
  ALLDIAGRAM_DE = 'Alle Diagramme';
  CREATE_EN = 'Create';
  CREATE_DE = 'Erstellen';
  STARTPAGELABEL_CREATE_EN = 'Create New Diagram';
  STARTPAGELABEL_CREATE_DE = 'Neues Diagramm erstellen';
  STARTPAGELABEL_LOAD_EN = 'Load Diagram';
  STARTPAGELABEL_LOAD_DE = 'Diagramm laden';
  STARTPAGELABEL_VERSION_EN = 'Create New Version';
  STARTPAGELABEL_VERSION_DE = 'Neue Version erstellen';
  NAME_HINT_DE = 'Das Diagramm braucht einen Namen.';
  NAME_HINT_EN = 'The Diagram needs a name.';
  DESCRIPTION_HINT_DE = 'Optional kann dem Diagramm eine Beschreibung hinzu '
                          + 'gef�gt werden.';
  DESCRIPTION_HINT_EN = 'A Description to the new Diagram. Its optional.';
  NEWVERSION_EN = 'New Version';
  NEWVERSION_DE = 'Neue Version';
  NODIAGRAM_NAME_DE = 'Name darf nicht leer sein.';
  NODIAGRAM_NAME_EN = 'Name can not be empty.';
  ACTIVE_EN = 'Active';
  ACTIVE_DE = 'Aktiv';
  OPEN_EN = 'Open';
  OPEN_DE = '�ffnen';
  NODIAGRAM_SELECTED_EN = 'No Diagram Selected.';
  NODIAGRAM_SELECTED_DE = 'Kein Diagramm ausgew�hlt.';
  YES_EN = 'yes';
  NO_EN = 'no';
  YES_DE = 'ja';
  NO_DE = 'nein';

  {Nodeselection}
  NODESELECTION_EN = 'Nodeselection';
  NODESELECTION_DE = 'Knotenauswahl';
  ENDNODE_EN = 'Endnode';
  ENDNODE_DE = 'Endknoten';
  END_QUESTION_EN = 'What kind?';
  END_QUESTION_DE = 'Was f�r eine Art?';
  HD_QUESTION_EN = 'Who should decide?';
  HD_QUESTION_DE = 'Wer soll entscheiden?';
  MD_QUESTION_EN = 'What should be checked?';
  MD_QUESTION_DE = 'Was soll �berpr�ft werden?';
  HT_QUESTION_EN = 'Which Formular should be filled?';
  HT_QUESTION_DE = 'Welches Formular soll ausgef�llt werden?';
  MT_QUESTION_EN = 'Which method should be used?';
  MT_QUESTION_DE = 'Welche Methode soll genutzt werden?';

  END_SEL1_EN = 'Abort';
  END_SEL1_DE = 'Abbruch';

  HD_SEL1_EN = 'Supervisor';
  HD_SEL2_EN = 'Leader';
  HD_SEL3_EN = 'Management';
  HD_SEL1_DE = 'Aufsicht';
  HD_SEL2_DE = 'Leitung';
  HD_SEL3_DE = 'Management';

  MD_SEL1_DE = 'Stellungnahme';
  MD_SEL2_DE = 'Gen�gend/�berschneidete Tage';
  MD_SEL3_DE = 'Anmeldung';
  MD_SEL4_DE = 'Programmbereich';
  MD_SEL5_DE = 'Position Antragsteller';
  MD_SEL1_EN = 'Statement';
  MD_SEL2_EN = 'Enough/Overlap Days';
  MD_SEL3_EN = 'Registration';
  MD_SEL4_EN = 'Program Area';
  MD_SEL5_EN = 'Position Appliant';

  HT_SEL1_DE = 'Urlaub';
  HT_SEL2_DE = 'Drittmittel';
  HT_SEL3_DE = 'MitarbeiterInnen und G�ste';
  HT_SEL4_DE = 'Reise';
  HT_SEL1_EN = 'Vaccation';
  HT_SEL2_EN = 'Third party funding';
  HT_SEL3_EN = 'Employees and Guests';
  HT_SEL4_EN = 'Travel';

  MT_SEL1_EN = 'Generate PDF';
  MT_SEL2_EN = 'Send PDF';
  MT_SEL3_EN = 'Send Info';

  NO_DESCRIPTIONSELECT_DE = 'Bitte ausw�hlen.';
  NO_DESCRIPTIONSELECT_EN = 'Please choose.';

  END_HINT_DE = 'Standard ist f�r ein Prozess der erfolgreich geendet ist.'
                  + ' Sind bestimmte Kriterien nicht erf�llt kann ein Prozess'
                  + ' vorzeitig beendet werden, dies f�hrt zu einem Abbruch.';
  HD_HINT_DE = 'Es gibt verschiedene Personen, die eine Entscheidung treffen '
                + 'k�nnen.';
  MD_HINT_DE = 'Dies sind verschiedene �berpr�fungen die das System bereits '
                  + '�berpr�fen kann.';
  HT_HINT_DE = 'Es gibt verschidene Formulare, die der Auftragsteller bei einem'
                  + ' Prozess ausf�llen muss.';
  MT_HINT_DE = 'Dies sind Funktionen die bereits vom System durchgef�hrt werden'
                + ' k�nnen.';
  END_HINT_EN = 'Standard are for Processes which went successful. When they '
                + ' are some unfulfilled criterias, then a process must be '
                + ' abort.';
  HD_HINT_EN = 'All people who can make a decision.';
  MD_HINT_EN = 'They are different kinds of Verifications which can be done by '
                + ' the system.';
  HT_HINT_EN = 'They are different kinds of Formulars which must be filled by '
                + 'the Appliant.';
  MT_HINT_EN = 'These are functions which can be performed by the system.';

implementation

end.
