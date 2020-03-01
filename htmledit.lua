require "vis"

-- look for the beginning of an opening html tag '<'
vis.events.subscribe(vis.events.INPUT, function(key)
	win = vis.win
	file = vis.win.file
	if key == "<" then -- take down its position
		startpos = win.selection.pos
		vis:info(startpos)
	end
	-- if bracket is closed
	if key == ">" and startpos then 
		-- define the tags
		local pos = win.selection.pos
		local content = vis.win.file:content(startpos, pos - startpos)
		local opentag = content..">"
		local closetag = string.gsub(opentag, "<", "</")
		-- insert the closing tag
		file:insert(pos, closetag)
		win.selection.pos = pos + #closetag
		assert(win.selection.pos == pos + #closetag)
		-- go back to before the tag
		local afterpos = win.selection.pos
		win.selection.pos = afterpos - #closetag
		startpos = nil
	end
end)

vis:map(vis.modes.INSERT, "<F1>", function()
	vis:info("current position: "..vis.win.selection.pos)
end)
