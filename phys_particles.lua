function SpawnParticlePreset(tr, velScale, duration)
    ParticleReset()
end

function ParticleSetPreset(p)

    ParticleColor(p.color[1], p.color[2], p.color[3])
    ParticleAlpha(p.alpha[1], p.alpha[2])
    ParticleEmissive(p.emis[1], p.emis[2])
    ParticleDrag(0, .3)
    ParticleTile(p.tile)

    ParticleRadius(p.rad[1], p.rad[2])
    ParticleGravity(p.grav[1], p.grav[2])
    ParticleCollide(p.coll)

end

function ParticleCreatePreset()

    particlePreset = {

        -- Core
        type = '', -- 'smoke', 'plain'

        -- Visual
        color   = {Vec(), Vec()},
        alpha   = {a,b, i, fi,fo},
        emis    = {a, b},
        drag    = {a, b},
        tile    = i, -- 0-15

        -- Physics
        rad     = {a,b, i, fi,fo},
        grav    = {a,b, i, fi,fo},
        coll    = n,

    }

end



InterpolationPreset = {
    y1 = 1,
    y2 = 1,
    type = InterpolationSets.standard.linear,
}

InterpolationPresets = {

    linear = BuildInterpolationSet(InterpolationTypes.linear)

}

function BuildInterpolationSet()

end



InterpolationModifier = {

    rampInc = function(self)

    end,

    rampDec = function(self, y)
        BuildInterpolationSet(InterpolationTypes.linear),
    end,

}



InterpolationSets = {

    standard = {
        linear = BuildInterpolationSet(InterpolationTypes.linear),
        smooth = BuildInterpolationSet(InterpolationTypes.smooth),
        easein = BuildInterpolationSet(InterpolationTypes.easein),
        easeout = BuildInterpolationSet(InterpolationTypes.easeout),
        constant = BuildInterpolationSet(InterpolationTypes.constant),
    }

}

InterpolationTypes = {
    linear = 'linear',
    smooth = 'smooth',
    easein = 'easein',
    easeout = 'easeout',
    constant = 'constant',
}



ParticlePreset = {

    -- Linear
    color   = Vec(),
    alpha   = {a, b},

    -- Interpolated
    -- emis    = {a, b},
    -- drag    = {a, b},
    -- tile    = n,

    -- rad     = {a, b},
    -- grav    = {a, b},
    -- coll    = n,

}
