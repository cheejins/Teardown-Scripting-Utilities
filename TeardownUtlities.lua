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





--- Creates a uniform Axis-Aligned Bounding Box wireframe.
function drawAABB(vec)
  
    local x = vec[1]
    local y = vec[2]
    local z = vec[3]
    
    DebugLine(Vec(x,y,z), Vec(-x,y,z)) -- x lines top
    DebugLine(Vec(x,y,-z), Vec(-x,y,-z))
    DebugLine(Vec(x,-y,z), Vec(-x,-y,z)) -- x lines bottom
    DebugLine(Vec(x,-y,-z), Vec(-x,-y,-z))

    DebugLine(Vec(x,y,z), Vec(x,-y,z)) -- y lines
    DebugLine(Vec(-x,y,z), Vec(-x,-y,z))
    DebugLine(Vec(x,y,-z), Vec(x,-y,-z))
    DebugLine(Vec(-x,y,-z), Vec(-x,-y,-z))

    DebugLine(Vec(-x,y,z), Vec(-x,y,-z)) -- z lines top
    DebugLine(Vec(-x,-y,z), Vec(-x,-y,-z)) -- z lines top
    DebugLine(Vec(x,y,-z), Vec(x,y,z)) -- z lines bottom
    DebugLine(Vec(x,-y,-z), Vec(x,-y,z)) -- z lines bottom

    DebugLine(Vec(x,y,z), Vec(-x,-y,-z), 0,0,1) -- center cross line
end
