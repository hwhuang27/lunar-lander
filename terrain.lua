Terrain = Object:extend()

function Terrain:new()
    self.elevation = 650
    self.points = {}
    
    for i=0,1000,25 do
        if i >= 150 and i <= 175 then
            table.insert(self.points, i)
            table.insert(self.points, self.elevation)
        elseif i >= 500 and i <= 575 then
            table.insert(self.points, i)
            table.insert(self.points, self.elevation)
        elseif i >= 800 and i <= 850 then
            table.insert(self.points, i)
            table.insert(self.points, self.elevation)
        else
            table.insert(self.points, i)
            table.insert(self.points, self.elevation)
            if self.elevation > 740 then
                self.elevation = self.elevation - love.math.random(15, 50)
            else
                self.elevation = self.elevation + (love.math.random(15, 50) * rsign())
            end
        end
    end
    
    self.terrain = world:newCollider("Chain", {false, self.points})
    self.terrain:setType("static")
    
    self.max_elevation = 1000
    for i=2,#self.points,2 do
        if self.max_elevation > self.points[i] then
            self.max_elevation = self.points[i]
        end
    end
    
    self.stars = {}
    for i=1,15 do
        table.insert(self.stars, {
            x = math.random(25, 975),
            y = math.random(25, self.max_elevation),
            size = 1
        })
    end

end

function Terrain:draw()
    -- 4x bonus (elevation @ self.points[14])
    love.graphics.print('4x', 165, self.points[14]+5, 0, 1.5, 1.5)
    love.graphics.line(150, self.points[14]-1, 200, self.points[14]-1)
    love.graphics.line(150, self.points[14]+1, 200, self.points[14]+1)
    
    -- 1x bonus (elevation @ self.points[36])
    love.graphics.print('1x', 533, self.points[42]+5, 0, 1.5, 1.5)
    love.graphics.line(500, self.points[42]-1, 600, self.points[42]-1)
    love.graphics.line(500, self.points[42]+1, 600, self.points[42]+1)

    -- 2x bonus (elevation @ self.points[68])
    love.graphics.print('2x', 825, self.points[68]+5, 0, 1.5, 1.5)
    love.graphics.line(800, self.points[68]-1, 875, self.points[68]-1)
    love.graphics.line(800, self.points[68]+1, 875, self.points[68]+1)

    -- draw stars at random locations above max_elevation
    for i,v in ipairs(self.stars) do
        love.graphics.circle("fill", v.x, v.y, v.size)
    end
    

end


