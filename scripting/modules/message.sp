void Message_ReplyNoBansYet(int client) {
    ReplyToCommand(client, "%s%t", PREFIX, "No bans yet");
}

void Message_ReplyBanNotFound(int client, const char[] playerSteamId) {
    ReplyToCommand(client, "%s%t", PREFIX, "Ban not found", playerSteamId);
}

void Message_ReplyBanRemoved(int client, const char[] playerName, const char[] playerSteamId) {
    ReplyToCommand(client, "%s%t", PREFIX, "Player unbanned", playerName, playerSteamId);
}
