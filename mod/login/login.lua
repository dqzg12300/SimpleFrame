---
--- 登录服的业务逻辑处理
--- Created by Administrator.
--- DateTime: 2018/9/2 20:35
---

local skynet=require "skynet"
local log=require "log"
local faci=require "faci.module"
local module=faci.get_module("login")
local forward=module.forward


function forward.login(fd,msg,source)
    log.debug("login service")
end
