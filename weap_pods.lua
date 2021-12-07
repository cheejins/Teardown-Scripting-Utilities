Pods = {}

Pod = {} -- Base preset
do

    Pod = {}
    Pod.isActive    = true
    Pod.isShooting  = false
    Pod.didShoot    = false
    Pod.didReload   = false
    Pod.isReloading = false
    Pod.isCharging  = false

end

---comment
---@param shape shape
---@param preset table
---@param shell table
---@param shootPos table
function PodCreatePod(shape, preset, shell, shootPos)
    -- Pod
        -- shape: shape (vehicle or external turret shape within vehicle body)
        -- location: shootPos (TTLP)
        -- table: type (turret, launcher, laser, bomb)
        -- table: shell
        -- number: rpm
        -- number: chargeUp (Duration to charge before shooting. Used for lasers and railguns)

    return pod
end
function PodDeletePod()
end
function PodSetEnabled(bool)
end


PodSetWeaponPod(shape, weaponPodPreset)
PodShoot(pod, shell)
PodShootShell(tr, activeShells)