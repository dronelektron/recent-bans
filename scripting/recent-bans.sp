#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

#include "rb/bans-list"
#include "rb/menu"
#include "rb/message"

#include "modules/bans-list.sp"
#include "modules/console-command.sp"
#include "modules/menu.sp"
#include "modules/message.sp"
#include "modules/steam-id-list.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Recent bans",
    author = "Dron-elektron",
    description = "Allows you to view recent bans and remove them if necessary",
    version = "0.1.1",
    url = "https://github.com/dronelektron/recent-bans"
};

public void OnPluginStart() {
    BansList_Create();
    Command_Create();
    LoadTranslations("recent-bans.phrases");
}

public void OnPluginEnd() {
    BansList_Destroy();
}

public void OnClientDisconnect(int client) {
    UseCase_RemoveSteamId(client);
}

public void OnClientPostAdminCheck(int client) {
    UseCase_SaveSteamId(client);
}

public Action OnBanClient(int client, int time, int flags, const char[] reason, const char[] kick_message, const char[] command, any source) {
    UseCase_SaveBanInfo(client);

    return Plugin_Continue;
}
