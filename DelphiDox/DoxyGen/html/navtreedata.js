/*
 @licstart  The following is the entire license notice for the JavaScript code in this file.

 The MIT License (MIT)

 Copyright (C) 1997-2020 by Dimitri van Heesch

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software
 and associated documentation files (the "Software"), to deal in the Software without restriction,
 including without limitation the rights to use, copy, modify, merge, publish, distribute,
 sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or
 substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
 BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 @licend  The above is the entire license notice for the JavaScript code in this file
*/
var NAVTREE =
[
  [ "DelphiDox - Documentation", "index.html", [
    [ "DelphiDox", "index.html", [
      [ "Quickstart", "index.html#Quickstart", null ]
    ] ],
    [ "Overview", "_overview.html", [
      [ "Preface", "_overview.html#Preface", null ],
      [ "Introduction", "_overview.html#Introduction", null ],
      [ "A closer look", "_overview.html#CloserLook", [
        [ "TExample1", "_overview.html#TEXAMPLE1", null ],
        [ "TExample2", "_overview.html#TEXAMPLE2", null ],
        [ "TExample3", "_overview.html#TEXAMPLE3", null ],
        [ "A note on Comments", "_overview.html#CommentNotes", null ]
      ] ]
    ] ],
    [ "Prerequisites", "_prerequisites.html", [
      [ "Preparing the Delphi Project", "_prerequisites.html#PrepDelphiProj", [
        [ "Creating a Doxygen configuration", "_prerequisites.html#CreateDelphiCfg", null ],
        [ "Setting configuration options", "_prerequisites.html#SetDelphiCfgOpt", [
          [ "Open build configuration", "_prerequisites.html#CreateBuildCfg", null ],
          [ "Set Delphi output directories", "_prerequisites.html#CfgDelphiDirs", null ],
          [ "Configure C++ (.hpp) header generation", "_prerequisites.html#CfgC_CppDirs", null ],
          [ "Automatically generate Doxygen documentation", "_prerequisites.html#CfgPostBuild", null ]
        ] ]
      ] ],
      [ "Preparing Delphi modules", "_prerequisites.html#PrepDelphiModules", [
        [ "Excluding Delphi code from Doxygen parsing", "_prerequisites.html#ExcludeDelphiCode", null ],
        [ "Treat Delphi unit as a Doxygen module", "_prerequisites.html#UnitAsModule", null ],
        [ "Adding Doxygen stuff to Delphi generated .hpp file", "_prerequisites.html#HppEmit", null ],
        [ "Treat Delphi unit as a Doxygen module", "_prerequisites.html#UnitAsStruct", null ],
        [ "Delphi unit structure: Summary", "_prerequisites.html#PrepDelphiSummary", null ]
      ] ],
      [ "Configuring Doxygen", "_prerequisites.html#ConfigureDoxygen", [
        [ "Required", "_prerequisites.html#CfgDoxygenRequired", null ],
        [ "Project related configuration", "_prerequisites.html#CfgProjectRelated", null ],
        [ "Recommended", "_prerequisites.html#CfgDoxygenRecommended", null ],
        [ "Useful", "_prerequisites.html#CfgDoxygenUseful", null ]
      ] ]
    ] ],
    [ "Documenting Delphi source code", "_document_delphi.html", [
      [ "Special ALIASES", "_document_delphi.html#DelphiDoxAlias", null ],
      [ "C/C++ like documentation", "_document_delphi.html#C_CPP_Doc", [
        [ "const Declarations", "_document_delphi.html#D_CONST", null ],
        [ "unit Statement", "_document_delphi.html#D_UNIT", null ],
        [ "Embedding C/C++ statements", "_document_delphi.html#Embed_C_CPP", null ]
      ] ],
      [ "Special ALIASES for Delphi", "_document_delphi.html#DelphiCmds", [
        [ "Main Commands", "_document_delphi.html#DMainCmds", [
          [ "\\DType{<typename>,<modulename>}", "_document_delphi.html#DType", null ],
          [ "\\DDef{<macro-name>,<modulename>}", "_document_delphi.html#DDef", null ],
          [ "\\DVar{<variablename>,<modulename>}", "_document_delphi.html#DVar", null ],
          [ "\\DConst{<constname>,<modulename>}", "_document_delphi.html#DConst", null ],
          [ "\\DFunc{<functionname>,<modulename>}", "_document_delphi.html#DFunc", null ],
          [ "\\DProc{<procedurename>,<modulename>}", "_document_delphi.html#DProc", null ],
          [ "\\DEnumType{<enum-typename>,<modulename>}", "_document_delphi.html#DEnumType", null ],
          [ "\\DEnumVar{<enum-varname>,<modulename>}", "_document_delphi.html#DEnumVar", null ],
          [ "\\DEnum{<enum-name>,<modulename>}", "_document_delphi.html#DEnum", null ],
          [ "\\DRecordType{<record_typename>,<modulename>}", "_document_delphi.html#DRecordType", null ],
          [ "\\DRecordVar{<record_varname>,<modulename>}", "_document_delphi.html#DRecordVar", null ],
          [ "\\DRecordField{<record_fieldname>,<modulename>}", "_document_delphi.html#DRecordField", null ],
          [ "\\DRecord{<record_typename>,<modulename>}", "_document_delphi.html#DRecord", null ],
          [ "\\DClassType{<classname>,<modulename>}", "_document_delphi.html#DClassType", null ],
          [ "\\DClass{<classname>,<modulename>}", "_document_delphi.html#DClass", null ],
          [ "\\DClassField{<classname>,<class_variablename>,<modulename>}", "_document_delphi.html#DClassField", null ],
          [ "\\DClassProp{<classname>,<class_propertyname>,<modulename>}", "_document_delphi.html#DClassProp", null ],
          [ "\\DClassFunc{<classname>,<function_methodname>,<modulename>}", "_document_delphi.html#DClassFunc", null ],
          [ "\\DClassProc{<classname>,<procedure_methodname>,<modulename>)}", "_document_delphi.html#DClassProc", null ],
          [ "\\DClassCtor{<classname>,<constructor_methodname>,<modulename>)}", "_document_delphi.html#DClassCtor", null ],
          [ "\\DClassDtor{<classname>,<destructor_methodname>,<modulename>)}", "_document_delphi.html#DClassDtor", null ],
          [ "\\DUnionType{<union_typename>,<modulename>}", "_document_delphi.html#DUnionType", null ],
          [ "\\DUnionVar{<union_varname>,<modulename>}", "_document_delphi.html#DUnionVar", null ],
          [ "\\DUnionField{<union_fieldname>,<modulename>}", "_document_delphi.html#DUnionField", null ],
          [ "\\DUnion{<union-name>,<modulename>}", "_document_delphi.html#DUnion", null ]
        ] ],
        [ "Low level Commands", "_document_delphi.html#DLowLevelCmds", [
          [ "\\Snippet{(first line pattern),(last line pattern)}", "_document_delphi.html#Snippet", null ],
          [ "\\SkipSnippet{(first line pattern),(last line pattern)}", "_document_delphi.html#SkipSnippet", null ],
          [ "\\SkipArg{[<compoundname>,]<entityname>}", "_document_delphi.html#SkipArg", null ],
          [ "\\InclPas{<modulename>}", "_document_delphi.html#InclPas", null ],
          [ "\\DHeader{[<anchor>]}", "_document_delphi.html#DHeader", null ],
          [ "\\DInclDecl{<modulename>,[<compoundname>,]<entityname>}", "_document_delphi.html#DInclDecl", null ],
          [ "\\DDeclHdr{<modulename>,[<compoundname>,]<entityname>}", "_document_delphi.html#DDeclHdr", null ],
          [ "\\Dfn{<functionname>,<modulename>}", "_document_delphi.html#Dfn", null ],
          [ "\\Dstruct{<structname>}", "_document_delphi.html#Dstruct", null ],
          [ "\\Dunion{<unionname>}", "_document_delphi.html#Dunion", null ],
          [ "\\Dclass{<classname>}", "_document_delphi.html#Dclass", null ],
          [ "\\Dmember{<compoundname>,<variablename>}", "_document_delphi.html#Dmember", null ],
          [ "\\Dmethod{<compoundname>,<functionname>}", "_document_delphi.html#Dmethod", null ],
          [ "\\Dproperty{<compoundname>,<propertyname>}", "_document_delphi.html#Dproperty", null ],
          [ "\\DVarDecl{<entityname>}", "_document_delphi.html#DVarDecl", null ],
          [ "\\DTypeDecl{<entityname>}", "_document_delphi.html#DTypeDecl", null ],
          [ "\\DFuncDecl{<entityname>}", "_document_delphi.html#DFuncDecl", null ],
          [ "\\DProcDecl{<entityname>}", "_document_delphi.html#DProcDecl", null ],
          [ "\\DCompTypeDecl{<entityname>}", "_document_delphi.html#DCompTypeDecl", null ],
          [ "\\DCompVarDecl{<entityname>}", "_document_delphi.html#DCompVarDecl", null ],
          [ "\\DEnumTypeDecl{<entityname>}", "_document_delphi.html#DEnumTypeDecl", null ],
          [ "\\DEnumVarDecl{<entityname>}", "_document_delphi.html#DEnumVarDecl", null ],
          [ "\\DConstDecl{<entityname>}", "_document_delphi.html#DConstDecl", null ],
          [ "\\DDefDecl{<entityname>}", "_document_delphi.html#DDefDecl", null ],
          [ "Inserting Delphi declarations: Summary", "_document_delphi.html#DEntityDecl", null ]
        ] ]
      ] ],
      [ "Special ALIASES to include C++Builder Code", "_document_delphi.html#CppBuilderCmds", [
        [ "Main Commands", "_document_delphi.html#CMainCmds", [
          [ "\\CClass{<classname>,<modulename>}", "_document_delphi.html#CClass", null ],
          [ "\\CClassMethod{<classname>,<function_methodname>,<modulename>}", "_document_delphi.html#CClassMethod", null ],
          [ "\\CClassVar{<classname>,<class_variablename>,<modulename>}", "_document_delphi.html#CClassVar", null ],
          [ "\\CClassProperty{<classname>,<class_propertyname>,<modulename>}", "_document_delphi.html#CClassProperty", null ],
          [ "\\CStruct{<struct_typename>,<modulename>}", "_document_delphi.html#CStruct", null ],
          [ "\\CEnum{<enum-typename>,<modulename>}", "_document_delphi.html#CEnum", null ],
          [ "\\CFunc{<functionname>,<modulename>}", "_document_delphi.html#CFunc", null ],
          [ "\\CVar{[<typename>,]<variablename>,<modulename>}", "_document_delphi.html#CVar", null ],
          [ "\\CType{<typename>,<modulename>}", "_document_delphi.html#CType", null ],
          [ "\\CDef{<macro-name>,<modulename>}", "_document_delphi.html#CDef", null ]
        ] ],
        [ "Low level commands", "_document_delphi.html#CLowLevelCmds", [
          [ "\\InclHpp{<modulename>}", "_document_delphi.html#InclHpp", null ],
          [ "\\CHeader{[<anchorname>]}", "_document_delphi.html#CHeader", null ],
          [ "\\CDeclHdr{<modulename>,<anchorname>}", "_document_delphi.html#CDeclHdr", null ],
          [ "\\CClassDecl{<classname>}", "_document_delphi.html#CClassDecl", null ],
          [ "\\CClassMethodDecl{<methodname>}", "_document_delphi.html#CClassMethodDecl", null ],
          [ "\\CClassVarDecl{<varname>}", "_document_delphi.html#CClassVarDecl", null ],
          [ "CClassPropertyDecl", "_document_delphi.html#CClassPropertyDecl", null ],
          [ "\\CStructDecl{<structname>}", "_document_delphi.html#CStructDecl", null ],
          [ "\\CEnumDecl{<enumname>}", "_document_delphi.html#CEnumDecl", null ],
          [ "\\CFuncDecl{<functionname>}", "_document_delphi.html#CFuncDecl", null ],
          [ "\\CVarDecl{[<typename>,]<variablename>}", "_document_delphi.html#CVarDecl", null ],
          [ "\\CTypeDecl{<typename>}", "_document_delphi.html#CTypeDecl", null ],
          [ "\\CDefDecl{<macroname>}", "_document_delphi.html#CDefDecl", null ]
        ] ]
      ] ]
    ] ]
  ] ]
];

var NAVTREEINDEX =
[
"_document_delphi.html"
];

var SYNCONMSG = 'click to disable panel synchronisation';
var SYNCOFFMSG = 'click to enable panel synchronisation';