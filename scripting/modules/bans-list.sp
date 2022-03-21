static ArrayList g_bansList = null;

void BansList_Create() {
    int blockSize = ByteCountToCells(PLAYER_NAME_SIZE);

    g_bansList = new ArrayList(blockSize);
}

void BansList_Destroy() {
    delete g_bansList;
}

int BansList_Size() {
    return g_bansList.Length / FIELDS_AMOUNT;
}

void BansList_Add(const char[] playerName, const char[] playerSteamId) {
    g_bansList.PushString(playerName);
    g_bansList.PushString(playerSteamId);
}

void BansList_Remove(int index) {
    int offset = BansList_Offset(index);

    g_bansList.Erase(offset + FIELD_PLAYER_STEAM_ID);
    g_bansList.Erase(offset + FIELD_PLAYER_NAME);
}

void BansList_GetPlayerName(int index, char[] playerName) {
    int offset = BansList_Offset(index);

    g_bansList.GetString(offset + FIELD_PLAYER_NAME, playerName, PLAYER_NAME_SIZE);
}

void BansList_GetPlayerSteamId(int index, char[] playerSteamId) {
    int offset = BansList_Offset(index);

    g_bansList.GetString(offset + FIELD_PLAYER_STEAM_ID, playerSteamId, PLAYER_STEAM_ID_SIZE);
}

int BansList_FindBySteamId(const char[] playerSteamId) {
    char tempSteamId[PLAYER_STEAM_ID_SIZE];

    for (int banIndex = 0; banIndex < BansList_Size(); banIndex++) {
        BansList_GetPlayerSteamId(banIndex, tempSteamId);

        if (strcmp(playerSteamId, tempSteamId) == 0) {
            return banIndex;
        }
    }

    return BAN_NOT_FOUND;
}

int BansList_Offset(int index) {
    return index * FIELDS_AMOUNT;
}
