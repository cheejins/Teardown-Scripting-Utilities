-- I declared the variable names like this for the sake of easy refactoring and intellisense.
-- do/end are used for level for line folding.
-- The --! are part of a vscode extension that applies colors to comment with symbols like --!, --?, --* and so on. It is called "Better comments".

ShellParts = {}
do

    ShellParts.types = {}
    do

        -- projectiles
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
        ShellParts.physics.deccVel = {} --. Deccellerate until speed = zero.

        -- gravity
        ShellParts.physics.gravity = {} --. Drop towards ground based on speed.
    end

end


Shell = {}
do

    ShellPresets.base = {

        isActive = true, -- Shell still exists.
        hit = false, -- Shell hit a valid object.

    }

end


Shell = {} -- Shell object

-- ShellParts from presets.
ShellSetAbility()
ShellSetType()
ShellSetHitBehaviour()
ShellSetPhysics()
ShellSetParticle()
ShellSetSounds()

-- ShellPresets
ShellSetPreset()