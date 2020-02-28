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
	if key == ">" and startpos then -- note pos and add the closing tag
		local endpos = win.selection.pos
		-- endcol, endline: used to reset cursor to before the closing tag
		local endline = win.selection.line
		local endcol = win.selection.col 
		local opentag = (vis.win.file:content(startpos, endpos - startpos))..">"
		local closetag = string.gsub(opentag, "<", "</")
		file:insert(endpos, ">"..closetag)
		win.selection:to(endline, endcol+1)
		vis:info(opentag.. " "..closetag)
		startpos = nil
		just_completed = true
		return true
	elseif key == ">" and just_completed then
		local pos = win.selection.pos
		local mark = file:mark_set(pos)
		vis:feedkeys("<Enter><Enter>")
		win.selection.pos = file:mark_get(mark)+1
		vis:feedkeys("\t")
		return true
	end
end)
