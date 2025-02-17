/**
 * Searches for a specific file in the current folder. Outputs results to stadout.
 *
 * Arguments:
 * 1: Computer <OBJECT>
 * 2: Search String <STRING>
 *
 * Results:
 * None
 */

params ["_computer", "_options"];

private _commandName = "find";

if (count _options > 1) exitWith { [ _computer, format [localize "STR_AE3_ArmaOS_Exception_CommandHasTooFewOptions", _commandName] ] call AE3_armaos_fnc_shell_stdout; };
if (count _options < 1) exitWith { [ _computer, format [localize "STR_AE3_ArmaOS_Exception_CommandHasTooManyOptions", _commandName] ] call AE3_armaos_fnc_shell_stdout; };

private _searchString = _options select 0;

private _pointer = _computer getVariable "AE3_filepointer";
private _filesystem = _computer getVariable "AE3_filesystem";

private _current = [_pointer, _filesystem] call AE3_filesystem_fnc_resolvePntr;

private _terminal = _computer getVariable "AE3_terminal";
private _user = _terminal get "AE3_terminalLoginUser";

private _result = [_pointer, _current, _user, _searchString] call AE3_filesystem_fnc_findFilesystemObject;

private _totalResults = _result select 0;
private _missingPermissions = _result select 1;

if (_missingPermissions > 0) then
{
	_totalResults append [format [localize "STR_AE3_ArmaOS_Exception_CantScanFolderMissionPermissions", _missingPermissions]];
};

[_computer, _totalResults] call AE3_armaos_fnc_shell_stdout;