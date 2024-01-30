io.stdout:setvbuf("no")
Object = require "classic"
bf = require("breezefield")
require "utility"
require "ship"
require "terrain"

function love.load()
    love.window.setMode(1000, 800)
    world = bf.newWorld(0, 9.81*18, true)
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)
    
    collisionData = {}
    
    ship = Ship()
    terrain = Terrain()
end

function beginContact(a, b, coll) end
function endContact(a, b, coll) end
function preSolve(a, b, coll) end
function postSolve(a, b, coll, normalimpulse, tangentimpulse) end

function love.update(dt)
    world:update(dt)
    ship:update(dt)
end

function love.draw()
    world:draw()
    ship:draw()
    terrain:draw()
end
