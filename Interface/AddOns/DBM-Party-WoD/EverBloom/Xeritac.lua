local mod	= DBM:NewMod(1209, "DBM-Party-WoD", 5, 556)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 12458 $"):sub(12, -3))
mod:SetCreatureID(84550)
mod:SetEncounterID(1752)--TODO: VERIFY, "Boss 4" isn't descriptive enough
mod:SetZone()
mod:SetReCombatTime(120, 3)--this boss can quickly re-enter combat if boss reset occurs.

mod:RegisterCombat("combat_emotefind", L.Pull)

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 169248 169233 169382",
	"SPELL_PERIODIC_DAMAGE 169223",
	"SPELL_ABSORBED 169223",
	"UNIT_DIED",
	"UNIT_TARGETABLE_CHANGED"
)

--TODO, figure out why the hell emote pull doesn't work. Text is correct.
local warnToxicSpiderling			= mod:NewAddsLeftAnnounce("ej10492", 2, "Interface\\ICONS\\Spell_Nature_Web")
--local warnVenomCrazedPaleOne		= mod:NewSpellAnnounce("ej10502", 3)--I can't find a way to detect these, at least not without flat out scanning all DAMAGE events but that's too much work.
local warnInhale					= mod:NewSpellAnnounce(169233, 3)
local warnPhase2					= mod:NewPhaseAnnounce(2, 2)
local warnConsume					= mod:NewSpellAnnounce(169248, 4)
local warnGaseousVolley				= mod:NewSpellAnnounce(169248, 3)

local specWarnVenomCrazedPaleOne	= mod:NewSpecialWarningSwitch("ej10502", "-Healer")
--local specWarnConsume				= mod:NewSpecialWarningSpell(169248)
local specWarnGaseousVolley			= mod:NewSpecialWarningSpell(169382, nil, nil, nil, 2)
local specWarnToxicGas				= mod:NewSpecialWarningMove(169223)

local voiceConsume					= mod:NewVoice(169248)
local voicePhaseChange				= mod:NewVoice(nil, nil, DBM_CORE_AUTO_VOICE2_OPTION_TEXT)

mod.vb.spiderlingCount = 4
mod.vb.phase2 = false

function mod:OnCombatStart(delay)
	self.vb.spiderlingCount = 4
	self.vb.phase2 = false
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 169233 then
		warnInhale:Show()
	elseif spellId == 169248 then
		warnConsume:Show()
		specWarnVenomCrazedPaleOne:Show()
		voiceConsume:Play("killmob")
	elseif spellId == 169382 then
		warnGaseousVolley:Show()
		specWarnGaseousVolley:Show()
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 169223 and destGUID == UnitGUID("player") and self:AntiSpam(2) then
		specWarnToxicGas:Show()
	end
end
mod.SPELL_ABSORBED = mod.SPELL_PERIODIC_DAMAGE

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 84552 then
		self.vb.spiderlingCount = self.vb.spiderlingCount - 1
		if self.vb.spiderlingCount > 0 then--Don't need to warn 0, phase 2 kind of covers that 1.4 seconds later.
			warnToxicSpiderling:Show(self.vb.spiderlingCount)
		end
	end
end

function mod:UNIT_TARGETABLE_CHANGED()
	if not self.vb.phase2 then
		self.vb.phase2 = true
		warnPhase2:Show()
		voicePhaseChange:Play("ptwo")
	end
end
