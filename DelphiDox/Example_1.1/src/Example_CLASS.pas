// =============================================================================
//! @file
//! @brief Example: Documenting CLASSes
//!
//! @date 28.04.2020
//! @author Dipl.Inform. Thomas Schneider
// -----------------------------------------------------------------------------
//! @brief Example_CLASS-unit
unit Example_CLASS;
//! @cond
{$IFDEF DOXYGEN}
{$HPPEMIT '//! @file Example_CLASS.pas'}
{$HPPEMIT '//! @file'}
{$HPPEMIT '#include "doxygen.h"'}
{$ENDIF}
// =============================================================================

interface

TYPE
  // --------------------------------------------------------- [EXAMPLE_CLASS_1]
  //! @endcond
  //! @DClass{TClass1,Example_CLASS}
  //! @brief TClass 1
  //!
  //! Basic class without an ancestor (--> defaults to TObject)
  //!
  //! @cond
  TClass1 = class
  public
    constructor Create();
    destructor Destroy(); override;
  public
    //! @endcond
    //! @var TClass1::Field1
    //! @brief TClass 1 / Field 1
    //! @cond
    Field1: INTEGER;

    //! @endcond
    //! @fn TClass1::Func1
    //! @brief TClass 1 / Func 1
    //! @cond
    FUNCTION Func1(): INTEGER;

    //! @endcond
    //! @fn TClass1::Proc1
    //! @brief TClass 1 / Proc 1
    //! @cond
    PROCEDURE Proc1();

    //! @endcond
    //! @property TClass1::Prop1
    //! @brief property TClass 1 / Prop 1
    //! @cond
    property Prop1: INTEGER read Field1 write Field1; // Prop1
  END; // TClass1
  // --------------------------------------------------------- [EXAMPLE_CLASS_1]

  // ---------------------------------------------------------------------------
  //! @endcond
  //! @DClass{TClass2,Example_CLASS}
  //! @brief TClass 2
  //!
  //! Basic class derived from default class TObject
  //!
  //! @cond
  TClass2 = class(TObject)
    //! ------------------------------------------------- [EXAMPLE_CLASS2_FIELD]
    //! @endcond
    //! @DClassField{TClass2,Field2,Example_CLASS}
    //! @brief TClass 2 / Field 2
    //! @cond
    Field2: INTEGER;
    //! ------------------------------------------------- [EXAMPLE_CLASS2_FIELD]

    //! -------------------------------------------------- [EXAMPLE_CLASS2_FUNC]
    //! @endcond
    //! @DClassFunc{TClass2,Func2,Example_CLASS}
    //! @brief TClass 2 / Func 2
    //! @cond
    FUNCTION Func2(): INTEGER;
    //! -------------------------------------------------- [EXAMPLE_CLASS2_FUNC]

    //! -------------------------------------------------- [EXAMPLE_CLASS2_PROC]
    //! @endcond
    //! @DClassProc{TClass2,Proc2,Example_CLASS}
    //! @brief TClass2 / Proc 2
    //! @cond
    PROCEDURE Proc2();
    //! -------------------------------------------------- [EXAMPLE_CLASS2_PROC]

    //! -------------------------------------------------- [EXAMPLE_CLASS2_PROP]
    //! @endcond
    //! @DClassProp{TClass2,Prop2,Example_CLASS}
    //! @brief property TClass 2 / Prop 2
    //! @cond
    property Prop2: INTEGER read Field2 write Field2; // Prop2
    //! -------------------------------------------------- [EXAMPLE_CLASS2_PROP]
  END; // TClass2

  // ---------------------------------------------------------------------------
  //! @endcond
  //! @DClass{TClass3,Example_CLASS}
  //! @brief TClass 3
  //!
  //! @CClass{TClass3,Example_CLASS}
  //!
  //! Class derived from class TClass2
  //! @cond
  TClass3 = class(TClass2)
    //! ------------------------------------------------- [EXAMPLE_CLASS3_FIELD]
    //! @endcond
    //! @DClassField{TClass3,Field3,Example_CLASS}
    //! @brief TClass 3 / Field 3
    //! @CClassVar{TClass3,Field3,Example_CLASS}
    //! @cond
    Field3: INTEGER;
    //! ------------------------------------------------- [EXAMPLE_CLASS3_FIELD]

    //!  --------------------------------------------------[EXAMPLE_CLASS3_FUNC]
    //! @endcond
    //! @DClassFunc{TClass3,Func3,Example_CLASS}
    //! @par
    //! @DFuncDecl{TClass3.Func3}
    //! @brief TClass 3 / Func 3
    //! @CClassMethod{TClass3,Func3,Example_CLASS}
    //! @cond
    FUNCTION Func3(): INTEGER;
    //! -------------------------------------------------- [EXAMPLE_CLASS3_FUNC]

    //! -------------------------------------------------- [EXAMPLE_CLASS3_PROC]
    //! @endcond
    //! @DClassProc{TClass3,Proc3,Example_CLASS}
    //! @brief TClass 3 / Proc 3
    //! @CClassMethod{TClass3,Proc3,Example_CLASS}
    //! @cond
    PROCEDURE Proc3();
    //! -------------------------------------------------- [EXAMPLE_CLASS3_PROC]

    //! -------------------------------------------------- [EXAMPLE_CLASS3_PROP]
    //! @endcond
    //! @DClassProp{TClass3,Prop3,Example_CLASS}
    //! @brief property TClass 3 / Prop 3
    //! @CClassProperty{TClass3,Prop3,Example_CLASS}
    //! @cond
    property Prop3: INTEGER read Field3 write Field3; // Prop3
    //! -------------------------------------------------- [EXAMPLE_CLASS3_PROP]

  END; // TClass3

  // --------------------------------------------------------- [EXAMPLE_CLASS_4]
  //! @endcond
  //! @Dclass{TClass4}
  //! @brief TClass 4
  //!
  //! Class derived from default class TClass2 \n
  //! Whole class incl. members only C++Builder declaration documented
  //!
  //! @CClass{TClass4,Example_CLASS}
  //! @cond
  TClass4 = class(TClass2)
    //! ------------------------------------------------- [EXAMPLE_CLASS4_FIELD]
    //! @endcond
    //! @Dmember{TClass4,Field4}
    //! @brief TClass 4 / Field 4
    //! @CClassVar{TClass4,Field4,Example_CLASS}
    //! @cond
    Field4: INTEGER;
    //! ------------------------------------------------- [EXAMPLE_CLASS4_FIELD]

    //! -------------------------------------------------- [EXAMPLE_CLASS4_FUNC]
    //! @endcond
    //! @Dmethod{TClass4,Func4}
    //! @brief TClass 4 / Func 4
    //!
    //! @CClassMethod{TClass4,Func4,Example_CLASS}
    //! @cond
    FUNCTION Func4(): INTEGER;
    //! -------------------------------------------------- [EXAMPLE_CLASS4_FUNC]

    //! -------------------------------------------------- [EXAMPLE_CLASS4_PROC]
    //! @endcond
    //! @Dmethod{TClass4,Proc4}
    //! @brief TClass 4 / Proc 4
    //!
    //! @CClassMethod{TClass4,Proc4,Example_CLASS}
    //! @cond
    PROCEDURE Proc4();
    //! -------------------------------------------------- [EXAMPLE_CLASS4_PROC]

    //! -------------------------------------------------- [EXAMPLE_CLASS4_PROP]
    //! @endcond
    //! @Dproperty{TClass4,Prop4}
    //! @brief property TClass 4 / Prop 4
    //!
    //! @CClassProperty{TClass4,Prop4,Example_CLASS}
    //! @cond
    property Prop4: INTEGER read Field4 write Field4; // Prop4
    //! -------------------------------------------------- [EXAMPLE_CLASS4_PROP]

  private
    destructor Dtor(void: TClass4 = NIL); virtual;
  END; // TClass4

  // --------------------------------------------------------- [EXAMPLE_CLASS_4]

implementation

constructor TClass1.Create(); BEGIN inherited; END;
destructor TClass1.Destroy(); BEGIN inherited; END;
FUNCTION TClass1.Func1(): INTEGER; BEGIN Result := 0; END;
PROCEDURE TClass1.Proc1(); BEGIN END;

FUNCTION TClass2.Func2(): INTEGER; BEGIN Result := 0; END;
PROCEDURE TClass2.Proc2(); BEGIN END;

FUNCTION TClass3.Func3(): INTEGER;
BEGIN Result := 0; END;

PROCEDURE TClass3.Proc3();
BEGIN END;

FUNCTION TClass4.Func4(): INTEGER; BEGIN Result := 0; END;
PROCEDURE TClass4.Proc4(); BEGIN END;

destructor TClass4.Dtor(void: TClass4);
BEGIN Destroy(); END;

end.
//! @endcond
// =============================================================================
