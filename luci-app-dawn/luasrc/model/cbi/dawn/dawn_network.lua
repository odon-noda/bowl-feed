m = Map("Network Overview", translate("Network Overview"))
m.pageaction = false

s = m:section(NamedSection, "__networkoverview__")

function s.render(self, sid)
	local tpl = require "luci.template"
	tpl.render_string([[
		<ul>
			<%
            		local status = require "luci.tools.ieee80211"
			local utl = require "luci.util"
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
					%>
						<li>
						<strong>Client is: </strong><%= mac2 %><br />
			                        <strong>Frequency is: </strong><%= "%.3f" %( data2.freq / 1000 ) %>GHz (Channel: <%= "%d" %( status.frequency_to_channel(data2.freq) ) %>)<br />
						<strong>HT: </strong><%= (data2.ht == true) and "available" or "not available" %><br />
						<strong>VHT: </strong><%= (data2.vht == true) and "available" or "not available" %><br />
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
