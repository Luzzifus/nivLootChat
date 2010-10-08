local LibDeformat = LibStub("LibDeformat-3.0")

ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", function(self, event, msg)

    -- Suppress looting messages of lower quality items
    if LibDeformat(msg, LOOT_ITEM) or LibDeformat(msg, LOOT_ITEM_MULTIPLE) or LibDeformat(msg, LOOT_ITEM_SELF) or LibDeformat(msg, LOOT_ITEM_SELF_MULTIPLE) or LibDeformat(msg, LOOT_ITEM_PUSHED_SELF) or LibDeformat(msg, LOOT_ITEM_PUSHED_SELF_MULTIPLE) then
        local _,_,itemID = strfind(msg, "(%d+):")
        local _,_,iqual = GetItemInfo(itemID)

        if iqual < 3 then return true end
    end
    
    -- Suppress money loot messages
    if LibDeformat(msg, LOOT_MONEY) or LibDeformat(msg, LOOT_MONEY_SPLIT) or LibDeformat(msg, YOU_LOOT_MONEY) then
        return true 
    end
    
    -- Suppress roll won messages
    if LibDeformat(msg, LOOT_ROLL_WON) then
        return true
    end
end)