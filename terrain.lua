Terrain = Object:extend()

function Terrain:new()
    self.points = {}
    self.elevation = 700
    
    for i=1,#self.points do
        print(self.points[i])
    end
    
    for i=0,1000,25 do
        if i >= 150 and i <= 175 then
            table.insert(self.points, i)
            table.insert(self.points, self.elevation)
        elseif i >= 425 and i <= 500 then
            table.insert(self.points, i)
            table.insert(self.points, self.elevation)
        elseif i >= 800 and i <= 850 then
            table.insert(self.points, i)
            table.insert(self.points, self.elevation)
        else
            table.insert(self.points, i)
            table.insert(self.points, self.elevation)
            if self.elevation > 760 then
                self.elevation = self.elevation - love.math.random(30)
            else
                self.elevation = self.elevation + (love.math.random(30) * rsign())
            end
        end
    end
    
    for i=1,#self.points do
        print(self.points[i])
    end
        
    self.terrain = world:newCollider("Chain", {false, self.points})
    self.terrain:setType("static")
end