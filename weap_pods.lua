POD_ID = 0 -- Keeps track of unique pod IDs


Pods = {} -- All Pod objects.
Pod = {} -- Pod object template.
PodGroups = {} -- Grouped pods arrange how and when to shoot their pods.


function Pods_Init()

    PodShapes = FindShapes('pod', true)

    -- Create all pods in the scene.
    for key, shape in pairs(PodShapes) do
        Pod_Create(shape)
    end

    -- Print pod tables in console.
    for key, pod in pairs(Pods) do
        printTable(pod)
    end

end


function Pods_Run()
    for key, pod in pairs(Pods) do

        pod:Update()

    end
end


function Pods_Debug()

    dbw('POD_ID', POD_ID)

    for key, pod in pairs(Pods) do

        dbdd(pod.tr.pos, 0.25,0.25, 1,1,1, 1)

    end

end


---Create a pod and assign it to a shape.
---@param shape any
---@param location any
---@param pod_preset any
---@param shell any
---@param shoot_pos any
function Pod_Create(shape, location, pod_preset, shell, shoot_pos)

    local pod = {}


    POD_ID = POD_ID + 1
    pod.id = POD_ID

    pod.shape = shape
    pod.type = Pod_Types.projectile


    pod.tr = GetShapeWorldTransform(shape) -- Shape tr.
    pod.relTr = TransformToLocalTransform(GetShapeWorldTransform(shape), GetLocationTransform(location)) -- Shoot tr relative to shape tr. -- Location transform relative to shape transform.
    pod.shootTr = TransformToParentTransform(pod.tr, pod.relTr) -- Actual shoot transform.


    pod.status = {
        isActive    = true,
        isShooting  = false,
        didShoot    = false,
        didReload   = false,
        isReloading = false,
        isCharging  = false,
    }

    pod.timers = {
        charge = TimerCreate(0, 60),
        shoot = TimerCreate(0, 240), -- Shoot duration.
        cooldown = TimerCreate(0, 30), -- Cooldown after shoot timer depletes.
    }

    pod.shooting = {
        ammo = 0,
        reloads = 0,
        reloadSize = 0,
    }


    table.insert(Pods, pod)

end

function Pod:Update()

    self.tr = GetShapeWorldTransform(self.shape)
    self.shootTr = TransformToParentTransform(self.tr, self.relTr)

end


function Pod:Shoot(tr, activeShells) -- Shoot based on pod type (charge)

    if self.timers.cooldown.rpm == 0 or self.timers.cooldown.time <= 0 then

        if self.timers.shoot.time <= 0 then

            if InputDown('lmb') and self.shooting.ammo >= 1 then

                self.shooting.ammo = self.shooting.ammo - 1

                beep()

                TimerResetTime(self.timers.shoot)
            end

        end

    else

        TimerRunTimer(self.timers.cooldown)

    end

    -- Always run shoot timer.
    if self.timers.shoot.time > 0 then
        TimerRunTimer(self.timers.shoot)
    end

end


function Pod:Delete() end
function Pod:ShootShell(tr, activeShells) end -- No charge timers, just shoot.
function Pod:Charge() end -- charge speed, cooldown speed
function Pod:Reload() end -- reload speed (individual vs shell by shell)

function Pod:SetActive(enabled) end


-- pod group shoot behaviours
    -- synced
    -- sequential
    -- random fire
    -- quadratic rpm
    -- burst


Pod_Presets = {}

Pod_Types = {
    projectile = 'projectile',
    ray = 'ray',
}
