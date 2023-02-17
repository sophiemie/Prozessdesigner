// =============================================================================
//! @mainpage DelphiDox-Example
//!
//! Example to demonstrate Doxygen documenting a Delphi project
//!
//! To create Doxygen documentaion:
//! - select Build configuration "Doxygen"
//! - Build project via F9, Ctrl-F9 or Shift-F9 (Project: Compile, Build or Run)
//! - Show docuemntation in your browser by simply execute DDExample.bat or
//!   select index.html in the output directory: ./Doxygen/doc/html/index.html
//!
//! @attention
//! Project/Start (F9) will compile the project but doesn't start it: in this
//! configuration Delphi doesn't create the executable because C++Builder
//! output (.hpp files) is selected!
//!
//! @author Dipl. Inf. Thomas Schneider
//! @copyright Dipl. Inf. Thomas Schneider (c) 2020
//! @date 07.05.2020
//!
//! [Homepage: https://sys-thos.de] (https://sys-thos.de/)
//!
//! [eMail: thomas.schneider@sys-thos.de] (mailto:thomas.schneider@sys-thos.de)
//!
//! [DelphiDox-Documentation] (https://sys-thos.de/DelphiDox/)
// -----------------------------------------------------------------------------
//! dir .
//! brief example project demonstrating the documentation of Delphi sources
//!
//! dir ./Doxygen
//! brief Delphi Doxygen configuration files
//!
//! @dir ./Doxygen/hpp
//! @brief Delphi generated .hpp files for C++-Builder
//! @details These files are only required for docementation purposes.
//!          Doxygen extracts the C++ declarations from there.
//!          These are used to document the Delphi source codes, while the
//!          Doxygen commands (\\fn, \\class etc.) refers to them.
//!
//! @dir ./src
//! @brief Delphi source codes for the Example project
//!
//! @file
//! @brief DelphiDox example / main program
//!
//! @DModuleSourceCode{DDExample.dpr,DDExample}
// -----------------------------------------------------------------------------
//! @cond
// =============================================================================
program DDExample;

uses
  Vcl.Forms,
  frm_Main in 'src\forms\frm_Main.pas' {frmMain},
  Example_CLASS in 'src\Example_CLASS.pas',
  Example_CONST in 'src\Example_CONST.pas',
  Example_TYPE in 'src\Example_TYPE.pas',
  Example_FUNC in 'src\Example_FUNC.pas',
  Example_VAR in 'src\Example_VAR.pas',
  Example_UNIT in 'src\Example_UNIT.pas',
  DDTemplateUnit in 'src\DDTemplateUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
//! @endcond
// =============================================================================

