module("luci.controller.dawn", package.seeall)

function index()
    entry({ "admin", "dawn" }, firstchild(), "DAWN", 60).dependent = false
    entry({ "admin", "dawn", "configure_daemon" }, cbi("dawn/dawn_config"), "Configure DAWN", 1)
    entry({ "admin", "dawn", "view_network" }, cbi("dawn/dawn_network"), "View Network Overview", 2)
    entry({ "admin", "dawn", "view_hearing_map" }, cbi("dawn/dawn_hearing_map"), "View Hearing Map", 3)
    entry({ "admin", "dawn", "log"}, template("dawn/logread"), "View Logfile", 4) 
    entry({ "admin", "dawn", "logread"}, call("logread"), nil).leaf = true
end

function logread()
 	local content       
        local util = require("luci.util")  
        local http = require("luci.http")  
                            
        if nixio.fs.access("/var/log/messages") then
                content = util.trim(util.exec("grep -F 'dawn' /var/log/messages"))
        else                             
                content = util.trim(util.exec("logread -e 'dawn'"))
        end                                         
                                                                                
        if content == "" then                                                   
                content = "No dawn related logs yet!"           
        end                                                        
        luci.http.write(content)
end
