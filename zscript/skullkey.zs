class RevSkullKey : Inventory {
    Default {
        Inventory.Pickupmessage "$GOTYELWSKUL";
		Inventory.Icon "STKEYS4";
		Tag "$TAG_YELLOWSKULL";
        Inventory.MaxAmount 0x7fffffff;
        Inventory.Amount 1;
    }
    States {
        Spawn:
            YSKU A 10;
            YSKU B 10 bright;
            loop;
    }
}

class SkullKeyUiHandler: EventHandler {
    override void RenderOverlay(RenderEvent e) {
        PlayerPawn p = PlayerPawn(players[consoleplayer].mo);
        int skulls = p.CountInv("RevSkullKey");
        if (skulls > 0) {
            //Inventory skullInv = p.FindInventory("Coin");
            //statusbar.DrawInventoryIcon(skullInv, (0, 0), statusbar.DI_SCREEN_RIGHT_BOTTOM | statusbar.DI_ITEM_RIGHT_BOTTOM);
            Screen.DrawText(smallfont, Font.CR_RED, 4, 4, String.Format("Skulls %d", skulls));
        }
    }
}
