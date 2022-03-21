void Message_ReplyBanNotFound(int client, const char[] playerSteamId) {
    PrintToChat(client, "%s%t", PREFIX, "Ban not found", playerSteamId);
}

void Message_ReplyBanRemoved(int client, const char[] playerName, const char[] playerSteamId) {
    PrintToChat(client, "%s%t", PREFIX, "Player unbanned", playerName, playerSteamId);
}
