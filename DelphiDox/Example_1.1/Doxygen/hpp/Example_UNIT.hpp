// CodeGear C++Builder
// Copyright (c) 1995, 2018 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Example_UNIT.pas' rev: 33.00 (Windows)

#ifndef Example_unitHPP
#define Example_unitHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>

//-- user supplied -----------------------------------------------------------
//! @file

//-- forward type declarations -----------------------------------------------
class DELPHICLASS TExample1;
class DELPHICLASS TExample2;
class DELPHICLASS TExample3;
//-- type declarations -------------------------------------------------------
class PASCALIMPLEMENTATION TExample1 : public TObject
{
	typedef TObject inherited;
	
public:
	int Var1;
	int __fastcall Func1();
	void __fastcall Proc1();
public:
	/* TObject.Create */ inline __fastcall TExample1() : TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TExample1() { }
	
};


class PASCALIMPLEMENTATION TExample2 : public TObject
{
	typedef TObject inherited;
	
public:
	int Var2;
	int __fastcall Func2();
	void __fastcall Proc2();
public:
	/* TObject.Create */ inline __fastcall TExample2() : TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TExample2() { }
	
};


class PASCALIMPLEMENTATION TExample3 : public TExample2
{
	typedef TExample2 inherited;
	
public:
	int Var3;
	int __fastcall Func3();
	void __fastcall Proc3();
public:
	/* TObject.Create */ inline __fastcall TExample3() : TExample2() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TExample3() { }
	
};


//-- var, const, procedure ---------------------------------------------------
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Example_unitHPP
