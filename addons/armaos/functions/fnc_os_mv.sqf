/**
 * Moves/renames a given file on a given computer.
 * Returns information about the success of the command.
 *
 * Arguments:
 * 1: Computer <OBJECT>
 * 2: File <[STRING]>
 *
 * Results:
 * None
 */

params ["_computer", "_options"];

private _commandName = "mv";

if (count _options > 2) exitWith { [ _computer, format [localize "STR_AE3_ArmaOS_Exception_CommandHasTooManyOptions", _commandName] ] call AE3_armaos_fnc_shell_stdout; };
if (count _options < 2) exitWith { [ _computer, format [localize "STR_AE3_ArmaOS_Exception_CommandHasTooFewOptions", _commandName] ] call AE3_armaos_fnc_shell_stdout; };

private _pointer = _computer getVariable "AE3_filepointer";
private _filesystem = _computer getVariable "AE3_filesystem";

private _terminal = _computer getVariable "AE3_terminal";
private _username = _terminal get "AE3_terminalLoginUser";

_options params ['_oldPath', '_newPath'];

private _result = [];

try
{
	[_pointer, _filesystem, _oldPath, _newPath, _username] call AE3_filesystem_fnc_mvObj;
	_computer setVariable ["AE3_filesystem", _filesystem, 2];
	
}catch
{
	_result pushBack _exception;
};

[_computer, _result] call AE3_armaos_fnc_shell_stdout;
