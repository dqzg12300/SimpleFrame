local skynet = require "skynet"
local log = require "log"

local runconf = require(skynet.getenv("runconfig"))
local servconf = runconf.service
local MAX_DBPROXY_COUNT = #servconf.dbproxy

local M = {}
local dbproxy = {}

local function init()
    for i = 1, MAX_DBPROXY_COUNT do
        dbproxy[i] = string.format("dbproxy%d", i) 
    end
end

local next_id = 0
local function next_dbproxy()
    next_id = next_id + 1
    if next_id > MAX_DBPROXY_COUNT then
        next_id = 1
    end
    return dbproxy[next_id]
end


function M.get_wxuser(account)
    local db = next_dbproxy()
    return skynet.call(db, "lua", "dbproxy.get", "wx_user", "wx_user", {wxname=account})
end

function M.set_wxuser(account, update)
    local db = next_dbproxy()
    return skynet.call(db, "lua", "dbproxy.set", "wx_user", "wx_user", {wxname=account}, update)
end

function M.add_wxuser(cname, data)
    local db = next_dbproxy()
    return skynet.call(db, "lua", "dbproxy.insert", "wx_user", cname, data)
end


local function inc_uid_cname(cname)
    local db = next_dbproxy()
    return skynet.call(db, "lua", "dbproxy.incr", cname)
end 

skynet.init(init)

return M


