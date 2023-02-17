// =============================================================================
//! @file
//! @brief Example: Documenting TYPEs
//!
//! @date 01.05.2020
//! @author Dipl.Inform. Thomas Schneider
// -----------------------------------------------------------------------------
//! @brief Example_TYPE-unit
unit Example_TYPE;
//! @addtogroup Example_TYPE-Group
//! @brief Doc for Example_TYPE-Group
//! @{
//! @cond
{$IFDEF DOXYGEN}
{$HPPEMIT '//! @file Example_TYPE.pas'}
{$HPPEMIT '//! @file'}
{$HPPEMIT '#include "doxygen.h"'}
{$ENDIF}
// =============================================================================

interface

// [EXAMPLE_TYPE_1] ------------------------------------------------------------
//! @endcond
//! @DType{TASCIICtrls, Example_TYPE}
//! @brief enumeration of ASCII-ctrlchars
//! @cond
TYPE TASCIICtrls = #$00..#$1F;

// [EXAMPLE_TYPE_1] ------------------------------------------------------------

// -----------------------------------------------------------------------------
//! @endcond
//! @DType{TASCIICtrlSet, Example_TYPE}
//! @brief type definiton: set which can hold all ASCII-ctrlchars
//! @cond
TYPE TASCIICtrlSet = SET OF TASCIICtrls;

// [EXAMPLE_TYPE_2] ------------------------------------------------------------
//! @endcond
//! @DRecordType{TASCIICtrlChar,Example_TYPE}
//! @brief type definiton: Record to describe an ASCII ctrlchar
//!
//! @Dmember{TASCIICtrlChar,name}
//! @brief name of the ASCII-ctrlchar
//!
//! @DRecordField{TASCIICtrlChar,c,Example_TYPE}
//! @brief the ASCII-ctrlchar interpreted as AnsiChar
//!
//! @cond
TYPE TASCIICtrlChar = RECORD
       c:    AnsiChar;    // ASCII Ctrl character
       name: AnsiString;  // name of the Character
     END; // TASCIICtrlChar

// [EXAMPLE_TYPE_2] ------------------------------------------------------------

// -----------------------------------------------------------------------------
//! @endcond
//! @DType{TASCIINames, Example_TYPE}
//! @brief Type definition for an array which holds the names for the ASCII-ctrlchars
//! @cond
TYPE TASCIINames = ARRAY[#$00..#$1F] OF AnsiString;

// [EXAMPLE_TYPE_3] ------------------------------------------------------------
//! @endcond
//! @DEnum{TASCIIEnum, Example_TYPE}
//! @brief Enumeraton of all ASCII-ctrlchars
//! @cond
TYPE TASCIIEnum = (NUL, SOH, STX, ETX,
                   EOT, ENQ, ACK, BEL,
                   BS,  HT,  LF,  VT,
                   FF,  CR,  SO,  SI,
                   DLE, DC1, DC2, DC3,
                   DC4, NAK, SYN, ETB,
                   CAN, EM,  SUB, ESC,
                   FS,  GS,  RS,  US);

// [EXAMPLE_TYPE_3] ------------------------------------------------------------

implementation

end.
//! @endcond
//! @}
// =============================================================================

