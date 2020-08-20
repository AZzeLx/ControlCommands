#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <sdkhooks>

#pragma semicolon 1
#pragma newdecls required

#define ACCES ADMFLAG_ROOT

public Plugin myinfo = 
{
	name = "Control Cammands", 
	author = "AZzeL", 
	description = "A simple plugin that controls access to the target", 
	version = "1.0", 
	url = "https://fireon.ro"
};

public void OnPluginStart()
{
	AddCommandListener(C_Command, "sm_kick");
	AddCommandListener(C_Command, "sm_slap");
	AddCommandListener(C_Command, "sm_slay");

} 

public Action C_Command(int client, char []command, int args)
{
	if(client)
	{
		if(GetUserFlagBits(client) & ACCES)
		{

		}
		else 
		{
			char arg1[192], arg2[192];

			GetCmdArg(1, arg1, 192);
			GetCmdArg(1, arg2, 192);

			if (StrEqual(arg1, "@all", true) || 
                            StrEqual(arg1, "@alive", true) || 
                            StrEqual(arg1, "@dead", true) || 
                            StrEqual(arg1, "@ct", true) || 
                            StrEqual(arg1, "@t", true))
			{
				ReplyToCommand(client, "[SM] You do not have access!");
				return Plugin_Stop;
			}
		}
	}
	return Plugin_Continue;
}