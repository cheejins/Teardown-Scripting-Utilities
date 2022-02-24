-- I declared the variable names like this for the sake of easy refactoring and intellisense.
-- do/end are used for level for line folding.
-- The --! are part of a vscode extension that applies colors to comment with symbols like --!, --?, --* and so on. It is called "Better comments".


ShellParts = {}
do

    ShellParts.types = {}
    do

        -- projectiles (free projectiles)
        -- simple free moving, unmanaged
        ShellParts.types.projectiles = {}

            -- -- bullets
            -- ShellParts.types.projectiles.bullets = {}

            -- -- bombs
            -- ShellParts.types.projectiles.bombs = {}

            -- -- barrages
            -- ShellParts.types.projectiles.barrages = {}


        -- shells which follow a path. used for predicted hit position
        -- source and target pos is based on time and physics properties.
        ShellParts.types.pathed = {}

            -- -- rockets
            -- ShellParts.types.pathed.rockets = {}

            -- -- missiles (homing rockets)
            -- ShellParts.types.pathed.missiles = {}

        -- ray (instant raycast hit)
        -- long raycast shot
        -- effect from source to target
        ShellParts.types.ray = {}

            -- -- laser
            -- ShellParts.types.ray.laser = {}


    end


    -- ShellParts.abilities = {}
    -- do
    --     -- homing
    --     ShellParts.abilities.homing = {}
    --     -- barrage
    --     ShellParts.abilities.barrage = {}
    -- end


    ShellParts.hitBehaviours = {}
    do
        -- sticky
        ShellParts.hitBehaviours.sticky = {
            -- hit = stick to a shape
            -- wait until calling hit action
                -- fx function or something
                    -- halo plasma grenade
                    -- semtex
                    -- no fx
        }
        -- bouncy
        ShellParts.hitBehaviours.bouncy = {
            -- set tr to dir normal
        }
        -- water
        ShellParts.hitBehaviours.water = {
            -- decide if water ends the shell.
        }
    end

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

    id = 0,

    life = {
        isValid = true,             -- Shell is ready for removal from this strange existence we find ourselves in.
        isActive = false,           -- Shell is operating (false = stop processing shell functions).

        hit = false,                -- Shell has hit a valid object.
        hitsCount = 0,              -- Used for bounces.
        hitsMax = 1,                -- Used for bounces.

        timeOfSpawn = GetTime(),    -- When the shell was spawned according the the game time.
        timeActive = 0,             -- Time duration the shell has been active.
        timeActiveMax = 0,          -- How long a shell exists from the time it is spawned.
    },

    query = {
        ignoreShapes = {},
        ignoreBodies = {},
        ignoreVehicles = {},
        ignoreLayers = {},
    },

    physics = {
        tr = nil,                   -- The Transform() of the shell.
        vel = 0,
        velMax = 0,
        velStart = 0,
        velDelay = 0,
        velAcc = 0,
        velDecc = 0,
        gravity = 0,
        waver = 0,                  -- How much the shell wavers based on speed.
    },

    homing = {
        sourceTr = nil,
        targetBody = nil,
        targetShape = nil,
        targetTr = nil,
        strength = nil,
    },

    effects = {
        particlesPreset = {},
        soundsPreset = {},
    }

}


-- Shell modifiers
do

    Shell.set_part = function(partTableIndex, ...)

        local tb = table.unpack({...})

        for index, value in pairs(tb) do
            self[partTableIndex][index] = value -- Shell parts are tables on the first level of the shell. Reference their index and iterate/replace all values.
        end

    end

end


-- ShellParts from presets.
Shell_SetAbility = function(self)
end

Shell_SetHitBehaviour = function(self)
end

Shell_SetParticle = function(self)
end

Shell_SetPhysics = function(self)
end

Shell_SetSounds = function(self)
end

Shell_SetType = function(self)
end


-- ShellFunctions
Shell_Propel = function(self)
    -- change the shell tr based on the physics of the shell.

    if self.physics.vel < self.physics.velMax then
    end

    -- durations based on game time and at what time the shell was spawned

    -- waver
    -- gravity

    -- Replace the transform of the shell with the modified transform.

end

Shell_Home = function(self)
    -- home a shell towards a target position
    -- change rotation of the shell based on the speed of the shell and the homing strength.
end

Shell_Hit = function(self)
end


---Spawn a shell preset
---@param tr table
---@param shellPreset table
function SpawnShell(tr, shellPreset, rejectShapes, rejectBodies, rejectVehicles)

    local shell = TableClone(shellPreset)

    shell.tr = tr
    shell:applyPreset(shellPreset)

    QueryRejectAll(rejectShapes, rejectBodies, rejectVehicles)

    table.insert(ActiveShells, shell)

end
