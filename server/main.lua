local QBCore = exports['qb-core']:GetCoreObject()
local mailboxCooldowns = {}

local itemLabels = {
    per_mail = 'Personal Mail',
    gov_mail = 'Government Mail',
    jnk_mail = 'Junk Mail',
    birthday_card = 'Birthday Card',
    grad_card = 'Graduation Card',
    western_union_check = 'Western Union Check',
    random_letter = 'Random Letter',
    social_security = 'Social Security',
    tax_return = 'Tax Return'
}

QBCore.Functions.CreateUseableItem("per_mail", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports['qb-inventory']:RemoveItem(source, 'per_mail', 1)
    TriggerClientEvent("vivify_mailrobbery:client:useItem", src, item.name)
end)

QBCore.Functions.CreateUseableItem("gov_mail", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports['qb-inventory']:RemoveItem(source, 'gov_mail', 1)
    TriggerClientEvent("vivify_mailrobbery:client:useItem", src, item.name)
end)

QBCore.Functions.CreateUseableItem("birthday_card", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports['qb-inventory']:RemoveItem(source, 'birthday_card', 1)
    exports['qb-inventory']:AddItem(source, 'black_money', math.random(10, 20))
end)

QBCore.Functions.CreateUseableItem("grad_card", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports['qb-inventory']:RemoveItem(source, 'grad_card', 1)
    exports['qb-inventory']:AddItem(source, 'black_money', math.random(50, 80))
end)

local function GetItemLabel(item)
    return itemLabels[item] or "Unknown Item."
end

RegisterNetEvent('vivify_mailrobbery:reward')
AddEventHandler('vivify_mailrobbery:reward', function(item, mailboxCoords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local mailboxKey = tostring(mailboxCoords.x) .. tostring(mailboxCoords.y) .. tostring(mailboxCoords.z)

    if mailboxCooldowns[mailboxKey] then
        TriggerClientEvent('QBCore:Notify', src, "This mailbox is empty. Try again later.", "error")
        return
    end

    if Player then
        Player.Functions.AddItem(item, 1)
        
        local itemLabel = GetItemLabel(item)
        TriggerClientEvent('QBCore:Notify', src, "You received: " .. itemLabel, "success")
        
        mailboxCooldowns[mailboxKey] = true
        SetTimeout(1800000, function()
            mailboxCooldowns[mailboxKey] = nil
        end)
    end
end)

RegisterNetEvent('vivify_mailrobbery:rewardItem')
AddEventHandler('vivify_mailrobbery:rewardItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        Player.Functions.AddItem(item, 1)
        
        local itemLabel = GetItemLabel(item)
        TriggerClientEvent('QBCore:Notify', src, "You received: " .. itemLabel, "success")
    end
end)

RegisterNetEvent('vivify_mailrobbery:useItem')
AddEventHandler('vivify_mailrobbery:useItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local usageProbabilities = Config.ItemUsageProbabilities[item]
    
    if Player and usageProbabilities then
        local rewardItem = GetRandomItem(usageProbabilities)
        Player.Functions.AddItem(rewardItem, 1)
        local itemLabel = GetItemLabel(rewardItem)
        TriggerClientEvent('QBCore:Notify', src, "You received: " .. itemLabel, "success")
    end
end)

RegisterNetEvent('vivify_MailRobbery:sellItem')
AddEventHandler('vivify_MailRobbery:sellItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        local itemToSell = Player.Functions.GetItemByName(item)
        if itemToSell then
            local priceRange = Config.ItemPrices[item]
            local sellPrice = math.random(priceRange.min, priceRange.max)
            local itemLabel = Config.ItemLabels[item] or item

            Player.Functions.RemoveItem(item, 1)
            Player.Functions.AddMoney('black_money', sellPrice)
            TriggerClientEvent('QBCore:Notify', src, 'Sold: ' .. itemLabel .. ' for $' .. sellPrice, 'success')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You don\'t have ' .. item, 'error')
        end
    end
end)