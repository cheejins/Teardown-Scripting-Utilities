-- I declared the variable names like this for the sake of easy refactoring and intellisense.
-- do/end are used for level for line folding.
-- The --! are part of a vscode extension that applies colors to comment with symbols like --!, --?, --* and so on. It is called "Better comments".


ShellParts = {}
do

    ShellParts.types = {}
    do

        -- projectiles (free projectiles)
        ShellParts.types.projectiles = {}

            -- -- bullets
            -- ShellParts.types.projectiles.bullets = {}

            -- -- bombs
            -- ShellParts.types.projectiles.bombs = {}

            -- -- barrages
            -- ShellParts.types.projectiles.barrages = {}


        -- shells which follow a path. used for predicted hit position
        ShellParts.types.pathed = {}

            -- -- rockets
            -- ShellParts.types.pathed.rockets = {}

            -- -- missiles (homing rockets)
            -- ShellParts.types.pathed.missiles = {}

        -- hitscan (instant raycast hit)
        ShellParts.types.hitscan = {}

            -- -- laser
            -- ShellParts.types.hitscan.laser = {}

    end


    -- ShellParts.abilities = {}
    -- do
    --     -- homing
    --     ShellParts.abilities.homing = {}
    --     -- barrage
    --     ShellParts.abilities.barrage = {}
    -- end


    -- ShellParts.hitBehaviours = {}
    -- do
    --     -- sticky
    --     ShellParts.hitBehaviours.sticky = {
    --         -- hit = stick to a shape
    --         -- wait until calling hit action
    --             -- fx function or something
    --                 -- halo plasma grenade
    --                 -- semtex
    --                 -- no fx
    --     }
    --     -- bouncy
    --     ShellParts.hitBehaviours.bouncy = {
    --         -- set tr to dir normal
    --     }
    -- end

    -- ShellParts.hitActions = {}
    -- do
    --     -- penetrating
    --     ShellParts.hitActions.penetrating = {
    --         -- rate of speed decc in %
    --     }

    --     -- hole
    --     ShellParts.hitActions.hole = {
    --         -- hole size
    --     }

    --     -- explosive
    --     ShellParts.hitActions.explode = {
    --         -- explosion size
    --         -- explosion delay
    --         -- explosion cluster
    --     }

    --     -- combust
    --     ShellParts.hitActions.combust = {
    --         -- particles follow spread
    --         -- spread speed
    --         -- spread radius
    --     }
    -- end

end


-- Shell empty preset.
Shell = {

    tr = nil,               -- The Transform() of the shell.

    life = {
        hit = false,        -- Shell has hit a valid object.
        hitcount = 0,       -- Used for bounces.
        isActive = false,   -- Shell still exists.
        isfinished = false, -- Still has finished and is ready for removal.
        activeTime = 0,     -- Duration the shell has been active.
        activeDuration = 2, -- How long a shell exists from the time it is spawned.
    },

    query = {
        ignoreBodies = {},
        ignoreLayers = {},
        ignoreShapes = {},
        ignoreTags = {}, -- Ignore tags attached to bodies and shapes.
        ignoreVehicles = {},
    },

    physics = {
        gravity = 0,
        vel = 0,
        velAcc = 0,
        velDecc = 0,
        velDelay = 0,
        velMax = 0,
        velStart = 0,
        waver = 0, -- How much the shell.
    },

    homing = {
        sourceTr = nil,
        targetBody = nil,
        targetShape = nil,
        targetTr = nil,
        strength = nil,
    }

}


-- Shell modifiers
do

    Shell.set_life = function(...)

        local tb = table.unpack({...})
        for index, value in pairs(tb) do
            self.life[index] = value
        end

    end

    Shell.set_part = function(partTableIndex, ...)

        local tb = table.unpack({...})
        for index, value in pairs(tb) do
            self[partTableIndex][index] = value -- shell parts are tables on the first level of the shell.
        end

    end

    -- Shell.set_life = function(self, isActive, finished, hit, activeDuration)
    --     self.life.hit = hit
    --     self.life.isActive = isActive
    --     self.life.isfinished = finished
    --     self.life.activeDuration = activeDuration
    -- end


    -- Shell.set_query = function(self, ignoreShapes, ignoreBodies, ignoreVehicles, ignoreTags, ignoreLayers)
    --     self.query.ignoreBodies = ignoreBodies
    --     self.query.ignoreLayers = ignoreLayers
    --     self.query.ignoreShapes = ignoreShapes
    --     self.query.ignoreTags = ignoreTags
    --     self.query.ignoreVehicles = ignoreVehicles
    -- end

    -- Shell.set_physics = function(self, vel, velStart, velMax, velAcc, velDecc, gravity, waver)
    --     self.physics.gravity = gravity
    --     self.physics.vel = vel
    --     self.physics.velAcc = velAcc
    --     self.physics.velDecc = velDecc
    --     self.physics.velMax = velMax
    --     self.physics.velStart = velStart
    --     self.physics.waver = waver
    -- end


end


-- -- ShellParts from presets.
-- Shell.setAbility = function(self)
-- end
-- Shell.setHitBehaviour = function(self)
-- end
-- Shell.setParticle = function(self)
-- end
-- Shell.setPhysics = function(self)
-- end
-- Shell.setSounds = function(self)
-- end
-- Shell.setType = function(self)
-- end
-- -- ShellFunctions
-- Shell.propel = function(self)
--     -- change the shell tr based on the physics of the shell.
-- end
-- Shell.home = function(self)
--     -- home a shell towards a target position
--     -- change rotation of the shell based on the speed of the shell and the homing strength.
-- end
-- Shell.hit()






function SpawnShell(tr, shellPreset, shellQueries)

    local shell = TableClone(shellPreset)

    shell.tr = tr

    table.insert(ActiveShells, shell)

end


--[[
    Things to try
    - Create a base shell (shoots straight, nothing fancy)
    - Create a bullet (shoots straight, slows)
    - Create a projectile (slows down, drops down)
    - Create a rocket (starts slow, dropping, and speeds up)
]]
