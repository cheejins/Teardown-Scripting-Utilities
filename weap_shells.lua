-- I declared the variable names like this for the sake of easy refactoring and intellisense.
-- do/end are used for level for line folding.
-- The --! are part of a vscode extension that applies colors to comment with symbols like --!, --?, --* and so on. It is called "Better comments".


ShellParts = {}
do

    ShellParts.types = {}
    do

        -- projectiles (follow a quadratic path)
        ShellParts.types.projectiles = {}

            -- bullets
            ShellParts.types.projectiles.bullets = {}

            -- bombs
            ShellParts.types.projectiles.bombs = {}

            -- barrages
            ShellParts.types.projectiles.barrages = {}


        ShellParts.types.pathed = {}

            -- rockets
            ShellParts.types.projectiles.rockets = {}

            -- missiles (homing rockets)
            ShellParts.types.pathed.missiles = {}


        -- hitscan (instant hit)
        ShellParts.types.hitscan = {}

            -- laser
            ShellParts.types.hitscan.laser = {}

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

        -- hole
        ShellParts.hitBehaviours.hole = {}
        -- explosive
        ShellParts.hitBehaviours.explode = {}
        -- combust
        ShellParts.hitBehaviours.combust = {}

    end

end


-- Shell empty preset.
Shell = {

    tr = nil,               -- The Transform() of the shell.

    life = {
        hit = false,        -- Shell has hit a valid object.
        hitcount = 0,       -- Used for bounces.
        isActive = false,   -- Shell still exists.
        isfinished = false, -- Still has finished and is ready for removal.
        lifeLength = 2,     -- How long a shell exists from the time it is spawned.
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
        strength = nil,
        targetBody = nil,
        targetShape = nil,
        targetTr = nil,
    }

}


-- Shell modifiers
do
    Shell.modify_life = function(self, isActive, finished, hit, lifeLength, tr)
        self.hit        = hit
        self.isActive   = isActive
        self.isfinished   = finished
        self.lifeLength = lifeLength
    end

    Shell.modify_query = function(self, ignoreShapes, ignoreBodies, ignoreVehicles, ignoreTags, ignoreLayers)
        self.ignoreBodies   = ignoreBodies
        self.ignoreLayers   = ignoreLayers
        self.ignoreShapes   = ignoreShapes
        self.ignoreTags     = ignoreTags
        self.ignoreVehicles = ignoreVehicles
    end

    Shell.modify_physics = function(self, vel, velStart, velMax, velAcc, velDecc, gravity, waver)
        self.physics.gravity    = gravity
        self.physics.vel        = vel
        self.physics.velAcc     = velAcc
        self.physics.velDecc    = velDecc
        self.physics.velMax     = velMax
        self.physics.velStart   = velStart
        self.physics.waver      = waver
    end

end



-- Shell = {
--     type = {},
--     abilities = {},
--     hitBehaviours = {},
-- }



function SpawnShell(tr, shellPreset, shellQueries)

    local shell = TableClone(shellPreset)

    shell.tr = tr

    table.insert(ActiveShells, shell)

end


-- ShellParts from presets.
Shell.setAbility()
Shell.setHitBehaviour()
Shell.setParticle()
Shell.setPhysics()
Shell.setSounds()
Shell.setType()

-- ShellPresets
-- Shell.setPreset()

-- ShellFunctions
-- Shell.propel()
-- Shell.home() -- Home a shell towards a target position
-- Shell.hit()


--[[

    Things to try
    - Create a base shell (shoots straight, nothing fancy)
    - Create a bullet (shoots straight, slows)
    - Create a projectile (slows down, drops down)
    - Create a rocket (starts slow, dropping, and speeds up)

]]



--[[

    Use cases:

        - Shell spawning

            - Spawn a bullet that ignores body tags
                - tr
                - bullet preset
                    - high vel, small hole

]]