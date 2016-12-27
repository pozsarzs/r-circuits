{ +--------------------------------------------------------------------------+ }
{ | R-circuits v0.4.1 * Resistor circuits                                    | }
{ | Copyright (C) 2011-2016 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | module_17.pas                                                            | }
{ | Module (static, fp unit - v0.3+)                                         | }
{ +--------------------------------------------------------------------------+ }

{
  Copyright (C) 2011-2016 Pozsar Zsolt

  This program is free software: you can redistribute it and/or modify
it under the terms of the European Union Public License version 1.1.

  This program is distributed WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}

unit module_17;
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
  MODULE_ID='r17';                                                  // Module ID

Resourcestring
  MESSAGE01='Delta-Y conversion';
  MESSAGE02='RA|Ω|resistor';
  MESSAGE03='RB|Ω|resistor';
  MESSAGE04='RC|Ω|resistor';
  MESSAGE05='RAB|Ω|resistor';
  MESSAGE06='RAC|Ω|resistor';
  MESSAGE07='RBC|Ω|resistor';
  MESSAGE08='Calculation error, please check values!';

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

// 'main' function
function Calculate: byte; 
var
  r0, ra, rb, rc, rab, rac, rbc: real;
begin
  try
    rab:=ValueDataIn[0]; rac:=ValueDataIn[1]; rbc:=ValueDataIn[2];
    r0:=rab+rac+rbc;
	ra:=rab*rac/r0;
	rb:=rab*rbc/r0;
	rc:=rbc*rac/r0;
    ValueDataOut[0]:=ra; ValueDataOut[1]:=rb; ValueDataOut[2]:=rc;
  except
    ValueDataOut[0]:=0; ValueDataOut[1]:=0; ValueDataOut[2]:=0;
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
  ErrorMessages[0]:=MESSAGE08;
  NameModule:=MESSAGE01;
  NameDataIn[0]:=MESSAGE05;
  NameDataIn[1]:=MESSAGE06;
  NameDataIn[2]:=MESSAGE07;
  NameDataOut[0]:=MESSAGE02;
  NameDataOut[1]:=MESSAGE03;
  NameDataOut[2]:=MESSAGE04
end.
