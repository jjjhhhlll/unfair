// Blue armor that has ALWAYSPICKUP so it can be used as an item based 
// secret and trigger without the player having to damage themselves.

class SecretBlueArmor : BasicArmorPickup
{
    Default
    {
        Radius 20;
        Height 16;
        Inventory.Pickupmessage "$GOTMEGA";
        Inventory.Icon "ARM2A0";
        Armor.Savepercent 50;
        Armor.Saveamount 200;
        Tag "$TAG_BLUEARMOR";
        +INVENTORY.ALWAYSPICKUP

    }
    States
    {
    Spawn:
        ARM2 A 6;
        ARM2 B 6 bright;
        loop;
    }
}
