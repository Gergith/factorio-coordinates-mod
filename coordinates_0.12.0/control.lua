require "defines"

if not coordinates then coordinates = {} end

game.on_event(defines.events.on_tick, function(event)
    
		for i, player in ipairs(game.players) do
			if player.gui.top.coordinatesGUI == nil then player.gui.top.add{type="button", name="coordinatesGUI"} end
			player.gui.top.coordinatesGUI.caption=string.format("x=%f y=%f",game.player.character.position.x,game.player.character.position.y)
		end
end)
