// CodeGear C++Builder
// Copyright (c) 1995, 2018 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Example_VAR.pas' rev: 33.00 (Windows)

#ifndef Example_varHPP
#define Example_varHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <Example_TYPE.hpp>

//-- user supplied -----------------------------------------------------------
//! @file Example_VAR.pas
//! @file
#include "doxygen.h"

//-- forward type declarations -----------------------------------------------
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM Example_var__1 : unsigned char { NUL, SOH, STX, ETX, EOT, ENQ, ACK, BEL, BS, HT, LF, VT, FF, CR, SO, SI, DLE, DC1, DC2, DC3, DC4, NAK, SYN, ETB, CAN, EM, SUB, ESC, FS, GS, RS, US };

struct DECLSPEC_DRECORD Example_var__2
{
public:
	char c;
	AnsiString name;
};


//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE TASCIICtrlSet ASCIICtrls;
extern DELPHI_PACKAGE TASCIINames ASCIINames;
extern DELPHI_PACKAGE Example_var__1 ASCII_Enum;
extern DELPHI_PACKAGE TASCIIEnum ASCIIEnum;
extern DELPHI_PACKAGE Example_var__2 ASCII_CtrlChar;
extern DELPHI_PACKAGE int IntVar;
extern DELPHI_PACKAGE TASCIICtrlChar ASCIICtrlChar;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Example_varHPP
