void Menu_RecentBans(int client) {
    Menu menu = new Menu(MenuHandler_RecentBans);

    Menu_AddBans(menu);

    menu.SetTitle("%T", "Recent bans", client);
    menu.Display(client, MENU_TIME_FOREVER);
}

public int MenuHandler_RecentBans(Menu menu, MenuAction action, int param1, int param2) {
    if (action == MenuAction_Select) {
        char info[INFO_SIZE];

        menu.GetItem(param2, info, sizeof(info));

        UseCase_RemoveBanInfo(param1, info);
    } else if (action == MenuAction_End) {
        delete menu;
    }

    return 0;
}

void Menu_AddBans(Menu menu) {
    char playerName[PLAYER_NAME_SIZE];
    char playerSteamId[PLAYER_STEAM_ID_SIZE];
    char item[ITEM_SIZE];

    for (int banIndex = 0; banIndex < BansList_Size(); banIndex++) {
        BansList_GetPlayerName(banIndex, playerName);
        BansList_GetPlayerSteamId(banIndex, playerSteamId);

        Format(item, sizeof(item), "%s %s", playerName, playerSteamId);

        menu.AddItem(playerSteamId, item);
    }
}
