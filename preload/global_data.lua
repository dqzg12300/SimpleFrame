---
--- skynet的全局变量数据
--- Created by admin.
--- DateTime: 2018/8/31 12:27
---

local M={}

M.runconfig=skynet.getenv("runconfig")
M.path=skynet.getenv("app_root")
M.level=skynet.getenv("log_level")
M.log_default_lv=skynet.getenv("log_default_lv")
M.nodename=skynet.getenv("nodename")

return M