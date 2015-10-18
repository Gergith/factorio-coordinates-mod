require "defines"

if not coordinates then coordinates = {} end
if not coordinates.significantdigits then coordinates.significantdigits = {} end

require "config"

if coordinates.significantdigits > 4 then coordinates.significantdigits = 4 end
if coordinates.significantdigits < 0 then coordinates.significantdigits = 0 end

script.on_event(defines.events.on_tick, function(event)

		for i, player in ipairs(game.players) do
			if player.gui.top.coordinatesGUI == nil then player.gui.top.add{type="button", name="coordinatesGUI"} end
			if coordinates.significantdigits == 0 then player.gui.top.coordinatesGUI.caption = string.format("x=%.0f y=%.0f",game.player.character.position.x,game.player.character.position.y) end
			if coordinates.significantdigits == 1 then player.gui.top.coordinatesGUI.caption = string.format("x=%.1f y=%.1f",game.player.character.position.x,game.player.character.position.y) end
			if coordinates.significantdigits == 2 then player.gui.top.coordinatesGUI.caption = string.format("x=%.2f y=%.2f",game.player.character.position.x,game.player.character.position.y) end
			if coordinates.significantdigits == 3 then player.gui.top.coordinatesGUI.caption = string.format("x=%.3f y=%.3f",game.player.character.position.x,game.player.character.position.y) end
			if coordinates.significantdigits == 4 then player.gui.top.coordinatesGUI.caption = string.format("x=%.4f y=%.4f",game.player.character.position.x,game.player.character.position.y) end
		end
end)