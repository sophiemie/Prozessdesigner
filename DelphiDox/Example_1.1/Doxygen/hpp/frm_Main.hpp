// CodeGear C++Builder
// Copyright (c) 1995, 2018 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frm_Main.pas' rev: 33.00 (Windows)

#ifndef Frm_mainHPP
#define Frm_mainHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <Winapi.Windows.hpp>
#include <Winapi.Messages.hpp>
#include <System.SysUtils.hpp>
#include <System.Variants.hpp>
#include <System.Classes.hpp>
#include <Vcl.Graphics.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Dialogs.hpp>

//-- user supplied -----------------------------------------------------------
//! @file frm_Main.pas
//! @file
#include "doxygen.h"

//-- forward type declarations -----------------------------------------------
class DELPHICLASS TfrmMain;
//-- type declarations -------------------------------------------------------
class PASCALIMPLEMENTATION TfrmMain : public TForm
{
	typedef TForm inherited;
	
public:
	int Var1;
	int __fastcall Func1();
	__property int TestA = {read=Func1, nodefault};
	__property int TestB = {read=Var1, write=Var1, nodefault};
	
private:
	__fastcall virtual ~TfrmMain(TfrmMain* Void);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfrmMain(TComponent* AOwner) : TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmMain(TComponent* AOwner, int Dummy) : TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmMain() { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrmMain(HWND ParentWindow) : TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE TfrmMain* frmMain;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Frm_mainHPP
