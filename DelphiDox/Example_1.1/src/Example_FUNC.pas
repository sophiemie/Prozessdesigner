// =============================================================================
//! @file
//! @brief Example: Documenting FUNCTIONs and PROCEDUREs
//!
//! @date 03.05.2020
//! @author Dipl.Inform. Thomas Schneider
// -----------------------------------------------------------------------------
//! @brief Example_FUNC-unit
unit Example_FUNC;
//! @addtogroup Example_FUNC-Group
//! @brief Doc for Example_FUNC-Group
//! @{
//! @cond
{$IFDEF DOXYGEN}
{$HPPEMIT '//! @file Example_FUNC.pas'}
{$HPPEMIT '//! @file'}
{$HPPEMIT '#include "doxygen.h"'}
{$ENDIF}
// =============================================================================

interface

uses Example_VAR, Example_TYPE;

// [EXAMPLE_PROC] --------------------------------------------------------------
//! @endcond
//! @DProc{ReplaceProc,Example_FUNC}
//! @brief replaces ASCII-ctrlchars
//!
//! @CProc{ReplaceProc,Example_FUNC}
//!
//! replaces ASCII-ctrlchars with blanks, nothing, name or hex depending
//! depending on whether the char is included in the respective ReplaceXxxx set
//! @param[in,out] AString Input string / Output ttring with replaced ctrlchars
//! @param ReplaceNone set with ctrlchars to delete
//! @param ReplaceName set with ctrlchars to replace by their names
//! @param ReplaceHex set with ctrlchars to replace by their hex representation
//!
//! @note uses typed CONST @ref ASCIINames
//! @cond
PROCEDURE ReplaceProc(VAR AString: AnsiString;
                      // TASCIICtrlSets zur Behandlung von Ctrl-Zeichen:
                      // diese Zeichen...
                      CONST ReplaceBlanks, // ...ersetzen durch Blanks
                            ReplaceNone,   // ...entfernen
                            ReplaceName,   // ...ersetzen durch den Namen
                            ReplaceHex:    // ...ersetzen durch Hex
                                           TASCIICtrlSet);

// [EXAMPLE_PROC] --------------------------------------------------------------

// [EXAMPLE_FUNC] --------------------------------------------------------------
//! @endcond
//! @DFunc{ReplaceFunc,Example_FUNC}
//! @brief replaces ASCII-ctrlchars
//!
//! @CFunc{ReplaceFunc,Example_FUNC}
//!
//! replaces ASCII-ctrlchars with blanks, nothing, name or hex depending
//! depending on whether the char is included in the respective ReplaceXxxx set
//!
//! @param AString Input string
//! @param ReplaceBlanks set with ctrlchars to replace by Spaces
//! @param ReplaceNone set with ctrlchars to delete
//! @param ReplaceName set with ctrlchars to replace by their names
//! @param ReplaceHex set with ctrlchars to replace by their hex representation
//! @result AString with replaced ctrlchars
//!
//! @note uses typed CONST @ref ASCIINames
//! @cond
FUNCTION ReplaceFunc(AString: AnsiString;
                      // TASCIICtrlSets zur Behandlung von Ctrl-Zeichen:
                      // diese Zeichen...
                      CONST ReplaceBlanks, // ...ersetzen durch Blanks
                            ReplaceNone,   // ...entfernen
                            ReplaceName,   // ...ersetzen durch den Namen
                            ReplaceHex:    // ...ersetzen durch Hex
                                           TASCIICtrlSet): AnsiString;

// [EXAMPLE_FUNC] --------------------------------------------------------------

implementation

uses SysUtils;

{ Steuerzeichen ersetzen: }
FUNCTION ReplaceFunc(AString: AnsiString;
                     // TASCIICtrlSets zur Behandlung von Ctrl-Zeichen:
                     // diese Zeichen...
                     CONST ReplaceBlanks, // ...ersetzen durch Blanks
                           ReplaceNone,   // ...entfernen
                           ReplaceName,   // ...ersetzen durch den Namen
                           ReplaceHex:    // ...ersetzen durch Hex
                                          TASCIICtrlSet): AnsiString;
VAR i : INTEGER;
    c : AnsiChar;
BEGIN
  i := 1;
  WHILE i <= Length(AString) DO BEGIN
    c := AString[i];
    IF c >= ' ' THEN Inc(i)
    ELSE
      IF c IN ReplaceBlanks THEN BEGIN AString[i] := ' '; Inc(i); END
      ELSE IF c IN ReplaceNone THEN Delete(AString,i,1)
      ELSE IF c IN ReplaceName THEN BEGIN
        Insert('<'+ASCIINames[c]+'>',AString,i); // vor dem Ctrl-Zeichen einfügen
        Inc(i,Length(ASCIINames[c])+2);          // i wieder auf das Ctrl-Zeichen
        Delete(AString,i,1);                     // und Ctrl-Zeichen löschen
      END
      ELSE IF c IN ReplaceHex THEN BEGIN
        Insert('<'+IntToHex(Ord(c),2)+'>',AString,i); // vor dem Ctrl-Zeichen einfügen
        Inc(i,4);                                     // i wieder auf das Ctrl-Zeichen
        Delete(AString,i,1);                          // und Ctrl-Zeichen löschen
      END;
  END;
  Result := AString;
END;

PROCEDURE ReplaceProc(VAR AString: AnsiString;
                      // TASCIICtrlSets zur Behandlung von Ctrl-Zeichen:
                      // diese Zeichen...
                      CONST ReplaceBlanks, // ...ersetzen durch Blanks
                            ReplaceNone,   // ...entfernen
                            ReplaceName,   // ...ersetzen durch den Namen
                            ReplaceHex:    // ...ersetzen durch Hex
                                           TASCIICtrlSet);
BEGIN
  AString := ReplaceFunc(AString, ReplaceBlanks, ReplaceNone, ReplaceName, ReplaceHex);
END;

end.
//! @endcond
//! @}
// =============================================================================

