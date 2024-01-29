io.stdout:setvbuf("no")
Object = require "classic"
bf = require("breezefield")
require "utility"
require "ship"
require "terrain"

function love.load()
    love.window.setMode(1000, 800)
    world = bf.newWorld(0, 9.81*15, true)
    ship = Ship()
    terrain = Terrain()

end

function love.update(dt)
    world:update(dt)
    ship:update(dt)
end

function love.draw()
    world:draw()
    ship:draw()
end
