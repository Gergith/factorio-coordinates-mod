require "defines"

if not coordinates then coordinates = {} end
if not coordinates.significantdigits then coordinates.significantdigits = {} end
if not coordinates.showz then coordinates.showz = {} end

require "config"

if coordinates.significantdigits > 4 then coordinates.significantdigits = 4 end
if coordinates.significantdigits < 0 then coordinates.significantdigits = 0 end
if coordinates.showz == nil then coordinates.showz = false end
if coordinates.singleline == nil then coordinates.singleline = true end

script.on_event(defines.events.on_tick, function(event)
	for i, player in ipairs(game.players) do
--		if player.gui.top.coordinatesGUI == nil then player.gui.top.add{type="button", name="coordinatesGUI"} end
		surfacestring = " z="..player.surface.name
		template = string.format("x=%%.%.df y=%%.%.df", coordinates.significantdigits, coordinates.significantdigits)

		if coordinates.showz == true then if coordinates.singleline == true then template = template..surfacestring end end
--		player.gui.top.coordinatesGUI.caption = string.format(template, game.player.character.position.x,game.player.character.position.y)

		if player.gui.top.coordinatesFlowGUI == nil then player.gui.top.add{type="flow", direction="vertical", name="coordinatesFlowGUI"} end
		if player.gui.top.coordinatesFlowGUI.xcords == nil then player.gui.top.coordinatesFlowGUI.add{type="label", name="xcords"} end
		player.gui.top.coordinatesFlowGUI.xcords.caption=string.format(template, game.player.character.position.x,game.player.character.position.y)
		
		if coordinates.showz == true then
			if coordinates.singleline == false then
				if player.gui.top.coordinatesFlowGUI.zcords == nil then player.gui.top.coordinatesFlowGUI.add{type="label", name="zcords"} end
				player.gui.top.coordinatesFlowGUI.zcords.caption="z="..player.surface.name
			end
		end
	end
end)

--script.on_event(defines.events.on_gui_click, function(event)
--	if event.element.name == "coordinatesGUI" then 
--		coordinates.significantdigits =  coordinates.significantdigits + 1
--		if coordinates.significantdigits > 4 then coordinates.significantdigits = 0 end
--    end
--end)