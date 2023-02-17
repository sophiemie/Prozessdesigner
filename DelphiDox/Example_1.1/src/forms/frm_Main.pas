// =============================================================================
//! @file
//! @brief frm_Main
//!
//! @date 28.04.2020
//! @author Dipl.Inf. Thomas Schneider
// -----------------------------------------------------------------------------
//! typedef'd unit @ref Frm_Main :
unit frm_Main;
//! @addtogroup Frm_Main
//! @brief Doc for frm_Main group
//! @{
//! @cond
{$IFDEF DOXYGEN}
{$HPPEMIT '//! @file frm_Main.pas'}
{$HPPEMIT '//! @file'}
{$HPPEMIT '#include "doxygen.h"'}
{$ENDIF}
// =============================================================================

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmMain = class;
  //! @endcond
  //! @DForm{Main}
  //! @brief Mainform
  //!
  //! @CForm{Main}
  //!
  //! @cond
  TfrmMain = class(TForm)
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }

    //! @endcond
    //! @DFormField{Main,Var1}
    //! @brief Var1
    //! @CFormVar{Main,Var1}
    //! @cond
    Var1: INTEGER;

    //! @endcond
    //! @DFormFunc{Main,Func1}
    //! @brief Func1
    //! @CFormMethod{Main,Func1}
    //! @cond
    FUNCTION Func1(): INTEGER;

    //! @endcond
    //! @DFormProp{Main,TestA}
    //! @brief property TestA
    //! @CFormProperty{Main,TestA}
    //! @cond
    property TestA: INTEGER read Func1; // TestA

    property TestB: INTEGER read Var1 write Var1;
  private
    destructor Dtor(void: TfrmMain); virtual;
  end; // TfrmMain

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

destructor TfrmMain.Dtor(void: TfrmMain);
BEGIN
  Destroy();
END;

FUNCTION TfrmMain.Func1(): INTEGER;
BEGIN
END;

end.
//! @endcond
//! @}
// =============================================================================

