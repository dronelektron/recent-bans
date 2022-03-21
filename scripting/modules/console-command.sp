void Command_Create() {
    RegAdminCmd("sm_recentbans", Command_RecentBans, ADMFLAG_GENERIC);
}

public Action Command_RecentBans(int client, int args) {
    Menu_RecentBans(client);

    return Plugin_Handled;
}
