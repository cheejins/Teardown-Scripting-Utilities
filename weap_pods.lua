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


---Create a pod and assign it to a shape.
---@param shape any
---@param pod_preset any
---@param shell any
---@param shoot_pos any
function PodCreate(shape, pod_preset, shell, shoot_pos)
    -- Pod
        -- shape: shape (vehicle or external turret shape within vehicle body)
        -- location: shootPos (TTLP)
        -- table: type (turret, launcher, laser, bomb)
        -- table: shell
        -- number: rpm
        -- number: chargeUp (Duration to charge before shooting. Used for lasers and railguns)

    -- return pod
end

function PodRemove()
end
function PodSetEnabled(bool)
end

PodSetWeaponPod(shape, weaponPodPreset)
PodShootShell(tr, activeShells)
PodCharge()
PodReload()