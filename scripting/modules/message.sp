void MessageReply_NoBansYet(int client) {
    ReplyToCommand(client, "%s%t", PREFIX, "No bans yet");
}

void MessageReply_BanNotFound(int client, const char[] playerSteamId) {
    ReplyToCommand(client, "%s%t", PREFIX, "Ban not found", playerSteamId);
}

void MessageActivity_BanRemoved(int client, const char[] playerName, const char[] playerSteamId) {
    ShowActivity2(client, PREFIX, "%t", "Player unbanned", playerName, playerSteamId);
}

void MessageLog_BanRemoved(int client, const char[] playerName, const char[] playerSteamId) {
    LogMessage("\"%L\" unbanned '%s' '%s'", client, playerName, playerSteamId);
}
