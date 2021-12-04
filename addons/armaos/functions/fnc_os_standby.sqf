params ["_options", "_consoleInput"];

_computer = _consoleInput getVariable "computer";

_result = [];

_optionsCount = count _options;

scopeName "main";

switch (true) do
{
	case (_optionsCount >= 1):
	{
		//hint "Case 1";
		
		_result = ["   Command: standby has no options"];
		_result breakOut "main";
	};
	case (_optionsCount == 0):
	{
		//hint "Case 2";

		_handle = [_computer, false] spawn AE3_armaos_fnc_standbyComputerAction;

		_result = ["   Command: standby "];
	};
};

_result;