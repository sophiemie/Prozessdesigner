// CodeGear C++Builder
// Copyright (c) 1995, 2018 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Example_TYPE.pas' rev: 33.00 (Windows)

#ifndef Example_typeHPP
#define Example_typeHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>

//-- user supplied -----------------------------------------------------------
//! @file Example_TYPE.pas
//! @file
#include "doxygen.h"

//-- forward type declarations -----------------------------------------------
struct TASCIICtrlChar;
//-- type declarations -------------------------------------------------------
typedef WideChar TASCIICtrls;

typedef Set<char, _DELPHI_SET_CHAR(0), _DELPHI_SET_CHAR(255)> TASCIICtrlSet;

struct DECLSPEC_DRECORD TASCIICtrlChar
{
public:
	char c;
	AnsiString name;
};


typedef System::StaticArray<AnsiString, 32> TASCIINames;

enum DECLSPEC_DENUM TASCIIEnum : unsigned char { NUL, SOH, STX, ETX, EOT, ENQ, ACK, BEL, BS, HT, LF, VT, FF, CR, SO, SI, DLE, DC1, DC2, DC3, DC4, NAK, SYN, ETB, CAN, EM, SUB, ESC, FS, GS, RS, US };

//-- var, const, procedure ---------------------------------------------------
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Example_typeHPP
