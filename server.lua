ESX                = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('NATCHKUNG:server:getdata', function(source, cb)
    local iden = GetPlayerIdentifiers(source)[1]
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @iden LIMIT 0,1', {
        ['@iden'] = iden
    }, function(result)
        if not (result[1] == nil) then
            data = {name = result[1].name}
            cb(data)
        else
            cb(nil)
        end
    end)
end)