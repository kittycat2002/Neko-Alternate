require "/scripts/status.lua"
function init()
  status.setStatusProperty("nekokek", 2)
  effect.addStatModifierGroup({{stat = "biomecoldImmunity", amount = 1}})
  effect.addStatModifierGroup({{stat = "iceStatusImmunity", amount = 1}})
    self.listener = damageListener("damageTaken", function(note)
        suffer = note[1]["damageDealt"]
        source = note[1]["damageSourceKind"]

        if source == "fire" then
          status.applySelfDamageRequest({
            damageType = "IgnoresDef",
            damage = suffer * 2,
            sourceEntityId = entity.id()
            })
        end
    end)
  script.setUpdateDelta(1)
end
 
function update(dt)
    mcontroller.controlModifiers({
            speedModifier = 1.337,
            airJumpModifier = 1.337
        })
if world.entitySpecies(entity.id()) == "neko" then
status.removeEphemeralEffect("raceneko")
status.removeEphemeralEffect("novakidglow")
end
self.listener:update()
end
 
function input(dt)
  if dt.moves["special"] == 1 then
    if not self.inputSpecial then
      self.inputSpecial = true
    end
  else
    if self.inputSpecial then
      self.inputSpecial = false
    end
  end
  return nil
end

function uninit()

end