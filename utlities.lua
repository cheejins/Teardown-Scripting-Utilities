--[[DEBUG]]
    local db = { onAll = true, onL = true, onP = true, onW = true,}
    db.l = function(vec1, vec2, color, a)
        if db.onL == false then
            DebugLine(vec1, vec2, color[1] or 0.5, color[2] or 0.5, color[3] or 0.5, a or 1)
        end
    end
    db.p = function(string)
        if db.onP == false then
            DebugPrint(string or "(No string entered.)")
        end
    end
    db.w = function(stringTitle, stringBody)
        if db.onW == false then
            DebugWatch(stringTitle or "(No string entered.)", stringBody or "(No string entered.)")
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
    -- db.onL = true -- comment this line to disable vector line debugging
    -- db.onP = true -- comment this line to disable debug prints
    -- db.onW = true -- comment this line to disable debug watches

    -- comment this line to disable all debugging
    -- db.onAll, db.onL,db.onP,db.onW = true,true,true,true,true 



--- Creates an Axis-Aligned Bounding Box wireframe. extraSize (optional) adds a buffer area around the vec1 and vec2.
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

    local aabbStart = Vec(x1,y1,z1)
    local aabbEnd = Vec(x2,y2,z2)
    local listOfShapesInAabb = QueryAabbShapes(aabbStart, aabbEnd)
end

function CalcDistance(vec1, vec2)
    return VecLength(VecSub(vec1, vec2))
end
function raycastFromTransform(tr)
    local plyTransform = tr
    local fwdPos = TransformToParentPoint(plyTransform, Vec(0, 0, -3000))
    local direction = VecSub(fwdPos, plyTransform.pos)
    local dist = VecLength(direction)
    direction = VecNormalize(direction)
    local hit, dist = QueryRaycast(tr.pos, direction, dist)
    if hit then
        local hitPos = TransformToParentPoint(plyTransform, Vec(0, 0, dist * -1))
        return hitPos
    end
    return TransformToParentPoint(tr, Vec(0, 0, -1000))
end
local debugSounds = {
    beep = LoadSound("warning-beep"),
    buzz = LoadSound("light/spark0"),
    chime = LoadSound("elevator-chime"),}
function beep(vol) PlaySound(debugSounds.beep, GetPlayerPos(), vol or 0.3) end
function buzz(vol) PlaySound(debugSounds.buzz, GetPlayerPos(), vol or 0.3) end
function chime(vol) PlaySound(debugSounds.chime, GetPlayerPos(), vol or 0.3) end
function particleLine(vec1, vec2, particle, density, thickness)
    local maxLength = 500 -- prevents infinite particle line crashing your game.
    local transform = Transform(vec1, QuatLookAt(vec1,vec2))
    for i=1, VecLength(VecSub(vec1, vec2))*(density or 1) do
        if i < maxLength then
            local fwdpos = TransformToParentPoint(transform, Vec(0,0,-i/(density or 1)))
            SpawnParticle(particle or "darksmoke", fwdpos, 1, 1 or thickness, 0.2, 0, 0)
        end
    end
end
function round(number, decimals)
    local power = 10^decimals
    return math.floor(number * power) / power
end
--- string format. default 2 decimals.
function sfn(numberToFormat, dec)
    local s = (tostring(dec or 2))
    return string.format("%."..s.."f", numberToFormat)
end
--- return number if > 0, else return 0.00000001
function gtZero(val)
    if val <= 0 then
        return 0.0000001
    end
    return val
end
--- return number if not = 0, else return 0.00000001
function nZero(val)
    if val == 0 then return 0.0000001 end
    return val
end
--- Prints quats or vectors. dec = decimal places. dec default = 3. title is optional.
function printVec(vec, dec, title)
    DebugPrint(
        (title or "") .. 
        "  " .. sfn(vec[1], dec or 2) ..
        "  " .. sfn(vec[2], dec or 2) ..
        "  " .. sfn(vec[3], dec or 2)
    )
end
--- Fully prints quats or vectors will all decimals. title is optional.
function printVecf(vec, title)
    DebugPrint(
        (title or "") .. 
        "  " .. sfn(vec[1]) ..
        "  " .. sfn(vec[2]) ..
        "  " .. sfn(vec[3])
    )
end

