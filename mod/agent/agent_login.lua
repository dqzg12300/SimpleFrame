---
--- 处理客户端消息,登录部分逻辑
--- Created by Administrator.
--- DateTime: 2018/9/2 20:11
---

local skynet=require "skynet"
local log=require "log"
local env=require "faci.env"

local player={}

--处理客户端登录
function env.login(account)
    log.debug("agent login account:%d",account)
end

--处理客户端登出
function env.logout(account)
    log.debug("agent logout account:%d",account)
end

--获取player信息
function env.get_player()
    log.debug("agent get_player")
end

--获取player的data数据
function env.get_player_data()
    log.debug("agent get_player_data")
end