static char g_steamIds[MAXPLAYERS + 1][PLAYER_STEAM_ID_SIZE];

void SteamIdList_Add(int client, const char[] steamId) {
    strcopy(g_steamIds[client], PLAYER_STEAM_ID_SIZE, steamId);
}

void SteamIdList_Remove(int client) {
    strcopy(g_steamIds[client], PLAYER_STEAM_ID_SIZE, "");
}

void SteamIdList_Get(int client, char[] steamId) {
    strcopy(steamId, PLAYER_STEAM_ID_SIZE, g_steamIds[client]);
}
