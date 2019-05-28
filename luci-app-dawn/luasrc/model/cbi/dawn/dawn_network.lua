m = Map("Network Overview", translate("Network Overview"))
m.pageaction = false

s = m:section(NamedSection, "__networkoverview__")

function s.render(self, sid)
	local tpl = require "luci.template"
	local json = require "luci.json"
	local utl = require "luci.util"
	tpl.render_string([[
		<ul>
			<%
            		local status = require "luci.tools.ieee80211"
			local utl = require "luci.util"
		        local sys = require "luci.sys"     
		        local hosts = sys.net.host_hints() 
			local stat = utl.ubus("dawn", "get_network", { })
			local name, macs
			for name, macs in pairs(stat) do
			%>
				<li>
					<strong>SSID is: </strong><%= name %><br />
				</li>
				<ul>
				<%
				local mac, data
				for mac, data in pairs(macs) do
				%>
					<li>
						<strong>AP MAC is: </strong><%= mac %><br />
					</li>
					<ul>
					<%
					local mac2, data2
					for mac2, data2 in pairs(data) do					
						local devicename
						local host = mac2 and hosts[mac2]
						local httpclient = require('luci.httpclient')
						if not(data2.signature == nil) then
							local key = "3f571d11466714f41d72bc9aac30858b80d36fa4"
							local url = "http://wifiscout.inet.tu-berlin.de/api/v1/device/?key=" .. key .. "&signature=" .. data2.signature
							local rc, r, txt, s = httpclient.request_raw(url)
							local json = require "luci.json"
							local req = json.decode(txt)
							if not(req["results"] == nil) then
								devicename = req["results"][1]["name"]
							end
						end
					%>
						<li>
						<strong>Client: <%= mac2 %><br />
                                              	<strong>Name:</strong> <%= host.name %><br />
						<strong>IPv4:</strong> <%= host.ipv4 %><br />
						<strong>IPv6:</strong> <%= host.ipv6 %><br /> 
			                        <strong>Frequency is: </strong><%= "%.3f" %( data2.freq / 1000 ) %> GHz (Channel: <%= "%d" %( status.frequency_to_channel(data2.freq) ) %>)<br />
						<strong>HT: </strong><%= (data2.ht == true) and "available" or "not available" %><br />
						<strong>VHT: </strong><%= (data2.vht == true) and "available" or "not available" %><br />
						<strong>Signature: </strong><%= "%s" %data2.signature %><br />
						<strong>Devicename: </strong><%= "%s" %devicename %><br />
						<!--
						<strong>Signal is: </strong><%= "%d" %data2.signal %><br />
						<strong>Channel Utilization is: </strong><%= "%d" %data2.channel_utilization %><br />
						<strong>Station connected to AP is: </strong><%= "%d" %data2.num_sta %><br />
						--!>
						</li>
					<%
					end
					%>
				</ul>
				<%
				end
				%>
			</ul>
			<%
			end
			%>
		</ul>
	]])
end

return m
