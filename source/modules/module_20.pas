{ +--------------------------------------------------------------------------+ }
{ | R-circuits v0.4.1 * Resistor circuits                                    | }
{ | Copyright (C) 2011-2016 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | module_20.pas                                                            | }
{ | Module (static, fp unit - v0.3+)                                         | }
{ +--------------------------------------------------------------------------+ }

{
  Copyright (C) 2011-2016 Pozsar Zsolt

  This program is free software: you can redistribute it and/or modify
it under the terms of the European Union Public License version 1.1.

  This program is distributed WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}

unit module_20;
{$MODE OBJFPC}{$H+}
interface
var
  NameModule: string;                                          // Name of module
  ValueActiveElements: array[0..15] of real;    // Parameters of active elements
  ValueDataIn: array[0..15] of real;                           // Initial values
  ValueDataOut: array[0..15] of real;                           // Result values
  NameActiveElements: array[0..15] of string;           // Description of values
  NameDataIn: array[0..15] of string;                   // Description of values
  NameDataOut: array[0..15] of string;                  // Description of values
  ErrorCode: byte;                                          // Actual error code
  ErrorMessages: array[0..15] of string;                       // Error messages
  HowToSetLinkActive: boolean;            //Enable/disable "How to set it?" link
const
  MODULE_ID='r20';                                                  // Module ID

Resourcestring
  MESSAGE01='Shunt resistor from Cu wire';
  MESSAGE02='Ir|mA|input current';
  MESSAGE03='R|Ω|resistor';
  MESSAGE04='d|mm|diameter of wire';
  MESSAGE05='l|m|length of wire';
  MESSAGE06='Calculation error, please check values!';

function Calculate: byte;
function GetDataOut(num: byte): real;
function GetErrorCode: byte;
function GetErrorMessage(num: byte): string;
function GetHowToSetLinkActive: boolean;
function GetID: string;
function GetNameActiveElements(num: byte): string;
function GetNameDataIn(num: byte): string;
function GetNameDataOut(num: byte): string;
function GetName: string;
procedure SetActiveElements(num: byte; value: real);
procedure SetDataIn(num: byte; value: real);

Implementation

function Calculate: byte; 
var
  ir, r, d, l: real;
begin
  try
    ir:=ValueDataIn[0]; r:=ValueDataIn[1];
    ir:=ir/1000;
	d:=2*sqrt(ir/(5*pi));
    l:=r/(0.0175/(sqr(d/2)*pi));
    ValueDataOut[0]:=d; ValueDataOut[1]:=l;
  except
    ValueDataOut[0]:=0; ValueDataOut[1]:=0;
    ErrorCode:=1;
    Result:=ErrorCode;
    exit;
  end;
  ErrorCode:=0;
  Result:=ErrorCode;
end;

{$I module_commonproc.inc}

initialization
  ErrorCode:=0;
  HowToSetLinkActive:=false;
  ErrorMessages[0]:=MESSAGE06;
  NameModule:=MESSAGE01;
  NameDataIn[0]:=MESSAGE02;
  NameDataIn[1]:=MESSAGE03;
  NameDataOut[0]:=MESSAGE04;
  NameDataOut[1]:=MESSAGE05;
end.
