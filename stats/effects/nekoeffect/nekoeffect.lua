require "/scripts/status.lua"
function init()
  status.setStatusProperty("nekokek", 2)
  effect.addStatModifierGroup({{stat = "biomecoldImmunity", amount = 1}})
  effect.addStatModifierGroup({{stat = "iceStatusImmunity", amount = 1}})
  -- This under is what you should look at.
    self.listener = damageListener("damageTaken", function(note)
        suffer = note[1]["damageDealt"]
        source = note[1]["damageSourceKind"]

        
        --sb.logWarn("%s", note)
        if source == "fire" then
          status.applySelfDamageRequest({
            damageType = "IgnoresDef",
            damage = suffer * 2, --2x fire damage much much cleaner shit than before. or simply 3x because this reapplies the damage.
            sourceEntityId = entity.id()
            })
            --status.modifyResource("health", -suffer * 2) --Take 3x in fire damage because no fire is bad.
        end
    end)
  script.setUpdateDelta(1) --ohh I love update rates like that wink wink
end
 
function update(dt)
    mcontroller.controlModifiers({
            speedModifier = 1.337,
            airJumpModifier = 1.337
        })
if world.entitySpecies(entity.id()) == "neko" then --Removes frackin' races YOU FUCKiN' RACIST!?!?!!?!
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

--Authors note I'm the biggest arsehole on this planet :P ^
--Authors note most racial effects are going to be gone :)
--if entity.entityType() == "npc" and world.enitiySpecies(enitiy.id()) ~= "neko" then
--
--
--end
--setAgressive("agressive" = true)
--npc.setDamageTeam{type = "enemy", team = 2}
--world.sendEntityMessage
--world.sendEntityMessage(enitiyid(npc), messageType )

--Note go back to this when your brain is not fucked. And that may take a while.
--... I will have to check this later when I'm done with school work shit...