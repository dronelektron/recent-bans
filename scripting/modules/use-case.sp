void UseCase_SaveSteamId(int client) {
    char steamId[PLAYER_STEAM_ID_SIZE];

    GetClientAuthId(client, AuthId_Steam3, steamId, sizeof(steamId), true);
    SteamIdList_Add(client, steamId);
}

void UseCase_RemoveSteamId(int client) {
    SteamIdList_Remove(client);
}

void UseCase_SaveBanInfo(int client) {
    char name[PLAYER_NAME_SIZE];
    char steamId[PLAYER_STEAM_ID_SIZE];

    GetClientName(client, name, sizeof(name));
    SteamIdList_Get(client, steamId);
    BansList_Add(name, steamId);
}

void UseCase_RemoveBanInfo(int client, const char[] steamId) {
    int banIndex = BansList_FindBySteamId(steamId);

    if (banIndex == BAN_NOT_FOUND) {
        MessageReply_BanNotFound(client, steamId);

        return;
    }

    char name[PLAYER_NAME_SIZE];

    BansList_GetPlayerName(banIndex, name);
    RemoveBan(steamId, BANFLAG_AUTHID);
    BansList_Remove(banIndex);
    MessageActivity_BanRemoved(client, name, steamId);
    MessageLog_BanRemoved(client, name, steamId);
}

void UseCase_OpenRecentBansMenu(int client) {
    if (BansList_Size() == 0) {
        MessageReply_NoBansYet(client);
    } else {
        Menu_RecentBans(client);
    }
}
