function ParticleSetPreset(p)

    ParticleReset()

    ParticleColor(p.color[1], p.color[2], p.color[3])
    ParticleAlpha(p.alpha[1], p.alpha[2])
    ParticleEmissive(p.emis[1], p.emis[2])
    ParticleDrag(0, .3)
    ParticleTile(p.tile)

    ParticleRadius(p.rad[1], p.rad[2])
    ParticleGravity(p.grav[1], p.grav[2])
    ParticleCollide(p.coll)


end


ParticlePreset = {

    color   = Vec(),

    alpha   = {a, b},
    emis    = {a, b},
    drag    = {a, b},
    tile    = n,

    rad     = {a, b},
    grav    = {a, b},
    coll    = n,

}



function ParticleCreatePreset()

    ParticlePresets = {

        ParticleCreatePreset,

        color   = Vec(),
        alpha   = {a, b},
        emis    = {a, b},
        drag    = {a, b},
        tile    = n,

        rad     = {a, b},
        grav    = {a, b},
        coll    = n,

    }

end


function SpawnParticlePreset(tr, velScale, duration)
    
end