do

    local bodies = {--[[whicever bodies are relevant]]}
    local jointTags = {'leftJoint', 'rightJoint'} -- joint tags

    local bodyJoints = {}

    for b = 1, #bodies do -- for each body
        local body = bodies[b]

        local jointsInBody = {}

        local shapes = GetBodyShapes(body) -- table of shapes in the body

        for s = 1, #shapes do -- for each shape in the body
            local shape = shapes[s] -- current shape

            local shapeJoints = GetShapeJoints(shape) -- all joints in the current shape

            for sj = 1, #shapeJoints do -- check each shape's joint
                local shapeJoint = shapeJoints[sj]

                for jt = 1, #jointTags do -- check each shape joint's tag.
                    local jointTag = jointTag[jt] -- joint tag string.

                    if HasTag(shapeJoint, jointTag) then -- check each possible joint tag for each shape.

                        jointsInBody[jointTag] = shapeJoint -- the tag string will be the index for its respective joint reference.

                    end

                end

            end

        end

        -- At the end of each body loop, add all of the joints in the body to bodyJoints at the index [body]
        bodyJoints[body] = jointsInBody

    end

    -- Every joint in the body must have a unique name.
    local leftJoint = bodyJoints[body]['leftJoint']
    local rightJoint = bodyJoints[body]['rightJoint']

end
