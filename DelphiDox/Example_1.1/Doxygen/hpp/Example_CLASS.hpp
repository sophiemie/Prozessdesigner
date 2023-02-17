// CodeGear C++Builder
// Copyright (c) 1995, 2018 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Example_CLASS.pas' rev: 33.00 (Windows)

#ifndef Example_classHPP
#define Example_classHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>

//-- user supplied -----------------------------------------------------------
//! @file Example_CLASS.pas
//! @file
#include "doxygen.h"

//-- forward type declarations -----------------------------------------------
class DELPHICLASS TClass1;
class DELPHICLASS TClass2;
class DELPHICLASS TClass3;
class DELPHICLASS TClass4;
//-- type declarations -------------------------------------------------------
class PASCALIMPLEMENTATION TClass1 : public TObject
{
	typedef TObject inherited;
	
public:
	__fastcall TClass1();
	__fastcall virtual ~TClass1();
	int Field1;
	int __fastcall Func1();
	void __fastcall Proc1();
	__property int Prop1 = {read=Field1, write=Field1, nodefault};
};


class PASCALIMPLEMENTATION TClass2 : public TObject
{
	typedef TObject inherited;
	
public:
	int Field2;
	int __fastcall Func2();
	void __fastcall Proc2();
	__property int Prop2 = {read=Field2, write=Field2, nodefault};
public:
	/* TObject.Create */ inline __fastcall TClass2() : TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TClass2() { }
	
};


class PASCALIMPLEMENTATION TClass3 : public TClass2
{
	typedef TClass2 inherited;
	
public:
	int Field3;
	int __fastcall Func3();
	void __fastcall Proc3();
	__property int Prop3 = {read=Field3, write=Field3, nodefault};
public:
	/* TObject.Create */ inline __fastcall TClass3() : TClass2() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TClass3() { }
	
};


class PASCALIMPLEMENTATION TClass4 : public TClass2
{
	typedef TClass2 inherited;
	
public:
	int Field4;
	int __fastcall Func4();
	void __fastcall Proc4();
	__property int Prop4 = {read=Field4, write=Field4, nodefault};
	
private:
	__fastcall virtual ~TClass4(TClass4* Void = (TClass4*)(0x0));
public:
	/* TObject.Create */ inline __fastcall TClass4() : TClass2() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TClass4() { }
	
};


//-- var, const, procedure ---------------------------------------------------
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Example_classHPP
