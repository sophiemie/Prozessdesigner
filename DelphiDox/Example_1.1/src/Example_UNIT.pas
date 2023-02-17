// =============================================================================
//! @file
//! @brief Example: Documenting CLASSes
//!
//! @date 07.05.2020
//! @author Dipl.Inform. Thomas Schneider
// -----------------------------------------------------------------------------
//! @brief Example_UNIT-unit
unit Example_UNIT;
//! @cond
//{$IFDEF DOXYGEN}
{$HPPEMIT '//! @file'}
//{$ENDIF}
// =============================================================================

interface

TYPE
     //! @endcond ---------------------------------------------------[EXAMPLE_1]
     //! @class TExample1
     //! @brief Sample class1
     //!
     //! @details
     //! @par Delphi Declaration - included with \\snippet command:
     //! @snippet Example_UNIT.pas TExample1
     //! @cond
     // [TExample1]
     TExample1 = class(TObject)
       Var1: INTEGER;
       FUNCTION Func1(): INTEGER;
       PROCEDURE Proc1();
     END;
     // [TExample1]
     // -------------------------------------------------------------[EXAMPLE_1]

     // -------------------------------------------------------------[EXAMPLE_2]
     //! @endcond
     //! @class TExample2
     //! @brief Sample class2
     //!
     //! @details
     //! @par Delphi Declaration - included with special alias \\DCompTypeDecl:
     //! @dontinclude Example_UNIT.pas
     //! @DCompTypeDecl{TExample2}
     //! @cond
     TExample2 = class(TObject)
       Var2: INTEGER;
       FUNCTION Func2(): INTEGER;
       PROCEDURE Proc2();
     END; // TExample2
     // -------------------------------------------------------------[EXAMPLE_2]

     // -------------------------------------------------------------[EXAMPLE_3]
     //! @endcond
     //! @DClass{TExample3,Example_UNIT}
     //! @brief Sample class3
     //! <b>Delphi code included with special command \\DClass</b>
     //! @cond
     TExample3 = class(TExample2)  //! This Doxygen comment doesn't appear anywehre!
       Var3: INTEGER;              // an integer variable
       FUNCTION Func3(): INTEGER;  // a function declaration
       PROCEDURE Proc3();          // a procedure declaration
     END; // TExample3
     // -------------------------------------------------------------[EXAMPLE_3]

implementation

FUNCTION TExample1.Func1(): INTEGER; BEGIN Result := 0; END;
PROCEDURE TExample1.Proc1(); BEGIN END;

FUNCTION TExample2.Func2(): INTEGER; BEGIN Result := 0; END;
PROCEDURE TExample2.Proc2(); BEGIN END;

FUNCTION TExample3.Func3(): INTEGER; BEGIN Result := 0; END;
PROCEDURE TExample3.Proc3(); BEGIN END;

end.
//! @endcond

