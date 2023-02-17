// =============================================================================
//! @file
//! @brief Example: Documenting VARs
//!
//! @date 01.05.2020
//! @author Dipl.Inform. Thomas Schneider
// -----------------------------------------------------------------------------
//! @brief Example_VAR-unit
unit Example_VAR;
//! @addtogroup Example_VAR-Group
//! @brief Doc for Example_VAR-Group
//!
//! Relates to Delphi VARs and typed CONSTs; for plain Delphi CONSTs refer to
//! @ref Example_CONST-Group.
//!
//! @{
//! @cond
{$IFDEF DOXYGEN}
{$HPPEMIT '//! @file Example_VAR.pas'}
{$HPPEMIT '//! @file'}
{$HPPEMIT '#include "doxygen.h"'}
{$ENDIF}
// =============================================================================

interface

uses Example_TYPE;

// [EXAMPLE_VAR_1] -------------------------------------------------------------
//! @endcond
//! @DVar{ASCIICtrls, Example_VAR}
//! variable: set containing ASCII-ctrlchars
//! @cond
VAR ASCIICtrls: TASCIICtrlSet;

// [EXAMPLE_VAR_1] -------------------------------------------------------------


// [EXAMPLE_VAR_2] -------------------------------------------------------------
//! @endcond
//! @DConst{ASCIINames, Example_VAR}
//! @brief Tabelle mit den Ascii-Namen
//!
//! @CVar{TASCIINames,ASCIINames,Example_VAR}
//!
//! @cond
CONST ASCIINames: TASCIINames
                = ('NUL',
                   'SOH', // ^A
                   'STX',
                   'ETX',

                   'EOT',
                   'ENQ',
                   'ACK',
                   'BEL',

                   'BS',
                   'HT',
                   'LF',
                   'VT',

                   'FF',
                   'CR',
                   'SO',
                   'SI',

                   'DLE',
                   'DC1',
                   'DC2',
                   'DC3',

                   'DC4',
                   'NAK',
                   'SYN',
                   'ETB',

                   'CAN',
                   'EM',
                   'SUB',
                   'ESC',

                   'FS',
                   'GS',
                   'RS',
                   'US');

// [EXAMPLE_VAR_2] -------------------------------------------------------------

// [EXAMPLE_VAR_3] -------------------------------------------------------------
//! @endcond
//! @DEnumVar{ASCII_Enum, Example_VAR}
//! @brief Enumeration of all ASCII-ctrlchars
//! @cond
VAR ASCII_Enum: (NUL, SOH, STX, ETX,
                 EOT, ENQ, ACK, BEL,
                 BS,  HT,  LF,  VT,
                 FF,  CR,  SO,  SI,
                 DLE, DC1, DC2, DC3,
                 DC4, NAK, SYN, ETB,
                 CAN, EM,  SUB, ESC,
                 FS,  GS,  RS,  US);

// [EXAMPLE_VAR_3] -------------------------------------------------------------

//! @endcond
//! @DVar{ASCIIEnum, Example_VAR}
//! @brief Enumeration of all ASCII-ctrlchars
//! @cond
ASCIIEnum: TASCIIEnum;

// [EXAMPLE_VAR_4] ------------------------------------------------------------
//! endcond
//! @DRecordVar{ASCII_CtrlChar, Example_VAR}
//! @brief type definiton: set which can hold all ASCII-ctrlchars
//!
//! @DRecordField{ASCII_CtrlChar,c, Example_VAR}
//! @brief the ASCII-ctrlchar interpreted as AnsiChar
//!
//! @DRecordField{ASCII_CtrlChar,name, Example_VAR}
//! @brief name of the ASCII-ctrlchar
//!
//! cond
VAR ASCII_CtrlChar: RECORD
      c:    AnsiChar;    // ASCII Ctrl character
      name: AnsiString;  // name of the Character
    END; // ASCII_CtrlChar

// [EXAMPLE_VAR_4] ------------------------------------------------------------

//! @endcond
//! @Name{VarDeclarations,grouped Variables}
//! Some examples for variable declarations, gathered in a group
//! @{
//! @cond
VAR
    //! @endcond
    //! @DVar{IntVar,Example_VAR}
    //! @brief simple variable
    //! @cond
    IntVar: INTEGER; // integer variable
    //! @endcond
    //! @DVar{ASCIICtrlChar,Example_VAR}
    //! @brief Variable of type TASCIICtrlChar
    //! @cond
    ASCIICtrlChar: TASCIICtrlChar; // ascii ctrlchar variable
//! @endcond
//! @}
//! @cond

implementation

end.
//! @endcond
//! @}
// =============================================================================

