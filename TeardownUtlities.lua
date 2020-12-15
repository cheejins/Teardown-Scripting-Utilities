--[[DEBUG]]
local db = {
    debugAll = false,
    debugLines = false,
    debugPrint = false,
}
db.l = function(vec1, vec2, color, a)
    if db.debugLines == false or db.all == true then
        DebugLine(vec1, vec2, color[1] or 0.5, color[2] or 0.5, color[3] or 0.5, a or 1)
    end
end
db.p = function(string)
    if db.debugPrints == false or db.all == true then
        db.p(string)
    end
end
local colors = {
    yellow  = Vec(1,1,0.5),
    red     = Vec(1,0.5,0.5),
    green   = Vec(0.5,1,0.5),
    blue    = Vec(0.5,0.5,1),
    white   = Vec(1,1,1),
    black   = Vec(0,0,0),
}
--[[DEBUG CONTROL]]
-- db.all = true   -- comment this line to enable all debugging
-- db.lines = true -- comment this line to enable visual vector line debugging
-- db.Print = true -- comment this line to enable debug prints





--- Creates a uniform Axis-Aligned Bounding Box wireframe. extraSize (optional) adds a buffer area around the vec1 and vec2.
function drawAABB(vec1, vec2, extraSize)
  
    local x1 = vec1[1] + vectorLineRadius or 0
    local y1 = vec1[2] - vectorLineRadius or 0
    local z1 = vec1[3] + vectorLineRadius or 0

    local x2 = vec2[1] - vectorLineRadius or 0
    local y2 = vec2[2] + vectorLineRadius or 0
    local z2 = vec2[3] - vectorLineRadius or 0

    -- x lines top
    DebugLine(Vec(x1,y1,z1), Vec(x2,y1,z1))
    DebugLine(Vec(x1,y1,z2), Vec(x2,y1,z2))
    -- x lines bottom
    DebugLine(Vec(x1,y2,z1), Vec(x2,y2,z1))
    DebugLine(Vec(x1,y2,z2), Vec(x2,y2,z2))
    -- y lines
    DebugLine(Vec(x1,y1,z1), Vec(x1,y2,z1))
    DebugLine(Vec(x2,y1,z1), Vec(x2,y2,z1))
    DebugLine(Vec(x1,y1,z2), Vec(x1,y2,z2))
    DebugLine(Vec(x2,y1,z2), Vec(x2,y2,z2))
    -- z lines top
    DebugLine(Vec(x2,y1,z1), Vec(x2,y1,z2))
    DebugLine(Vec(x2,y2,z1), Vec(x2,y2,z2))
    -- z lines bottom
    DebugLine(Vec(x1,y1,z2), Vec(x1,y1,z1))
    DebugLine(Vec(x1,y2,z2), Vec(x1,y2,z1))
    -- center cross line (blue)
    DebugLine(Vec(x1,y1,z1), Vec(x2,y2,z2), 0,0,1)

    local aabbStart = Vec(x1,y1,z1)
    local aabbEnd = Vec(x2,y2,z2)
    
    local listOfShapesInAabb = QueryAabbShapes(aabbStart, aabbEnd)
end
