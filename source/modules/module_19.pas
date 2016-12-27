{ +--------------------------------------------------------------------------+ }
{ | R-circuits v0.4.1 * Resistor circuits                                    | }
{ | Copyright (C) 2011-2016 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | module_19.pas                                                            | }
{ | Module (static, fp unit - v0.3+)                                         | }
{ +--------------------------------------------------------------------------+ }

{
  Copyright (C) 2011-2016 Pozsar Zsolt

  This program is free software: you can redistribute it and/or modify
it under the terms of the European Union Public License version 1.1.

  This program is distributed WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}

unit module_19;
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
  MODULE_ID='r19';                                                  // Module ID

Resourcestring
  MESSAGE01='L-section impedance converter';
  MESSAGE02='Z1|Ω|impedance';
  MESSAGE03='Z2|Ω|impedance';
  MESSAGE04='a|dB|damp';
  MESSAGE05='R1|Ω|resistor';
  MESSAGE06='R2|Ω|resistor';
  MESSAGE07='Calculation error, please check values!';

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

{$I module_commonproc.inc}

// 'main' function
function Calculate: byte; 
var
  z1, z2, a, r1, r2: real;
begin
  try
    z1:=ValueDataIn[0]; z2:=ValueDataIn[1];
    if z1<z2 then
	begin
	  ErrorCode:=1;
	  exit;
	end;
    r2:=z2/(sqrt(1-z2/z1));
	r1:=z1*z2/r2;
    a:=-20*log((2*sqrt(z1/z1))/(1+(r1+z1)*(r2+z2)/(r2*z2)));
    ValueDataOut[0]:=a; ValueDataOut[1]:=r1; ValueDataOut[2]:=r2;
  except
    ValueDataOut[0]:=0; ValueDataOut[1]:=0; ValueDataOut[2]:=0;
    ErrorCode:=1;
    Result:=ErrorCode;
    exit;
  end;
  ErrorCode:=0;
  Result:=ErrorCode;
end;

initialization
  ErrorCode:=0;
  HowToSetLinkActive:=false;
  ErrorMessages[0]:=MESSAGE07;
  NameModule:=MESSAGE01;
  NameDataIn[0]:=MESSAGE02;
  NameDataIn[1]:=MESSAGE03;
  NameDataOut[0]:=MESSAGE04;
  NameDataOut[1]:=MESSAGE05;
  NameDataOut[2]:=MESSAGE06;
end.
