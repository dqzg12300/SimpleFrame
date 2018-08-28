local skynet=require "skynet"
local tool=require "tool"

local runconfig=require(skynet.getenv("runconfig"))
local dbconf=runconfig.service.dbproxy_common

local faci=require "faci.module"
local module=faci.get_module("dbproxy")

local dispatch=module.dispatch
local forward=module.forward
local event=module.event

local db={
	["wx_user"]=nil,
}

local function init(conf)
	if not conf.enable then
		log.info("db "..conf.db_name.." is enable false")
		return nil
	end
	local dbtype=conf.db_type
	local dbc=require(dbtype)
	local mdb= dbc:start(conf)
	assert(mdb)
	return mdb
end

function event.awake()
	db.wx_user=init(dbconf.wx_user)
	
end

function dispatch.get(dbname,cname,select)
	return db[dbname]:findOne(cname,select)
end

function dispatch.set(dbname,cname,select,update)
	return db[dbname]:update(cname,select,update)
end

function dispatch.insert(dbname,cname,data)
	db[dbname]:insert(cname,data)
end

function dispatch.get_order(dbname,cname,select,order)
	return db[dbname]:findOneOrder(cname,select,order)
end