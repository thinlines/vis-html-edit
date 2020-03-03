require "vis"

-- look for the beginning of an opening html tag '<'
vis.events.subscribe(vis.events.INPUT, function(key)
	win = vis.win
	file = vis.win.file
	if win.syntax ~= "html" then return false end --only work on html files
	if key == "<" then -- take down its position
		startpos = win.selection.pos
		vis:info(startpos)
	end
	-- if it's a closing tag
	if startpos and key == "/" then
		startpos = nil
	-- if tag is closed
	elseif key == ">" and startpos then 
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
		endpos = win.selection.pos
		win.selection.pos = endpos - #closetag
		startpos = nil
	elseif endpos then
		if key == ">" then
			vis:feedkeys("<Enter>")
			local pos = win.selection.pos
			vis:feedkeys("<Enter>")
			win.selection.pos = pos
			vis:feedkeys("<Tab>")
			endpos = nil
			return true
		else endpos = nil
		end
	end
end)

vis:map(vis.modes.INSERT, "<F1>", function()
	vis:info("current position: "..vis.win.selection.pos)
end)
