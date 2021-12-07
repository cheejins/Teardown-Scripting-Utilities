Projectiles = {}
-- proj = projectile object

--- Run all active projectiles each frame.
function ProjectilesRun()

    ProjectilesManageActiveProjectiles()

end

---Instantiates a proj and adds it to the projectiles table.
---@param tr table -- Projectile source transform.
---@param projPreset table
---@param ignoreBodies table -- Table of raycast bodies to ignore.
---@param ignoreShapes table -- Table of raycast shapes to ignore.
function ProjectilesCreate(tr, projPreset, ignoreBodies, ignoreShapes)
    local proj = TableClone(projPreset)

    proj.tr = tr
    proj.ignoreBodies = ignoreBodies
    proj.ignoreShapes = ignoreShapes

    table.insert(Projectiles, proj)
end

function ProjectilesManageActiveProjectiles()

    local projsToRemove = {} -- projectiles iterations.
    for i = 1, #Projectiles do

        local proj = Projectiles[i]
        if proj.isActive and proj.hit == false then

            ProjectilePropel(proj)

            proj.lifeLength = proj.lifeLength - GetTimeStep()
            if proj.lifeLength <= 0 then
                proj.isActive = false
                proj.hit = true
            end

        elseif proj.isActive == false or proj.hit then -- if proj is inactive.
            table.insert(projsToRemove, i)
        end
    end

    for i = 1, #projsToRemove do -- remove proj from active projs after projectiles iterations.
        table.remove(Projectiles, projsToRemove[i]) -- remove active projs
    end

end

---Physically propel a projectile.
---@param proj table
---@return hit boolean -- Projectile raycast hit.
---@return hitTr table -- Projectile raycast hit position.
function ProjectilePropel(proj)

    --+ Ignore bodies
    if proj.ignoreBodies ~= nil then
        for i = 1, #proj.ignoreBodies do
            QueryRejectBody(proj.ignoreBodies[i])
        end
    end

    --+ Raycast
    local pos = proj.transform.pos
    local dir = VecSub(proj.transform.pos, TransformToParentPoint(proj.transform, Vec(0,0,-1)))
    local dist = proj.speed
    local radius = 0.1
    local hit, dist, hitShape = QueryRaycast(pos, dir, dist, radius)
    if hit then

        local hitPos = TransformToParentPoint(proj.transform, Vec(0,0,dist))
        proj.hit = true
        return true, Transform(hitPos, proj.tr)

    end

    --+ Proj hit water.
    if IsPointInWater(proj.transform.pos) then
        proj.hit = true
        SpawnParticle("water", proj.transform.pos, Vec(0,0,0))
    end

    --+ Proj life.
    if proj.hit then
        proj.isActive = false
    else
        proj.isActive = true
    end

    --+ Move proj forward.
    proj.transform.pos = TransformToParentPoint(proj.transform, Vec(0,0-proj.drop,-proj.speed))
    proj.drop = proj.drop + proj.dropIncrement

end


-- I declared the variable names like this for the sake of easy refactoring and intellisense.
-- do/end only on table first level for line folding.
-- The --! are part of a vscode extension that applies colors to comment with symbols like --!, --?, --* and so on. It is called "Better comments".


-- Shell Parts
ShellParts = {}

    ShellParts.types = {}
    do

        -- Projectiles
        ShellParts.types.projectiles = {}

            -- bullets
            ShellParts.types.projectiles.bullets = {}

            -- plasmas
            ShellParts.types.projectiles.plasmas = {}

            -- rockets
            ShellParts.types.projectiles.rockets = {}

            -- missiles
            ShellParts.types.projectiles.missiles = {}

            -- bombs
            ShellParts.types.projectiles.bombs = {}

            -- barrages
            ShellParts.types.projectiles.barrages = {}


        -- beams
        ShellParts.types.beams = {}


        -- hitscan
        ShellParts.types.hitscan = {}

            -- laser    
            ShellParts.types.hitscan.laser = {}

            -- railgun
            ShellParts.types.hitscan.railgun = {}
    end


    ShellParts.abilities = {}
    do
        -- homing
        ShellParts.abilities.homing = {}

        -- barrage
        ShellParts.abilities.barrage = {}
    end


    ShellParts.hitBehaviours = {}
    do
        -- sticky
        ShellParts.hitBehaviours.sticky = {}

        -- bouncy
        ShellParts.hitBehaviours.bouncy = {}

        -- penetrating
        ShellParts.hitBehaviours.penetrating = {}

        -- explosive
        ShellParts.hitBehaviours.explosive = {}

        -- combust
        ShellParts.hitBehaviours.combust = {}
    end


    ShellParts.physics = {}
    do
        -- speed
        ShellParts.physics.speed = {} --. Constant velocity of the shell in m/s.

        -- accVel
        ShellParts.physics.accVel = {} --. Accellerate until velocity = speed.

        -- deccVel
        ShellParts.physics.deccVel = {} --. Decellerate until speed = zero.

        -- gravity
        ShellParts.physics.gravity = {} --. Drop towards ground based on speed.
    end


ShellPresets = {

    base = {
        isActive = true, -- Still exists.
        hit = false, -- Has hit a valid object.
    },

}

ShellSetAbility()
ShellSetType()
ShellSetHitBehaviour()
