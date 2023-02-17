// =============================================================================
//! @file
//! @brief Example: Documenting CONSTs
//!
//! @date 01.05.2020
//! @author Dipl.Inf. Thomas Schneider
// -----------------------------------------------------------------------------
//! @brief Example_CONST-unit
unit Example_CONST;
//! @addtogroup Example_CONST-Group
//! @brief Example: Documenting CONSTs
//!
//! Relates to only plain Delphi CONSTs; for typed CONSTs refer to
//! @ref Example_VAR-Group.
//!
//! "CONST" may notated once before a Delphi CONST block or just before a const
//! value, s. [source code example](../../../src/Example_CONST.pas).
//!
//! @{
//! @cond
{$IFDEF DOXYGEN}
{$HPPEMIT '//! @file Example_CONST.pas'}
{$HPPEMIT '//! @file'}
{$HPPEMIT '#include "doxygen.h"'}
{$ENDIF}
// =============================================================================

interface

// -----------------------------------------------------------------------------
// [EXAMPLE_CONST]
//! @endcond
CONST
//! @brief CONSTs may be documented directly in both ways:
//!
//! number of ASCII-ctrlchars: Comment before... \n
//!
      ASCIICtrlCnt = 32; //!< ...and after the statement

      ASCIICharBitCnt     = 8;                            //!< No of Bits for ASCII chars
      ASCIICharsCnt       = 1 shl ASCIICharBitCnt;        //!< whole number of ASCII chars
CONST ASCIICharsPrintable = ASCIICharsCnt - ASCIICtrlCnt; //!< number of printable ASCII chars
//! @cond
// [EXAMPLE_CONST]

// -----------------------------------------------------------------------------
// [EXAMPLE_CONST_GROUP]
//! @endcond
CONST
//! @Name{ASCII_Codes,ASCII-Konstanten}
//! ASCII-Ctrl-Codes, documented as member group
//! @{
      NUL = #$00;               //!< ^\@:
      SOH = #$01;               //!< ^A: Start of Header
      STX = #$02;               //!< ^B: Start of Text
      ETX = #$03;               //!< ^C: End of Text

      EOT = #$04;               //!< ^D: End of transmission
      ENQ = #$05;               //!< ^E: Enquiry
      ACK = #$06;               //!< ^F: Acknowledge
      BEL = #$07;               //!< ^G: Bell

      BS  = #$08;               //!< ^H: Backspace
      HT  = #$09;  TAB = #$09;  //!< ^I: Horizontal Tab
      LF  = #$0A;               //!< ^J: Line feed
      VT  = #$0B;               //!< ^K: Vertical Tab

      FF  = #$0C;               //!< ^L: Form feed
      CR  = #$0D;  RET = #$0D;  //!< ^M: Carriage return
      SO  = #$0E;               //!< ^N: Shift out
      SI  = #$0F;               //!< ^O: Shift in

      DLE = #$10;               //!< ^P: Data link esacpe
      DC1 = #$11;               //!< ^Q:
      DC2 = #$12;               //!< ^R:
      DC3 = #$13;               //!< ^S:

      DC4 = #$14;               //!< ^T:
      NAK = #$15;               //!< ^U: Negative acknowledge
      SYN = #$16;               //!< ^V: Synchronous idle
      ETB = #$17;  XON = #$17;  //!< ^W: End of transmission block

      CAN = #$18;               //!< ^X: Cancel
      EM  = #$19;  XOFF = #$19; //!< ^Y: End of medium
      SUB = #$1A;               //!< ^Z: Substitute
      ESC = #$1B;               //!< ^[: Escape

      FS  = #$1C;               //!< ^\\: File separator
      GS  = #$1D;               //!< ^]: Group separator
      RS  = #$1E;               //!< ^^: Record separator
      US  = #$1F;               //!< ^_: Unit separator

// -----------------------------------------------------------------------------
//! @}

//! @cond
// [EXAMPLE_CONST_GROUP]
// -----------------------------------------------------------------------------

implementation

end.
//! @endcond
//! @}
// =============================================================================

