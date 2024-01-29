Ship = Object:extend()

function Ship:new()
    local width = love.graphics.getWidth()/2
    local height = 0
    
    self.collider = world:newCollider("Polygon", {width, height, width-15, height+40, width+15, height+40})
--    self.flame = world:newCollider("Polygon", {width, height+50, width-5, height+40, width+5, height+40})
--    love.physics.newWeldJoint(self.collider:getBody(), self.flame:getBody(), width, height+40, false)
    

    self.angle = self.collider:getAngle()
    self.force = 400
    self.collider:setLinearDamping(0.9)
    self.collider:setAngularDamping(3)

end

function Ship:update(dt)
    self.worldPoints = {self.collider:getWorldPoints(self.collider:getPoints())}
--    local angle = self.angle * (180/math.pi) % 360
--    print(angle)
    if love.keyboard.isDown("right") then
        self.collider:applyAngularImpulse(10)
    elseif love.keyboard.isDown("left") then
        self.collider:applyAngularImpulse(-10)
    elseif love.keyboard.isDown("up") then
        self.angle = self.collider:getAngle()
        local fx = self.force * math.cos(self.angle - math.pi/2)
        local fy = self.force * math.sin(self.angle - math.pi/2)
        self.collider:applyForce(fx, fy)
    end
    
    function love.keypressed(key)
        if key == "space" then
            local localX, localY = self.collider:getWorldPoints(self.collider:getPoints())
            print(localX, localY)
        end
    end
    
end

function Ship:draw()
    if love.keyboard.isDown("up") then
--        love.graphics.polygon('fill', self.flame:getWorldPoints(self.flame:getPoints()))
    end
    
end

