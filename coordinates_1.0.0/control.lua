require "defines"

if not coordinates then coordinates = {} end
if not coordinates.significantdigits then coordinates.significantdigits = {} end

require "config"

if coordinates.significantdigits > 4 then coordinates.significantdigits = 4 end
if coordinates.significantdigits < 0 then coordinates.significantdigits = 0 end

script.on_event(defines.events.on_tick, function(event)

		for i, player in ipairs(game.players) do
			if player.gui.top.coordinatesGUI == nil then player.gui.top.add{type="button", name="coordinatesGUI"} end
			template = string.format("x=%%.%.df y=%%.%.df", coordinates.significantdigits, coordinates.significantdigits)
			player.gui.top.coordinatesGUI.caption = string.format(template, game.player.character.position.x,game.player.character.position.y)
		end
end)
