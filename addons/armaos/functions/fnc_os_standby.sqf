params ["_computer", "_options"];

if (count _options >= 1) exitWith {["   Command: standby has no options"];};

private _handle = [_computer] spawn AE3_armaos_fnc_computer_addActionStandby;

private _result = ["   Command: standby"];

_result;