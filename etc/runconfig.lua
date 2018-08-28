return {
    TEST = true,
    version = "1.0.0",
	--集群地址配置
	cluster = {
		node1 = "127.0.0.1:2528", 
	},
	--通信协议
	prototype = "tcp",  --tcp/ws
	protopack = "pb",   --pb/json

	--各个服务配置
	service = {
		--debug_console服务
		debug_console = {
			[1] = {port=10701, node = "node1"},
		},

		--dbproxy服务
		dbproxy_common = {
			wx_user = {
				db_type = "mysqldb",
				host = "127.0.0.1", 
				db_name = "wx_user",
				port=3306,
				database="demo",
				user="root",
				password="123456",
				enable=false
			}, 
		},

		dbproxy = {
			[1] = {node = "node1"},
		},
    },
	--玩家数据表配置
	playerdata = {
		baseinfo = true,
	},

}
