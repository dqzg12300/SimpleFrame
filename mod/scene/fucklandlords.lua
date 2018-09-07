---
--- 斗地主的场景管理
--- Created by admin.
--- DateTime: 2018/9/7 15:00
---

local skynet=require "skynet"
local faci=require "faci.module"
local module=faci.get_module("scene")


local forward=module.forward

function forward.create_room(msg)
    INFO("scene.create_room")
end

function forward.enter_room(msg)
    INFO("scene.enter_room")
end

function forward.leave_room(msg)
    INFO("scene.leave_room")
end
