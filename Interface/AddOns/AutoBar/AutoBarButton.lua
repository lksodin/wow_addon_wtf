--
-- AutoBarButton
-- Copyright 2007+ Toadkiller of Proudmoore.
--
-- Buttons for AutoBar
-- http://muffinmangames.com
--

local AutoBar = AutoBar
local spellNameList = AutoBar.spellNameList
local spellIconList = AutoBar.spellIconList

local AceOO = AceLibrary("AceOO-2.0")
local LibKeyBound = LibStub("LibKeyBound-1.0")
local L = AutoBar.locale
local _G = getfenv(0)
local _


AutoBarButton = AceOO.Class(AutoBar.Class.Button)
AutoBarButton.dirtyButton = {}


spellNameList["Lay on Hands"], _, spellIconList["Lay on Hands"] = AutoBar:LoggedGetSpellInfo(633)
spellNameList["Feign Death"], _, spellIconList["Feign Death"] = AutoBar:LoggedGetSpellInfo(5384)
spellNameList["Disengage"], _, spellIconList["Disengage"] = AutoBar:LoggedGetSpellInfo(781)
spellNameList["Ice Block"], _, spellIconList["Ice Block"] = AutoBar:LoggedGetSpellInfo(27619)
spellNameList["Last Stand"], _, spellIconList["Last Stand"] = AutoBar:LoggedGetSpellInfo(12975)
spellNameList["Desperate Prayer"], _, spellIconList["Desperate Prayer"] = AutoBar:LoggedGetSpellInfo(19236)

spellNameList["Vanish"], _, spellIconList["Vanish"] = AutoBar:LoggedGetSpellInfo(1856)
spellNameList["Nature's Swiftness"], _, spellIconList["Nature's Swiftness"] = AutoBar:LoggedGetSpellInfo(132158)
spellNameList["Frenzied Regeneration"], _, spellIconList["Frenzied Regeneration"] = AutoBar:LoggedGetSpellInfo(22842)
spellNameList["Shadowform"], _, spellIconList["Shadowform"] = AutoBar:LoggedGetSpellInfo(15473)
spellNameList["Wild Charge"], _, spellIconList["Wild Charge"] = AutoBar:LoggedGetSpellInfo(102401)
spellNameList["Rune Tap"], _, spellIconList["Rune Tap"] = AutoBar:LoggedGetSpellInfo(48982)
spellNameList["Bear Form"], _, spellIconList["Bear Form"] = AutoBar:LoggedGetSpellInfo(5487)
spellNameList["Mangle"], _, spellIconList["Mangle"] = AutoBar:LoggedGetSpellInfo(33917)
spellNameList["Cat Form"], _, spellIconList["Cat Form"] = AutoBar:LoggedGetSpellInfo(768)
spellNameList["Ghost Wolf"], _, spellIconList["Ghost Wolf"] = AutoBar:LoggedGetSpellInfo(2645)
spellNameList["Shadowstep"], _, spellIconList["Shadowstep"] = AutoBar:LoggedGetSpellInfo(36554)
spellNameList["Charge"], _, spellIconList["Charge"] = AutoBar:LoggedGetSpellInfo(100)
spellNameList["Heroic Leap"], _, spellIconList["Heroic Leap"]  = AutoBar:LoggedGetSpellInfo(6544)
spellNameList["Intervene"], _, spellIconList["Intervene"]  = AutoBar:LoggedGetSpellInfo(3411)
spellNameList["Enraged Regeneration"] = AutoBar:LoggedGetSpellInfo(55694)




function AutoBarButton.prototype:init(parentBar, buttonDB)
	AutoBarButton.super.prototype.init(self, parentBar, buttonDB)
end


-- Return the interface display name
function AutoBarButton:GetDisplayName(buttonDB)
	local name
	if (buttonDB.name) then
		name = tostring(buttonDB.name)
	else
		name = L[buttonDB.buttonKey] or L["Custom"]
	end
	return name
end


-- Handle dragging of items, macros, spells to the button
-- Handle rearranging of buttons when buttonLock is off
function AutoBarButton:AddCategoryItem(category, itemType, itemId, itemInfo)
	local categoryInfo = AutoBarCategoryList[category]
	local itemsListDB = categoryInfo.customCategoriesDB.items
	local itemIndex = # itemsListDB + 1
--AutoBar:Print("AutoBarButton.prototype:DropLink " .. tostring(categoryInfo.description) .. "itemType " .. tostring(itemType) .. " itemId " .. tostring(itemId) .. " itemInfo " .. tostring(itemInfo))
	local itemDB = {
		itemType = itemType,
		itemId = itemId,
		itemInfo = itemInfo
	}
	itemsListDB[itemIndex] = itemDB
	if (itemType == "spell") then
		local spellName, spellRank = GetSpellBookItemName(itemId, itemInfo)
		itemDB.spellName = spellName
		itemDB.spellRank = spellRank
		itemDB.spellClass = AutoBar.CLASS
	else
		itemDB.spellName = nil
		itemDB.spellRank = nil
		itemDB.spellClass = nil
	end
end


-- Handle dragging of items, macros, spells to the button
-- Handle rearranging of buttons when buttonLock is off
function AutoBarButton.prototype:DropLink(itemType, itemId, itemInfo)
	if (itemType == "item" or itemType == "spell" or itemType == "macro") then
		-- Select a Custom Category to use
		local categoryInfo, categoryKey, dropped
		for index = # self, 1, -1 do
			categoryKey = self[index]
			categoryInfo = AutoBarCategoryList[categoryKey]

			if (categoryInfo and categoryInfo.customKey) then
				AutoBarButton:AddCategoryItem(categoryKey, itemType, itemId, itemInfo)
				AutoBar:BarButtonChanged()
				dropped = true
				break
			end
		end

		-- Create a Custom Category to use
		local buttonDB = self.buttonDB
		if (not dropped and buttonDB.drop) then
			local buttonCategoryIndex = # buttonDB + 1
			local categoryKey = AutoBar:CategoryNew()
			buttonDB[buttonCategoryIndex] = categoryKey
			AutoBarButton:AddCategoryItem(categoryKey, itemType, itemId, itemInfo)
			AutoBar:BarButtonChanged()
		end
	end
end


-- Handle dragging of items, macros, spells to the button
-- Handle rearranging of buttons when buttonLock is off
function AutoBarButton.prototype:DropObject()
	local toObject = self
	local fromObject = AutoBar:GetDraggingObject()
	local refreshNeeded
--AutoBar:Print("AutoBarButton.prototype:DropObject " .. tostring(fromObject and fromObject.buttonDB.buttonKey or "none") .. " --> " .. tostring(toObject.buttonDB.buttonKey))
	if (fromObject and fromObject ~= toObject and AutoBar.moveButtonsMode) then
		AutoBar:ButtonMove(fromObject.parentBar.barKey, fromObject.order, toObject.parentBar.barKey, toObject.order)
		AutoBar:BarButtonChanged()
		ClearCursor()
	else
		local buttonDB = toObject.buttonDB
		if (buttonDB.hasCustomCategories and AutoBar.moveButtonsMode or buttonDB.drop) then
			local itemType, itemId, itemInfo = GetCursorInfo()
			if (itemType == "item" or itemType == "spell" or itemType == "macro") then
--AutoBar:Print("AutoBarButton.prototype:DropObject itemType " .. tostring(itemType) .. " itemId " .. tostring(itemId) .. " itemInfo " .. tostring(itemInfo))
				toObject:DropLink(itemType, itemId, itemInfo)
				refreshNeeded = true
				ClearCursor()
				AutoBar:CategoriesChanged()
			end
		end
	end

	if (refreshNeeded) then
		if (fromObject) then
			fromObject:UpdateButton()
		end
	end
	AutoBar:SetDraggingObject(nil)
end



-- popupNazi makes sure we dont have multiple popups open.  Google "Soup Nazi" for how this is done
-- There are two cases:

--	1) Rapid movement or movement off the window breaks the Blizzard code.  We use a sensible timer to fix this - popupNaziSnippet
local popupNaziSnippet = [[
	local flag = self:IsUnderMouse(true)
	if (flag) then
		local queued = control:SetTimer(1, "hoverCheck")
	else
		local anchorButton = self:GetFrameRef("anchorButton")
		x, y = anchorButton:GetMousePosition()
		if (x and y) then
			local queued = control:SetTimer(1, "hoverCheck")
		else
			self:Hide()
		end
	end
]]

--	2) Track the popped open menu.  If we open a new one we sensibly close the old one - popupNaziHandler
local popupNaziHandler = CreateFrame("Frame", "AutoBarPopupNaziHandler", nil, "SecureHandlerAttributeTemplate")
popupNaziHandler:SetAttribute("_onattributechanged", [[
	local openHandler = self:GetAttribute("openhandler")
	if (name == "openhandler") then
		local openHandler = self:GetAttribute("openhandler")
		local oldOpenHandler = self:GetAttribute("oldopenhandler")
		if (oldOpenHandler and oldOpenHandler ~= openHandler) then
--			print("hiding old one", oldOpenHandler, openHandler)
			oldOpenHandler:Hide()
		end
		self:SetAttribute("oldopenhandler", openHandler)
	end
]])


-- The basic idea is to have an intervening handler frame that is Shown / Hidden if popupOnModifier is true / nil
local snippetPopupKey = [[
	if (newstate == "1") then
		self:Show()
	else
		self:Hide()
	end
]]
local popupKeyStates = "[modifier:shift] 1; 0"

-- Clone the popup into the anchorButton
local snippetOnClick = [[
	local popupHeader = self:GetFrameRef("popupHeader")
	local anchorButton = popupHeader:GetFrameRef("anchorButton")

	-- Move the attributes that make the button work
	local itemType = self:GetAttribute("type")
	local itemType1 = self:GetAttribute("type1")
	if(itemType1) then
		anchorButton:SetAttribute("type1", self:GetAttribute("type1"))
		anchorButton:SetAttribute("target-slot1", self:GetAttribute("target-slot1"))
		anchorButton:SetAttribute("target-bag1", self:GetAttribute("target-bag1"))	
		anchorButton:SetAttribute("item1", self:GetAttribute("item1"))
		anchorButton:SetAttribute("spell1", self:GetAttribute("spell1"))
	end
	anchorButton:SetAttribute("type", self:GetAttribute("type"))
	anchorButton:SetAttribute("unit", self:GetAttribute("unit"))
	anchorButton:SetAttribute("target-slot", self:GetAttribute("target-slot"))
	anchorButton:SetAttribute("target-bag", self:GetAttribute("target-bag"))	

	if (itemType == "item") then
		anchorButton:SetAttribute("item", self:GetAttribute("item"))
	elseif (itemType == "spell") then
		anchorButton:SetAttribute("spell", self:GetAttribute("spell"))
	elseif (itemType == "macro") then
		anchorButton:SetAttribute("macro", self:GetAttribute("macro"))
		anchorButton:SetAttribute("macrotext", self:GetAttribute("macrotext"))
		anchorButton:SetAttribute("macroName", self:GetAttribute("macroName"))
		anchorButton:SetAttribute("macroBody", self:GetAttribute("macroBody"))
	end

	-- Move the right click attributes
	itemType = self:GetAttribute("type2")
	anchorButton:SetAttribute("type2", self:GetAttribute("type2"))
	anchorButton:SetAttribute("target-slot2", self:GetAttribute("target-slot2"))
	anchorButton:SetAttribute("target-bag2", self:GetAttribute("target-bag2"))
	anchorButton:SetAttribute("unit2", self:GetAttribute("unit2"))
	if (itemType == "item") then
		anchorButton:SetAttribute("item2", self:GetAttribute("item2"))
	elseif (itemType == "spell") then
		anchorButton:SetAttribute("spell2", self:GetAttribute("spell2"))
	elseif (itemType == "macro") then
		anchorButton:SetAttribute("macro2", self:GetAttribute("macro2"))
		anchorButton:SetAttribute("macrotext2", self:GetAttribute("macrotext2"))
	end

	-- Tooltip and Icon support
	anchorButton:SetAttribute("category", self:GetAttribute("category"))
	anchorButton:SetAttribute("itemId", self:GetAttribute("itemId"))
	anchorButton:SetAttribute("icon", self:GetAttribute("icon"))
	anchorButton:SetAttribute("itemLink", self:GetAttribute("itemLink"))

	-- Arrange on Use source popup button
	anchorButton:SetAttribute("sourceButton", self)
]]

-- Clicking on a popup changes the anchor button spell.  This updates the icon texture to match
local function UpdateIcon(button, texture)
	button.icon:SetTexture(texture)
end

-- Clicking on a popup changes the anchor button spell.  This updates the icon texture to match
local function UpdateHandlers(frame, sourceButton)
	sourceButton = frame:GetAttribute("sourceButton")
	local TooltipSet = frame:GetAttribute("TooltipSet")
---print("UpdateHandlers", sourceButton, TooltipSet, frame.TooltipSet)
	frame.TooltipSet = TooltipSet

	local itemId
	local buttonKey = frame.class.buttonName
	local itemType = frame:GetAttribute("type")
	if (itemType) then
		if (itemType == "item") then
			itemId = frame:GetAttribute("itemId")
		elseif (itemType == "spell") then
			itemId = frame:GetAttribute("spell")
		elseif (itemType == "macro") then
			itemId = frame:GetAttribute("macroId")
		end
	end

	local buttonData = AutoBar.db.char.buttonDataList[buttonKey]
	if (not buttonData) then
		buttonData = {}
		AutoBar.db.char.buttonDataList[buttonKey] = buttonData
	end

	buttonData.arrangeOnUse = itemId
end



local MAX_POPUP_HEIGHT = 8

-- Lay out the popups
function AutoBarButton.prototype:SetupPopups(nItems)
	local buttonKey = self.buttonDB.buttonKey
	local frame = self.frame
	local popupHeader = frame.popupHeader
	local popupKeyHandler = frame.popupKeyHandler
	local barKey = self.parentBar.barKey
	local layoutDB = AutoBar.barLayoutDBList[barKey]

	local padding = layoutDB.padding
	local hitRectPadding = -math.max(4, padding)
	local popupDirection = layoutDB.popupDirection
	local relativeSide, side, splitRelativeSide, splitSide
	local paddingX, paddingY, splitPaddingX, splitPaddingY = 0, 0, 0, 0
	if (popupDirection == "1") then	-- Top
		side = "BOTTOM"
		relativeSide = "TOP"
		paddingY = padding
		splitSide = "LEFT"
		splitRelativeSide = "RIGHT"
		splitPaddingX = padding
	elseif (popupDirection == "2") then -- Left
		side = "RIGHT"
		relativeSide = "LEFT"
		paddingX = -padding
		splitSide = "BOTTOM"
		splitRelativeSide = "TOP"
		splitPaddingY = padding
	elseif (popupDirection == "3") then -- Bottom
		side = "TOP"
		relativeSide = "BOTTOM"
		paddingY = -padding
		splitSide = "RIGHT"
		splitRelativeSide = "LEFT"
		splitPaddingX = -padding
	elseif (popupDirection == "4") then -- Right
		side = "LEFT"
		relativeSide = "RIGHT"
		paddingX = padding
		splitSide = "TOP"
		splitRelativeSide = "BOTTOM"
		splitPaddingY = -padding
	end

	-- For gigantic popups, split it up into a block
	local nSplits = math.ceil(nItems / MAX_POPUP_HEIGHT)
	local splitLength, splitRelativePoint
	if (nSplits > 1) then
		splitLength = math.ceil(nItems / nSplits)
	else
		splitLength = nItems + 10
	end

	-- Arrange on Use Buttons show the first Button because it needs to remain there for changes during combat.
	local arrangeOnUse = self.buttonDB.arrangeOnUse
	local popupIndexStart = 2
	if (arrangeOnUse) then
		popupIndexStart = 1
	end

	local buttonItems = AutoBarSearch.items:GetList(buttonKey)
	local buttonWidth = layoutDB.buttonWidth
	local buttonHeight = layoutDB.buttonHeight
	local relativePoint = popupHeader
	for popupButtonIndex = popupIndexStart, nItems, 1 do
		local popupButton = AutoBar.Class.PopupButton:GetPopupButton(self, popupButtonIndex, popupHeader, popupKeyHandler)
		local popupButtonFrame = popupButton.frame

		-- Wrap OnClick with the Arrange on use code
		local wrapped = popupButtonFrame.snippetOnClick
		if (wrapped and (not arrangeOnUse)) then
			local header, preBody, postBody = popupHeader:UnwrapScript(popupButtonFrame, "OnClick")
			assert(wrapped == preBody, "wrapped ~= preBody in UnwrapScript")
			-- ToDo: Are we the only wrapping people?  Maybe add some recursive unwrapping of our exact script.
		elseif ((not wrapped) and arrangeOnUse) then
			SecureHandlerWrapScript(popupButtonFrame, "OnClick", popupHeader, snippetOnClick)
			popupButtonFrame.snippetOnClick = snippetOnClick
		end

		-- Attach to edge of previous popupButtonFrame or the popupHeader
		popupButtonFrame:ClearAllPoints()
		popupButtonFrame:SetHeight(buttonHeight)
		popupButtonFrame:SetWidth(buttonWidth)
		popupButtonFrame:Raise()
		popupButtonFrame:SetScale(1)
		if (relativePoint == popupHeader) then
			popupButtonFrame:SetPoint(side, relativePoint, side, paddingX, paddingY)
			splitRelativePoint = popupButtonFrame
		else
			if (math.fmod(popupButtonIndex - popupIndexStart, splitLength) == 0) then
--print(frame:GetName(), popupButtonIndex, "/", nItems, splitLength, nSplits)
				popupButtonFrame:SetPoint(splitSide, splitRelativePoint, splitRelativeSide, splitPaddingX, splitPaddingY)
				splitRelativePoint = popupButtonFrame
			else
				popupButtonFrame:SetPoint(side, relativePoint, relativeSide, paddingX, paddingY)
			end
		end
		if (popupButtonIndex == 2) then
			if (popupDirection == "1") then
				popupButtonFrame:SetHitRectInsets(hitRectPadding, hitRectPadding, hitRectPadding, -padding)
			elseif (popupDirection == "2") then
				popupButtonFrame:SetHitRectInsets(hitRectPadding, -padding, hitRectPadding, hitRectPadding)
			elseif (popupDirection == "3") then
				popupButtonFrame:SetHitRectInsets(hitRectPadding, hitRectPadding, -padding, hitRectPadding)
			elseif (popupDirection == "4") then
				popupButtonFrame:SetHitRectInsets(-padding, hitRectPadding, hitRectPadding, hitRectPadding)
			end
		else
			popupButtonFrame:SetHitRectInsets(hitRectPadding, hitRectPadding, hitRectPadding, hitRectPadding)
		end
		relativePoint = popupButtonFrame

		-- Support selfcast
		popupButtonFrame:SetAttribute("checkselfcast", true)
		popupButtonFrame:SetAttribute("checkfocuscast", true)

		local bag, slot, spell, itemId, macroId = AutoBarSearch.sorted:GetInfo(buttonKey, popupButtonIndex)
		self:SetupAttributes(popupButton, bag, slot, spell, macroId, itemId, buttonItems[itemId])
		popupButton:UpdateIcon()
	end

	popupHeader:ClearAllPoints()
--- ToDo: fix for orientation
--			popupHeader:SetWidth(buttonWidth + paddingX * 2)
--			popupHeader:SetHeight((buttonHeight + paddingY) * (nItems - 1) + paddingY)
	popupHeader:SetWidth(2)
	popupHeader:SetHeight(2)
	popupHeader:SetScale(1)
	popupHeader:SetPoint(side, frame, relativeSide)
	RegisterAutoHide(popupHeader, 1)


	-- Hide unwanted buttons
	for popupButtonIndex, popupButton in pairs(popupHeader.popupButtonList) do
		if (popupButtonIndex > nItems) then
			popupButton.frame:Hide()	-- Items have shrunk below instantiated list.  Hide the excess.
		elseif (popupButtonIndex < popupIndexStart) then
--print("hiding popupButtonIndex, popupIndexStart, nItems, arrangeOnUse", popupButton:getName(), popupButtonIndex, popupIndexStart, nItems, arrangeOnUse)
			popupButton.frame:Hide()	-- Hide 1st popup if it is not arrange on use as it is identical to the anchorButton
		elseif (self.buttonDB.alwaysPopup) then
			popupButton.frame:Show()
			popupHeader:Show()
		else
			popupButton.frame:Show()
		end
	end
end



-- Set the state attributes of the button
function AutoBarButton.prototype:GetHierarchicalSetting(setting)
	local db = self.buttonDB
	if (db[setting] ~= nil) then
		return db[setting]
	end
	db = self.parentBar.sharedLayoutDB
	if (db[setting] ~= nil) then
		return db[setting]
	end
	db = AutoBar.db.account
	if (db[setting] ~= nil) then
		return db[setting]
	end
end


-- Update the anchorButton after a click on a popup
local snippetOnAttributeChanged = [[
	if (name == "icon") then
		control:CallMethod("UpdateIcon", value)
	elseif (name == "sourcebutton") then -- or name == "sourceButton" Some retard code is lowercasing this.  How silly.
		control:CallMethod("UpdateHandlers", self:GetAttribute("sourceButton"))
	end
]]

-- Used to pop up the buttons based on popupHeader FrameRef on the button
local popupHandler = CreateFrame("Frame", "AutoBarPopupHandler", nil, "SecureHandlerEnterLeaveTemplate")

-- Set the state attributes of the button
function AutoBarButton.prototype:SetupButton()
	local buttonKey = self.buttonDB.buttonKey
	local frame = self.frame

	local bag, slot, spell, itemId, macroId = AutoBarSearch.sorted:GetInfo(buttonKey, 1)
	local popupHeader = frame.popupHeader
	local popupKeyHandler = frame.popupKeyHandler

--AutoBar:Print("AutoBarButton.prototype:SetupButton buttonKey " .. tostring(buttonKey) .. " bag " .. tostring(bag) .. " slot " .. tostring(slot) .. " spell " .. tostring(spell) .. " macroId " .. tostring(macroId))
	if ((bag or slot or spell or macroId) and self.buttonDB.enabled) then
		frame:Show()
		local sortedItems = AutoBarSearch.sorted:GetList(buttonKey)
		local noPopup = self.buttonDB.noPopup
		local nItems = # sortedItems
		if (nItems < 2) then
			noPopup = true
		end

		local buttonItems = AutoBarSearch.items:GetList(buttonKey)
		local itemData = buttonItems[itemId]

		self:SetupAttributes(self, bag, slot, spell, macroId, itemId, itemData)
		if (noPopup) then
			if (popupHeader) then
				for _, popupButton in pairs(popupHeader.popupButtonList) do
					popupButton.frame:Hide()
				end
			end
		else
			local popupOnModifier = self:GetHierarchicalSetting("popupOnShift")

			-- Create the Button's Popup Header
			if (not popupHeader) then
				local name = buttonKey .. "PopupHeader"
				popupHeader = CreateFrame("Frame", name, frame, "SecureHandlerEnterLeaveTemplate")
				popupHeader:SetAttribute("_onenter", [[self:Show()]])
				popupHeader:SetAttribute("_onleave", [[self:Hide()]])
				popupHeader:SetFrameStrata("DIALOG")

				-- Create the popupKeyHandler if required
				if (popupOnModifier) then
					-- Note that it is made a child of popupHeader, and later becomes parent to the popup buttons
					-- Hiding it will thus hide the popup buttons as well, even if popupHeader is shown
					popupKeyHandler = CreateFrame("Frame", buttonKey .. "HandlerPopupKey", popupHeader, "SecureHandlerStateTemplate")
					popupKeyHandler:SetAttribute("_onstate-modifier", snippetPopupKey)
					popupKeyHandler:SetAllPoints(popupHeader)
					RegisterStateDriver(popupKeyHandler, "modifier", popupKeyStates)
					popupKeyHandler:SetAttribute("_onenter", [[ self:GetParent():Show() ]])
					popupKeyHandler:SetAttribute("_onleave", [[ self:GetParent():Hide() ]])
					frame.popupKeyHandler = popupKeyHandler
				end

				frame.popupHeader = popupHeader
				popupHeader.popupButtonList = {}
				RegisterAutoHide(popupHeader, 0.5)
			end

			-- Add needed snippets (only execute once)
			if (not frame.popupHandler) then
				frame.popupHandler = popupHandler

				frame:SetFrameRef("popupHeader", popupHeader)
				frame:Execute([[
					popupHeader = self:GetFrameRef("popupHeader")
					popupHeader:ClearAllPoints()
					popupHeader:SetPoint("BOTTOM", self, "TOP")
					popupHeader:Raise()
					popupHeader:Hide()
				]])

				SecureHandlerWrapScript(frame, "OnEnter", popupHandler, [[
					popupHeader = self:GetFrameRef("popupHeader")
					popupHeader:Show()
				]])
				popupHandler.TooltipHide = AutoBar.Class.BasicButton.TooltipHide
				SecureHandlerWrapScript(frame, "OnLeave", popupHandler, [[
					popupHeader = self:GetFrameRef("popupHeader")
					popupHeader:Hide()
				]])
				popupHandler:SetAttribute("_adopt", frame)

				-- Deal with rare irritating cases where Popups remain open incorrectly
				popupHeader:SetFrameRef("popupNaziHandler", popupNaziHandler)
				popupHeader:SetFrameRef("popupHeader", popupHeader)
				popupHeader:SetFrameRef("anchorButton", frame)
				popupHeader:SetAttribute("_ontimer", popupNaziSnippet)
			end

			local arrangeOnUse = self.buttonDB.arrangeOnUse
			local wrapped = frame.UpdateIcon
			-- Trigger Updating on the Anchor Button
			if (wrapped and (not arrangeOnUse)) then
				local header, preBody, postBody = popupHeader:UnwrapScript(frame, "OnAttributeChanged")
			elseif ((not wrapped) and arrangeOnUse) then
				frame.UpdateIcon = UpdateIcon	-- Update Icon
				frame.UpdateHandlers = UpdateHandlers	-- Update Handlers: Tooltip
				SecureHandlerWrapScript(frame, "OnAttributeChanged", frame, snippetOnAttributeChanged)
			end

			self:SetupPopups(nItems)
		end

	else
		frame:SetAttribute("itemId", nil)
		frame:Hide()
		if (popupHeader) then
			popupHeader:Hide()
		end

		if ((AutoBar.moveButtonsMode or AutoBar.db.account.showEmptyButtons or self.buttonDB.alwaysShow) and self.buttonDB.enabled) then
			frame:Show()
			if (self[1]) then
				frame:SetAttribute("category", self[# self])
			else
				frame:SetAttribute("category", nil)
			end
		else
			frame:SetAttribute("category", nil)
		end
	end
end
--[[
/dump (# AutoBarSearch.sorted:GetList("AutoBarButtonRecovery"))
/dump (AutoBar.buttonList["AutoBarButtonHearth"].frame.popupHeader.popupButtonList[2].frame:IsVisible())
/dump (AutoBar.buttonList["AutoBarButtonHearth"].frame.popupHeader.popupButtonList[2].frame:IsShown())
/script AutoBar.buttonList["AutoBarButtonHearth"].frame.popupHeader.popupButtonList[2].frame:SetPoint("RIGHT", -260,-80)
--]]

-- Clear the state attributes of the button
function AutoBarButton:SetupAttributesClear(frame)
	frame:SetAttribute("target-slot1", nil)
	frame:SetAttribute("target-slot2", nil)
	frame:SetAttribute("target-bag1", nil)
	frame:SetAttribute("target-bag2", nil)
	frame:SetAttribute("unit2", nil)
	frame:SetAttribute("type", nil)
	frame:SetAttribute("type2", nil)
	frame:SetAttribute("item", nil)
	frame:SetAttribute("item2", nil)
	frame:SetAttribute("spell", nil)
	frame:SetAttribute("spell2", nil)
	frame:SetAttribute("macroId", nil)
	frame:SetAttribute("macro", nil)
	frame:SetAttribute("macrotext", nil)
	frame:SetAttribute("macroName", nil)
	frame:SetAttribute("macroBody", nil)
	frame:SetAttribute("macro2", nil)
	frame:SetAttribute("macrotext2", nil)
end

local spellHealingTouch, spellHealingTouchIcon
spellHealingTouch, _, spellHealingTouchIcon = AutoBar:LoggedGetSpellInfo(5185)

local SPELL_FEED_PET = AutoBar:LoggedGetSpellInfo(6991) -- Feed Pet
local SPELL_PICK_LOCK = AutoBar:LoggedGetSpellInfo(1804) -- Pick Lock
local SPELL_MILL_HERB = AutoBar:LoggedGetSpellInfo(51005)

local TRINKET1_SLOT = 13
local TRINKET2_SLOT = 14

-- Set the state attributes of the button
function AutoBarButton.prototype:SetupAttributes(button, bag, slot, spell, macroId, itemId, itemData)
	local frame = button.frame
	AutoBarButton:SetupAttributesClear(frame)

	local enabled = true
	frame.needsTooltip = true
	local category = itemData and itemData.category

	frame:SetAttribute("category", category)
	frame:SetAttribute("itemId", itemId)

	local targeted, castSpell, itemsRightClick
	local buttonDB = self.buttonDB	-- Use base button info for popups as well
	local selfCastRightClick = AutoBar.db.account.selfCastRightClick

	-- Set up special conditions from Category attributes
	local categoryInfo = AutoBarCategoryList[category]
	if (categoryInfo) then
		targeted = categoryInfo.targeted

		-- Disable battleground only items outside BG
		if (categoryInfo.battleground and not AutoBar.inBG) then
			enabled = false
		end

		castSpell = categoryInfo.castSpell
		itemsRightClick = categoryInfo.itemsRightClick
	end

	if (not targeted and buttonDB.targeted) then
		targeted = buttonDB.targeted
	end

	if (targeted) then
		if (targeted == "CHEST") then
			frame:SetAttribute("target-slot1", 5)
			frame:SetAttribute("target-slot2", 5)
		elseif (targeted == "SHIELD") then
			frame:SetAttribute("target-slot1", 17)
			frame:SetAttribute("target-slot2", 17)
		elseif (targeted == "WEAPON") then
			frame:SetAttribute("target-slot1", 16)
			frame:SetAttribute("target-slot2", 17)
		elseif (targeted == TRINKET1_SLOT) then
			frame:SetAttribute("target-slot1", TRINKET1_SLOT)
			frame:SetAttribute("target-slot2", TRINKET2_SLOT)
		elseif (targeted == TRINKET2_SLOT) then
			frame:SetAttribute("target-slot1", TRINKET2_SLOT)
			frame:SetAttribute("target-slot2", TRINKET1_SLOT)
		elseif (AutoBar.CLASS == "ROGUE" and targeted == "Lockpicking") then
				frame:SetAttribute("type2", "spell")
				frame:SetAttribute("spell2", SPELL_PICK_LOCK)
				frame:SetAttribute("target-bag2", bag)
				frame:SetAttribute("target-slot2", slot)
		elseif (targeted == "Milling") then
				frame:SetAttribute("type1", "spell")
				frame:SetAttribute("spell1", SPELL_MILL_HERB)
				frame:SetAttribute("target-bag1", bag)
				frame:SetAttribute("target-slot1", slot)
				frame:SetAttribute("type2", "item")
				frame:SetAttribute("item2", "Draenic Mortar")
				frame:SetAttribute("target-bag2", bag)
				frame:SetAttribute("target-slot2", slot)
		elseif (AutoBar.CLASS == "HUNTER" and targeted == "PET") then
			-- Right Click targets pet
			if (category and strfind(category, "Consumable.Food")) then
				frame:SetAttribute("type2", "spell")
				frame:SetAttribute("spell2", SPELL_FEED_PET)
				frame:SetAttribute("target-bag2", bag)
				frame:SetAttribute("target-slot2", slot)
			else
				frame:SetAttribute("unit2", "pet")
			end
		elseif (targeted) then
			-- Support selfcast-RightMouse
			if (selfCastRightClick) then
				frame:SetAttribute("unit2", "player")
			else
				frame:SetAttribute("unit2", nil)
			end
		end
	end

	if (enabled) then
		if (buttonDB) then
			-- Handle right click pet targeting for a slot
			if (buttonDB.rightClickTargetsPet) then
				if (category and strfind(category, "Consumable.Food")) then
					frame:SetAttribute("type2", "spell")
					frame:SetAttribute("spell2", SPELL_FEED_PET)
					frame:SetAttribute("target-bag2", bag)
					frame:SetAttribute("target-slot2", slot)
--AutoBar:Print("AutoBarButton.prototype:SetupAttributes buttonKey " .. tostring(buttonKey) .. " bag ".. tostring(bag).. " slot " .. tostring(slot))
				else
					frame:SetAttribute("unit2", "pet")
				end
			elseif (selfCastRightClick) then
				frame:SetAttribute("unit2", "player")
			end

			if (not castSpell) then
				castSpell = buttonDB.castSpell
			end
		end

		-- The matched spell to cast on RightClick
		if (itemsRightClick and itemsRightClick[itemId]) then
			castSpell = itemsRightClick[itemId]
			selfCastRightClick = nil
--AutoBar:Print("AutoBarButton.prototype:SetupAttributes buttonKey " .. buttonKey .. " castSpell " .. tostring(castSpell))
		end
		-- Special spell to cast on RightClick
		if (castSpell) then
			frame:SetAttribute("type2", "spell")
			frame:SetAttribute("spell2", castSpell)
		end

		-- selfCastRightClick targeting
		local unit2 = frame:GetAttribute("unit2")
		if (selfCastRightClick and not unit2) then
			frame:SetAttribute("unit2", "player")
		end

		local type2 = frame:GetAttribute("type2")
		if (not bag and slot) then
			local itemLink = GetInventoryItemLink("player", slot)
			frame:SetAttribute("type", "item")
			frame:SetAttribute("item", itemLink)

			-- Tooltip
			frame:SetAttribute("itemLink", itemLink)
		elseif (bag and slot) then
			local itemLink = GetContainerItemLink(bag, slot)
			frame:SetAttribute("itemLink", itemLink)
---			if (buttonDB.shuffle) then
---				itemLink = bag .. " " .. slot
---			end
			frame:SetAttribute("type", "item")
			frame:SetAttribute("item", itemLink)
			if (not type2) then
				frame:SetAttribute("type2", "item")
				frame:SetAttribute("item2", itemLink)
			end
		elseif (macroId) then
			local macroInfo = AutoBarSearch.macros[macroId]
			frame:SetAttribute("type", "macro")
			frame:SetAttribute("macroId", macroId)
			if (macroInfo.macroIndex) then
				frame:SetAttribute("macro", macroInfo.macroIndex)
				button.macroActive = true
			else
				frame:SetAttribute("macrotext", macroInfo.macroText)
				button.macroActive = true
				frame:SetAttribute("macroName", macroInfo.macroName)
				frame:SetAttribute("macroBody", macroInfo.macroText)
			end
		elseif (spell) then
			-- Default spell to cast
			frame:SetAttribute("type", "spell")
			frame:SetAttribute("spell", spell)

			-- Tooltip
			local spellInfo = AutoBarSearch.spells[spell]
			if (spellInfo.spellLink) then
				frame:SetAttribute("itemLink", spellInfo.spellLink)
			end
		elseif (castSpell) then
			-- Set castSpell as default if nothing else is available
			frame:SetAttribute("type", "spell")
			frame:SetAttribute("spell", castSpell)

			-- Tooltip
			local spellInfo = AutoBarSearch.spells[castSpell].spellLink
			if (spellInfo.spellLink) then
				frame:SetAttribute("itemLink", spellInfo.spellLink)
			end
		else
			frame:SetAttribute("type", nil)
			frame:SetAttribute("type2", nil)
		end
	end
	if (self.buttonDB.invertButtons) then
		-- Only supports items for now (off hand buffing)
		local temp
		temp = frame:GetAttribute("target-slot1")
		frame:SetAttribute("target-slot1", frame:GetAttribute("target-slot2"))
		frame:SetAttribute("target-slot2", temp)

	end
	if (frame.menu) then
		frame:SetAttribute("type2", "menu")
	end
end
--[[
/dump AutoBar.buttonList["AutoBarButtonFoodPet"][1]
/dump AutoBar.buttonList["AutoBarButtonFoodPet"].frame.popupHeader.popupButtonList[2].frame:GetAttribute("type2")
/dump AutoBar.buttonList["AutoBarButtonFoodPet"].frame.popupHeader.popupButtonList[2].frame:GetAttribute("spell2")
/dump AutoBar.buttonList["AutoBarButtonFoodPet"].frame.popupHeader.popupButtonList[2].frame:GetAttribute("target-bag2")
/dump AutoBar.buttonList["AutoBarButtonFoodPet"].frame.popupHeader.popupButtonList[2].frame:GetAttribute("target-slot2")
/dump AutoBar.buttonList["AutoBarButtonBuff"].frame.popupHeader.popupButtonList[2].frame:GetAttribute("target-slot1")
/dump AutoBar.buttonList["AutoBarButtonClassBuff"].frame:GetAttribute("spell")
/dump AutoBar.buttonList["AutoBarButtonBuff"].frame:GetAttribute("target-slot2")
/dump AutoBar.buttonList["AutoBarButtonCooldownStoneMana"].frame:GetAttribute("itemId")
/dump AutoBar.buttonList["AutoBarButtonCooldownStoneHealth"].frame:GetAttribute("itemId")
/dump AutoBar.buttonList["AutoBarButtonMillHerbs"].frame.popupHeader.popupButtonList[10].frame:GetAttribute("type")
--]]


--
-- Button Update callback functions
--

function AutoBarButton:SetTooltip(button)
--AutoBar:Print("SetTooltip " .. tostring(self.needsTooltip) .. " button " .. tostring(button) .. " button " .. tostring(button) .. " showTooltip " .. tostring(AutoBar.db.account.showTooltip) .. " self.needsTooltip " .. tostring(self.needsTooltip))
	local isAutoBarButton = self.class and self.class.buttonDB

	if (isAutoBarButton and self.GetHotkey) then
		LibKeyBound:Set(self)
	end
	local noTooltip = not (AutoBar.db.account.showTooltip and self.needsTooltip or AutoBar.moveButtonsMode)
	noTooltip = noTooltip or (InCombatLockdown() and not AutoBar.db.account.showTooltipCombat) or (button == "OnLeave")
	if (noTooltip) then
		self.updateTooltip = nil
		GameTooltip:Hide()
		return
	end

	if (GetCVar("UberTooltips") == "1") then
		GameTooltip_SetDefaultAnchor(GameTooltip, self)
	else
		local x = self:GetRight();
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			GameTooltip:SetOwner(self, "ANCHOR_LEFT");
		else
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
		end
	end

	-- Add Button or Bar name
	if (AutoBar.moveButtonsMode) then
		if (self.class and self.class.sharedLayoutDB) then
			GameTooltip:AddLine(self.class.barName)
		elseif(isAutoBarButton) then
			GameTooltip:AddLine(AutoBarButton:GetDisplayName(self.class.buttonDB))
		end
	else
		local buttonType = self:GetAttribute("type")

		if (not buttonType) then
			if (isAutoBarButton) then
				GameTooltip:AddLine(AutoBarButton:GetDisplayName(self.class.buttonDB))
			else
				self.updateTooltip = nil
			end
		elseif (buttonType == "item") then
			local itemLink = self:GetAttribute("item")
			if (itemLink) then
				local itemId = self:GetAttribute("itemId")
				local bag, slot = AutoBarSearch.found:GetItemData(itemId)
				if (bag and slot) then
					GameTooltip:SetBagItem(bag, slot)
				elseif (slot) then
					GameTooltip:SetInventoryItem("player", slot)
				else
					GameTooltip:SetHyperlink(itemLink)
				end
			end
			self.updateTooltip = TOOLTIP_UPDATE_TIME
			if (AutoBar.db.account.showTooltipExtended) then
				GameTooltip_ShowCompareItem()
			end
-- /script local bag, slot = strmatch("3,4", "^(%d+)%s+(%d+)$"); AutoBar:Print("bag " .. tostring(bag).." slot " .. tostring(slot))
		elseif (buttonType == "spell") then
			local spellName = self:GetAttribute("spell")

			if (spellName) then
				local spellInfo = AutoBarSearch.spells[spellName]
				GameTooltip:SetSpellBookItem(spellInfo.spellId, spellInfo.spellTab)
			end
			self.updateTooltip = TOOLTIP_UPDATE_TIME
		end

		local rightClickType = self:GetAttribute("type2")
		if (rightClickType == "spell") then
			local spellName = self:GetAttribute("spell2")
			if (spellName) then
				GameTooltip:AddLine(L["Right Click casts "] .. spellName, 1, 0.2, 1, 1)
			end
		end
	end

	GameTooltip:Show()
end


-- Add your Button custom options to the optionlist
-- optionList[myCustomOptionKey]
-- Call specific SetOption<Type> methods to do the actual setting
function AutoBarButton.prototype:AddOptions(optionList, passValue)
end


-- Call specific option type methods to do the actual setting
function AutoBarButton.prototype:SetOptionBoolean(optionList, passValue, valueName, name, desc)
	if (not optionList.headerCustomOptions) then
		optionList.headerCustomOptions = {
			type = "header",
			order = 100,
			name = "",
		}
	end
	if (not optionList[valueName]) then
		optionList[valueName] = {
			type = "toggle",
			order = 110,
			name = name,
			desc = desc,
			arg = passValue,
			disabled = InCombatLockdown,
		}
	else
		optionList[valueName].arg = passValue
	end
end


-- Add category to the end of the buttons list
function AutoBarButton.prototype:AddCategory(categoryName)
	for _, category in ipairs(self) do
		if (category == categoryName) then
			-- Ignore.  ToDo shuffle to end.
			return
		end
	end
	-- Add to end
	self[# self + 1] = categoryName
end

-- Delete category from the buttons list
function AutoBarButton.prototype:DeleteCategory(categoryName)
	for i, category in ipairs(self) do
		if (category == categoryName) then
			for j = i, # self do
				self[j] = self[j + 1]
				self[j + 1] = nil
			end
			return
		end
	end
end

-- Register the Macro
function AutoBarButton.prototype:AddMacro(macroText, macroTexture)
	self.macroText = macroText
	self.macroTexture = macroTexture
	local buttonKey = self.buttonDB.buttonKey
--AutoBar:Print("AutoBarButtonMacro.prototype:AddMacro RegisterMacro " .. tostring(buttonKey))
	AutoBarSearch:RegisterMacro(buttonKey, nil, L[buttonKey], macroText)
end


AutoBarButtonMacro = AceOO.Class(AutoBarButton)

function AutoBarButtonMacro.prototype:init(parentBar, buttonDB)
	AutoBarButtonMacro.super.prototype.init(self, parentBar, buttonDB)
end

-- Set the state attributes of the button
function AutoBarButtonMacro.prototype:SetupButton()
	local frame = self.frame

	if (self.macroText and self.buttonDB.enabled) then
--AutoBar:Print("AutoBarButtonMacro.prototype:SetupButton buttonKey " .. tostring(self.buttonDB.buttonKey) .. " frame " .. tostring(frame))
		frame:Show()
--- ToDo, disable popup
		self:SetupAttributes(self, nil, nil, nil, self.buttonDB.buttonKey)
	else
		frame:Hide()
	end
end


local AutoBarButtonAspect = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonAspect"] = AutoBarButtonAspect

function AutoBarButtonAspect.prototype:init(parentBar, buttonDB)
	AutoBarButtonAspect.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Aspect")
end

local AutoBarButtonPoisonLethal = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonPoisonLethal"] = AutoBarButtonPoisonLethal

function AutoBarButtonPoisonLethal.prototype:init(parentBar, buttonDB)
	AutoBarButtonPoisonLethal.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Poison.Lethal")
end

local AutoBarButtonPoisonNonlethal = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonPoisonNonlethal"] = AutoBarButtonPoisonNonlethal

function AutoBarButtonPoisonNonlethal.prototype:init(parentBar, buttonDB)
	AutoBarButtonPoisonNonlethal.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Poison.Nonlethal")
end

local AutoBarButtonBandages = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonBandages"] = AutoBarButtonBandages

function AutoBarButtonBandages.prototype:init(parentBar, buttonDB)
	AutoBarButtonBandages.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Bandage.Basic")
	self:AddCategory("Consumable.Bandage.Battleground.Alterac Valley")
	self:AddCategory("Consumable.Bandage.Battleground.Arathi Basin")
	self:AddCategory("Consumable.Bandage.Battleground.Warsong Gulch")
end


local AutoBarButtonBattleStandards = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonBattleStandards"] = AutoBarButtonBattleStandards

function AutoBarButtonBattleStandards.prototype:init(parentBar, buttonDB)
	AutoBarButtonBattleStandards.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Misc.Battle Standard.Battleground")
	self:AddCategory("Misc.Battle Standard.Alterac Valley")
	self:AddCategory("Misc.Battle Standard.Guild")
end


local AutoBarButtonBuff = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonBuff"] = AutoBarButtonBuff

function AutoBarButtonBuff.prototype:init(parentBar, buttonDB)
	AutoBarButtonBuff.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Buff.Chest")
	self:AddCategory("Consumable.Buff.Shield")
	self:AddCategory("Consumable.Buff.Other.Target")
	self:AddCategory("Consumable.Buff.Other.Self")
	self:AddCategory("Consumable.Buff Group.General.Target")
	self:AddCategory("Consumable.Buff Group.General.Self")

	-- Melee
	if (AutoBar.CLASS ~= "MAGE" and AutoBar.CLASS ~= "WARLOCK" and AutoBar.CLASS ~= "PRIEST") then
		self:AddCategory("Consumable.Buff Group.Melee.Target")
		self:AddCategory("Consumable.Buff Group.Melee.Self")
	end

	-- Mana & Spell
	if (AutoBar.CLASS ~= "ROGUE" and AutoBar.CLASS ~= "WARRIOR") then
		self:AddCategory("Consumable.Buff Group.Caster.Target")
		self:AddCategory("Consumable.Buff Group.Caster.Self")
	end
	
		self:AddCategory("Muffin.Potion.Buff")

end


local AutoBarButtonBuffWeapon = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonBuffWeapon"] = AutoBarButtonBuffWeapon

function AutoBarButtonBuffWeapon.prototype:init(parentBar, buttonDB)
	AutoBarButtonBuffWeapon.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Weapon Buff")
	self:AddCategory("Spell.Buff.Weapon")
end


local AutoBarButtonClassBuff = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonClassBuff"] = AutoBarButtonClassBuff

function AutoBarButtonClassBuff.prototype:init(parentBar, buttonDB)
	AutoBarButtonClassBuff.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Class.Buff")
end

function AutoBarButtonClassBuff.prototype:SetupAttributes(button, bag, slot, spell, macroId, itemId, itemData)
	local selfCastRightClick = AutoBar.db.account.selfCastRightClick
	AutoBar.db.account.selfCastRightClick = nil
	AutoBarButtonClassBuff.super.prototype.SetupAttributes(self, button, bag, slot, spell, macroId, itemId, itemData)
	AutoBar.db.account.selfCastRightClick = selfCastRightClick
end

local AutoBarButtonClassPets2 = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonClassPets2"] = AutoBarButtonClassPets2

function AutoBarButtonClassPets2.prototype:init(parentBar, buttonDB)
	AutoBarButtonClassPets2.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Class.Pets2")
end

local AutoBarButtonClassPet = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonClassPet"] = AutoBarButtonClassPet

function AutoBarButtonClassPet.prototype:init(parentBar, buttonDB)
	AutoBarButtonClassPet.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Class.Pet")
end

local AutoBarButtonClassPets3 = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonClassPets3"] = AutoBarButtonClassPets3

function AutoBarButtonClassPets3.prototype:init(parentBar, buttonDB)
	AutoBarButtonClassPets3.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Class.Pets3")
end

local AutoBarButtonConjure = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonConjure"] = AutoBarButtonConjure

function AutoBarButtonConjure.prototype:init(parentBar, buttonDB)
	AutoBarButtonConjure.super.prototype.init(self, parentBar, buttonDB)

	if (AutoBar.CLASS == "MAGE") then
		self:AddCategory("Spell.Mage.Conjure Food")
	elseif (AutoBar.CLASS == "WARLOCK") then
		self:AddCategory("Spell.Warlock.Create Healthstone")
	end
end


local AutoBarButtonOpenable = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonOpenable"] = AutoBarButtonOpenable

function AutoBarButtonOpenable.prototype:init(parentBar, buttonDB)
	AutoBarButtonOpenable.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Muffin.Misc.Openable")
end


local AutoBarButtonCrafting = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonCrafting"] = AutoBarButtonCrafting

function AutoBarButtonCrafting.prototype:init(parentBar, buttonDB)
	AutoBarButtonCrafting.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Crafting")
end


AutoBarButtonCustom = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonCustom"] = AutoBarButtonCustom

function AutoBarButtonCustom.prototype:init(parentBar, buttonDB)
	AutoBarButtonCustom.super.prototype.init(self, parentBar, buttonDB)
	self.frame.SetKey = nil
end

function AutoBarButtonCustom.prototype:GetButtonBinding()
	return nil
end

function AutoBarButtonCustom.prototype:CreateButtonFrame()
	AutoBarButtonCustom.super.prototype.CreateButtonFrame(self)
	self.frame.GetActionName = nil
	self.frame.SetKey = nil
	self.frame.ClearBindings = nil
	self.frame.GetBindings = nil
end


local spellAquaticForm, spellAquaticFormIcon
local spellTreeOfLifeForm, spellTreeOfLifeFormIcon
local spellMoonkinForm, spellMoonkinFormIcon

spellMoonkinForm, _, spellMoonkinFormIcon = AutoBar:LoggedGetSpellInfo(24858)
spellAquaticForm, _, spellAquaticFormIcon = AutoBar:LoggedGetSpellInfo(1066)
spellTreeOfLifeForm, _, spellTreeOfLifeFormIcon = AutoBar:LoggedGetSpellInfo(114282)


local shapeshift = {
}
local shapeshiftIn = {}
local shapeshiftSet = {}
local formIndexList = {}
local concatList = {}
local excludeList = {}

local function ShapeshiftRefresh()
	wipe(shapeshift)
	wipe(shapeshiftIn)
	wipe(shapeshiftSet)
	wipe(formIndexList)

	local numShapeshiftForms = GetNumShapeshiftForms()
	for index = 1, numShapeshiftForms, 1 do
		local _, name, _, _ = GetShapeshiftFormInfo(index)
		shapeshift[name] = " [stance:" .. index .. "] " .. name .. ";"
		shapeshiftIn[name] = " [stance:" .. index .. "]"
		shapeshiftSet[name] = " [nostance:" .. index .. "] " .. name .. ";"
		formIndexList[name] = index
	end
end

local function GetCancelList(excludeList)
	ShapeshiftRefresh()
	wipe(concatList)

	local index = 1
	concatList[index] = "/cancelform [stance:"
	index = index + 1

	for excludeForm in pairs(excludeList) do
		formIndexList[excludeForm] = nil
	end

	local needsSlash = false

	for formName, formIndex in pairs(formIndexList) do
		if (formName and formIndex) then
			if (needsSlash) then
				concatList[index] = "/"
				index = index + 1
				concatList[index] = tostring(formIndex)
			else
				concatList[index] = tostring(formIndex)
				needsSlash = true
			end
			index = index + 1
		end
	end
	concatList[index] = "]\n/dismount [mounted]\n/cast "
	index = index + 1
	
	return concatList
end

local AutoBarButtonBear = AceOO.Class(AutoBarButtonMacro)
AutoBar.Class["AutoBarButtonBear"] = AutoBarButtonBear

function AutoBarButtonBear.prototype:init(parentBar, buttonDB)
	AutoBarButtonBear.super.prototype.init(self, parentBar, buttonDB)
	self:Refresh(parentBar, buttonDB)
end

function AutoBarButtonBear.prototype:Refresh(parentBar, buttonDB)
	AutoBarButtonBear.super.prototype.Refresh(self, parentBar, buttonDB)
	self.macroActive = nil
	if (AutoBar.CLASS == "DRUID") then
		wipe(excludeList)
		excludeList[spellNameList["Bear Form"]] = true
		local concatList = GetCancelList(excludeList)
		local macroTexture

		if (shapeshiftSet[spellNameList["Bear Form"]]) then
			concatList[# concatList + 1] = shapeshiftSet[spellNameList["Bear Form"]]
			macroTexture = spellIconList["Bear Form"]
			self.macroActive = true
		end

		if (self.macroActive) then
			local macroText = table.concat(concatList)
			self:AddMacro(macroText, macroTexture)
		end
	end
end

local AutoBarButtonBoomkinTree = AceOO.Class(AutoBarButtonMacro)
AutoBar.Class["AutoBarButtonBoomkinTree"] = AutoBarButtonBoomkinTree

function AutoBarButtonBoomkinTree.prototype:init(parentBar, buttonDB)
	AutoBarButtonBoomkinTree.super.prototype.init(self, parentBar, buttonDB)
	self:Refresh(parentBar, buttonDB)
end

function AutoBarButtonBoomkinTree.prototype:Refresh(parentBar, buttonDB)
	AutoBarButtonBoomkinTree.super.prototype.Refresh(self, parentBar, buttonDB)
	self.macroActive = nil
	if (AutoBar.CLASS == "DRUID") then
		wipe(excludeList)
		excludeList[spellMoonkinForm] = true
		excludeList[spellTreeOfLifeForm] = true
		local concatList = GetCancelList(excludeList)
		local macroTexture

		if (shapeshiftSet[spellMoonkinForm]) then
			concatList[# concatList + 1] = shapeshiftSet[spellMoonkinForm]
			macroTexture = spellMoonkinFormIcon
			self.macroActive = true
		elseif (shapeshiftSet[spellTreeOfLifeForm]) then
			concatList[# concatList + 1] = shapeshiftSet[spellTreeOfLifeForm]
			macroTexture = spellTreeOfLifeFormIcon
			self.macroActive = true
		end

		if (self.macroActive) then
			local macroText = table.concat(concatList)
			self:AddMacro(macroText, macroTexture)
		end
	end
end


local AutoBarButtonCat = AceOO.Class(AutoBarButtonMacro)
AutoBar.Class["AutoBarButtonCat"] = AutoBarButtonCat

function AutoBarButtonCat.prototype:init(parentBar, buttonDB)
	AutoBarButtonCat.super.prototype.init(self, parentBar, buttonDB)
	self:Refresh(parentBar, buttonDB)
end

function AutoBarButtonCat.prototype:Refresh(parentBar, buttonDB)
	AutoBarButtonCat.super.prototype.Refresh(self, parentBar, buttonDB)
	self.macroActive = nil
	if (AutoBar.CLASS == "DRUID") then
		wipe(excludeList)
		excludeList[spellNameList["Cat Form"]] = true
		local concatList = GetCancelList(excludeList)
		local macroTexture

		if (shapeshiftSet[spellNameList["Cat Form"]]) then
			concatList[# concatList + 1] = shapeshiftSet[spellNameList["Cat Form"]]
			macroTexture = spellIconList["Cat Form"]
			self.macroActive = true

			local macroText = table.concat(concatList)
			self:AddMacro(macroText, macroTexture)
		end
	end
end



local AutoBarButtonPowerShift = AceOO.Class(AutoBarButtonMacro)
AutoBar.Class["AutoBarButtonPowerShift"] = AutoBarButtonPowerShift

function AutoBarButtonPowerShift.prototype:init(parentBar, buttonDB)
	AutoBarButtonPowerShift.super.prototype.init(self, parentBar, buttonDB)
	self:Refresh(parentBar, buttonDB)
end

function AutoBarButtonPowerShift.prototype:Refresh(parentBar, buttonDB)
	AutoBarButtonPowerShift.super.prototype.Refresh(self, parentBar, buttonDB)
	self.macroActive = nil
	if (AutoBar.CLASS == "DRUID") then
--[[
/run local f="Cat Form";f=GetSpellCooldown(f)>0 or UnitMana('player')>15 or not IsUsableSpell(f) or CancelPlayerBuff(f)
/cast [form] Mangle
/stopmacro [form]
/cast !Cat Form
--]]
		ShapeshiftRefresh()
		local macroTexture

		if (GetSpellInfo(spellNameList["Cat Form"]) and GetSpellInfo(spellNameList["Mangle"])) then
			concatList[1] = "/run local f=\""
			concatList[2] = spellNameList["Cat Form"]
			concatList[3] = "\";f=GetSpellCooldown(f)>0 or UnitMana('player')>15 or not IsUsableSpell(f) or CancelPlayerBuff(f)\n/cast [form] "
			concatList[4] = spellNameList["Mangle"]
			concatList[5] = "\n/stopmacro [form]\n"
			concatList[6] = "/cast !"
			concatList[7] = spellNameList["Cat Form"]
			concatList[8] = "\n"
			macroTexture = spellIconList["Mangle"]
			self.macroActive = true

			local macroText = table.concat(concatList)
--AutoBar:Print("AutoBarButtonPowerShift:Refresh " .. tostring(macroText) .. " macroTexture " .. tostring(macroTexture))
			self:AddMacro(macroText, macroTexture)
		end
	end
end




local AutoBarButtonCharge = AceOO.Class(AutoBarButtonMacro)
AutoBar.Class["AutoBarButtonCharge"] = AutoBarButtonCharge

function AutoBarButtonCharge.prototype:init(parentBar, buttonDB)
	AutoBarButtonCharge.super.prototype.init(self, parentBar, buttonDB)
	self:Refresh(parentBar, buttonDB)
end

function AutoBarButtonCharge.prototype:Refresh(parentBar, buttonDB)
	AutoBarButtonCharge.super.prototype.Refresh(self, parentBar, buttonDB)
	self.macroActive = nil
	wipe(concatList)

	concatList[1] = "/cast "
	local index = 2
	local macroTexture
	if (AutoBar.CLASS == "DRUID") then
		if (GetSpellInfo(spellNameList["Wild Charge"])) then
			concatList[index] = spellNameList["Wild Charge"]

			macroTexture = spellIconList["Wild Charge"]
			self.macroActive = true
		end
	elseif (AutoBar.CLASS == "ROGUE") then
		if (GetSpellInfo(spellNameList["Shadowstep"])) then
			concatList[index] = spellNameList["Shadowstep"]

			macroTexture = spellIconList["Shadowstep"]
			self.macroActive = true
		end
	elseif (AutoBar.CLASS == "WARRIOR") then
		if (GetSpellInfo(spellNameList["Charge"])) then
			concatList[index] = "[nocombat,harm,nostance:1]"
			concatList[index + 1] = spellNameList["Battle Stance"]
			concatList[index + 2] = ";"
			concatList[index + 3] = "[nocombat,harm,stance:1]"
			concatList[index + 4] = spellNameList["Charge"]
			concatList[index + 5] = ";"
			self.macroActive = true
			index = index + 6
		end
		if (GetSpellInfo(spellNameList["Intervene"])) then
			concatList[index] = "[nostance:2,help]"
			concatList[index + 1] = spellNameList["Defensive Stance"]
			concatList[index + 2] = ";"
			concatList[index + 3] = "[stance:2,help]"
			concatList[index + 4] = spellNameList["Intervene"]
			concatList[index + 5] = ";"
			self.macroActive = true
			index = index + 6
		end

		macroTexture = spellIconList["Charge"]
	end
	if (self.macroActive) then
		local macroText = table.concat(concatList)
		self:AddMacro(macroText, macroTexture)
	end
end


local AutoBarButtonTravel = AceOO.Class(AutoBarButtonMacro)
AutoBar.Class["AutoBarButtonTravel"] = AutoBarButtonTravel

function AutoBarButtonTravel.prototype:init(parentBar, buttonDB)
	AutoBarButtonTravel.super.prototype.init(self, parentBar, buttonDB)

	self:Refresh(parentBar, buttonDB)
end

function AutoBarButtonTravel.prototype:Refresh(parentBar, buttonDB)
	AutoBarButtonTravel.super.prototype.Refresh(self, parentBar, buttonDB)
	self.macroActive = nil
	wipe(concatList)

	local macroTexture
	if (AutoBar.CLASS == "DRUID") then
		wipe(excludeList)
		excludeList[spellAquaticForm] = true
		excludeList[spellNameList["Cat Form"]] = true
		excludeList[spellNameList["Travel Form"]] = true
		excludeList[spellNameList["Swift Flight Form"]] = true
		excludeList[spellNameList["Flight Form"]] = true
		local concatList = GetCancelList(excludeList)

		local index = # concatList + 1
		if (shapeshift[spellAquaticForm]) then
			concatList[index] = " [swimming] "
			concatList[index+1] = spellAquaticForm
			concatList[index+2] = ";"
			index = index + 3
			self.macroActive = true
		end

		if (shapeshift[spellNameList["Cat Form"]]) then
			concatList[index] = " [indoors] "
			concatList[index+1] = spellNameList["Cat Form"]
			concatList[index+2] = ";"
			index = index + 3
			self.macroActive = true
		end

		if (shapeshift[spellNameList["Swift Flight Form"]]) then
			concatList[index] = " [flyable,nocombat] "
			concatList[index+1] = spellNameList["Swift Flight Form"]
			concatList[index+2] = ";"
			index = index + 3
			self.macroActive = true
		elseif (shapeshift[spellNameList["Flight Form"]]) then
			concatList[index] = " [flyable,nocombat] "
			concatList[index+1] = spellNameList["Flight Form"]
			concatList[index+2] = ";"
			index = index + 3
			self.macroActive = true
		end

		if (shapeshiftSet[spellNameList["Travel Form"]]) then
			concatList[index] = " [outdoors] "
			concatList[index+1] = spellNameList["Travel Form"]
			index = index + 2
			self.macroActive = true
		end

		macroTexture = spellIconList["Travel Form"]
	elseif (AutoBar.CLASS == "SHAMAN") then
		if (GetSpellInfo(spellNameList["Ghost Wolf"])) then
			local index = 1
			concatList[index] = "/dismount [mounted]\n"
			concatList[index + 1] = "/cast "
			concatList[index + 2] = spellNameList["Ghost Wolf"]
			index = index + 3

			macroTexture = spellIconList["Ghost Wolf"]
			self.macroActive = true
		end
	end
	if (self.macroActive) then
		local macroText = table.concat(concatList)
		self:AddMacro(macroText, macroTexture)
	end
end


local AutoBarButtonDebuff = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonDebuff"] = AutoBarButtonDebuff

function AutoBarButtonDebuff.prototype:init(parentBar, buttonDB)
	AutoBarButtonDebuff.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Debuff.Single")
	self:AddCategory("Spell.Debuff.Multiple")
end


local AutoBarButtonElixirBattle = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonElixirBattle"] = AutoBarButtonElixirBattle

function AutoBarButtonElixirBattle.prototype:init(parentBar, buttonDB)
	AutoBarButtonElixirBattle.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Buff Type.Battle")
end


local AutoBarButtonElixirGuardian = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonElixirGuardian"] = AutoBarButtonElixirGuardian

function AutoBarButtonElixirGuardian.prototype:init(parentBar, buttonDB)
	AutoBarButtonElixirGuardian.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Buff Type.Guardian")
end


local AutoBarButtonElixirBoth = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonElixirBoth"] = AutoBarButtonElixirBoth

function AutoBarButtonElixirBoth.prototype:init(parentBar, buttonDB)
	AutoBarButtonElixirBoth.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Muffin.Flasks")
end


local AutoBarButtonER = AceOO.Class(AutoBarButtonMacro)
AutoBar.Class["AutoBarButtonER"] = AutoBarButtonER

function AutoBarButtonER.prototype:init(parentBar, buttonDB)
	AutoBarButtonER.super.prototype.init(self, parentBar, buttonDB)
	self:Refresh(parentBar, buttonDB)
end


function AutoBarButtonER.prototype:Refresh(parentBar, buttonDB)
	AutoBarButtonER.super.prototype.Refresh(self, parentBar, buttonDB)
	self.macroActive = nil
	wipe(concatList)
	local index = 1

	local macroTexture
	if (AutoBar.CLASS == "DRUID") then
		if (GetSpellInfo(spellNameList["Nature's Swiftness"])) then
			concatList[index] = "/cast "
			concatList[index + 1] = spellNameList["Nature's Swiftness"]
			concatList[index + 2] = "\n/cast "
			concatList[index + 3] = spellHealingTouch

			macroTexture = spellHealingTouchIcon
			self.macroActive = true

		elseif (GetSpellInfo(spellNameList["Frenzied Regeneration"])) then
			concatList[index] = "/cast "
			concatList[index + 1] = spellNameList["Frenzied Regeneration"]
			concatList[index + 2] = "\n"

			macroTexture = spellIconList["Frenzied Regeneration"]
			self.macroActive = true

		end
	elseif (AutoBar.CLASS == "DEATHKNIGHT") then
		if (GetSpellInfo(spellNameList["Rune Tap"])) then
			concatList[index] = "/cast "
			concatList[index + 1] = spellNameList["Rune Tap"]

			macroTexture = spellIconList["Rune Tap"]
			self.macroActive = true
		end
	elseif (AutoBar.CLASS == "HUNTER") then
		if (GetSpellInfo(spellNameList["Feign Death"])) then
			concatList[index] = "/cast "
			concatList[index + 1] = spellNameList["Feign Death"]

			macroTexture = spellIconList["Feign Death"]
			self.macroActive = true
		elseif (GetSpellInfo(spellNameList["Disengage"])) then
			concatList[index] = "/cast "
			concatList[index + 1] = spellNameList["Disengage"]

			macroTexture = spellIconList["Disengage"]
			self.macroActive = true
		end
	elseif (AutoBar.CLASS == "MAGE") then
		if (GetSpellInfo(spellNameList["Ice Block"])) then
			concatList[index] = "/cast "
			concatList[index + 1] = spellNameList["Ice Block"]

			macroTexture = spellIconList["Ice Block"]
			self.macroActive = true
		end
	elseif (AutoBar.CLASS == "PALADIN") then
		if (GetSpellInfo(spellNameList["Lay on Hands"])) then
			concatList[index] = "/cast "
			concatList[index + 1] = spellNameList["Lay on Hands"]

			macroTexture = spellIconList["Lay on Hands"]
			self.macroActive = true
		end
	elseif (AutoBar.CLASS == "PRIEST") then
		if (GetSpellInfo(spellNameList["Desperate Prayer"])) then
			concatList[index] = "/cast "
			concatList[index + 1] = spellNameList["Desperate Prayer"]

			macroTexture = spellIconList["Desperate Prayer"]
			self.macroActive = true
		end
	elseif (AutoBar.CLASS == "ROGUE") then
		if (GetSpellInfo(spellNameList["Vanish"])) then
			concatList[index] = "/cast "
			concatList[index + 1] = spellNameList["Vanish"]

			macroTexture = spellIconList["Vanish"]
			self.macroActive = true
		end
	elseif (AutoBar.CLASS == "WARRIOR") then
		if (GetSpellInfo(spellNameList["Last Stand"])) then
			concatList[index] = "/cast "
			concatList[index + 1] = spellNameList["Last Stand"]

			macroTexture = spellIconList["Last Stand"]
			self.macroActive = true
		elseif (GetSpellInfo(spellNameList["Enraged Regeneration"])) then
			concatList[index] = "/cast "
			concatList[index + 1] = spellNameList["Enraged Regeneration"]

			macroTexture = spellIconList["Enraged Regeneration"]
			self.macroActive = true
		end

	end
	if (self.macroActive) then
		local macroText = table.concat(concatList)
		self:AddMacro(macroText, macroTexture)
	end
end



local AutoBarButtonExplosive = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonExplosive"] = AutoBarButtonExplosive

function AutoBarButtonExplosive.prototype:init(parentBar, buttonDB)
	AutoBarButtonExplosive.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Misc.Explosives")
end


local AutoBarButtonFishing = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonFishing"] = AutoBarButtonFishing

function AutoBarButtonFishing.prototype:init(parentBar, buttonDB)
	AutoBarButtonFishing.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Tradeskill.Tool.Fishing.Lure")
	self:AddCategory("Tradeskill.Tool.Fishing.Gear")
	self:AddCategory("Tradeskill.Tool.Fishing.Other")
	self:AddCategory("Tradeskill.Tool.Fishing.Tool")
	self:AddCategory("Tradeskill.Tool.Fishing.Bait")
	self:AddCategory("Spell.Fishing")
end

local AutoBarButtonFood = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonFood"] = AutoBarButtonFood

function AutoBarButtonFood.prototype:init(parentBar, buttonDB)
	AutoBarButtonFood.super.prototype.init(self, parentBar, buttonDB)

	if (AutoBar.CLASS == "MAGE" and not buttonDB.disableConjure) then
		self:AddCategory("Consumable.Food.Conjure")
	end
	self:AddCategory("Muffin.Food.Health.Basic")
	
	if (buttonDB.include_combo_basic) then	
		self:AddCategory("Muffin.Food.Combo.Basic")
	end
	
	self:AddCategory("Consumable.Food.Percent.Basic")
end

--local function SetDisableConjure(info, value)
--	local buttonDB = AutoBar:GetButtonDB(info.arg.buttonKey)
--	buttonDB.disableConjure = value
--	AutoBar:BarButtonChanged()
--	AutoBar:CategoriesChanged()
--end

--function AutoBarButtonFood.prototype:Refresh(parentBar, buttonDB)
--	AutoBarButtonFood.super.prototype.Refresh(self, parentBar, buttonDB)
--	if (AutoBar.CLASS == "MAGE") then
--		if (buttonDB.disableConjure) then
--			self:DeleteCategory("Consumable.Food.Conjure")
--			buttonDB.castSpell = nil
--			AutoBarCategoryList["Consumable.Food.Edible.Combo.Conjured"]:SetCastList(nil)
--		else
--			self:AddCategory("Consumable.Food.Conjure")
--		end
--	end
--end

function AutoBarButtonFood.prototype:AddOptions(optionList, passValue)
	if (AutoBar.CLASS == "MAGE") then
		self:SetOptionBoolean(optionList, passValue, "disableConjure", L["Disable Conjure Button"])
	end

	self:SetOptionBoolean(optionList, passValue, "include_combo_basic", L["Include Basic Combo Food"])

end


local AutoBarButtonFoodBuff = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonFoodBuff"] = AutoBarButtonFoodBuff

function AutoBarButtonFoodBuff.prototype:init(parentBar, buttonDB)
	AutoBarButtonFoodBuff.super.prototype.init(self, parentBar, buttonDB)

--	self:AddCategory("Consumable.Food.Buff.Stamina")
--	self:AddCategory("Consumable.Food.Buff.HP Regen")
--	self:AddCategory("Consumable.Food.Percent.Bonus")

	self:AddCategory("Muffin.Food.Health.Buff")

--	if (AutoBar.CLASS == "DEATHKNIGHT" or AutoBar.CLASS == "WARRIOR") then
--		self:AddCategory("Consumable.Food.Buff.Strength")
--		self:AddCategory("Consumable.Food.Buff.Attack Power")
--		self:AddCategory("Consumable.Food.Buff.Dodge")
--	elseif (AutoBar.CLASS == "DRUID") then
--		self:AddCategory("Consumable.Food.Buff.Agility")
--		self:AddCategory("Consumable.Food.Buff.Attack Power")
--		self:AddCategory("Consumable.Food.Buff.Dodge")
--		self:AddCategory("Consumable.Food.Buff.Healing")
--		self:AddCategory("Consumable.Food.Buff.Intellect")
--		self:AddCategory("Consumable.Food.Buff.Mana Regen")
--		self:AddCategory("Consumable.Food.Buff.Spell Damage")
--		self:AddCategory("Consumable.Food.Buff.Spirit")
--	elseif (AutoBar.CLASS == "HUNTER" or AutoBar.CLASS == "ROGUE") then
--		self:AddCategory("Consumable.Food.Buff.Agility")
--		self:AddCategory("Consumable.Food.Buff.Attack Power")
--	elseif (AutoBar.CLASS == "MAGE"or AutoBar.CLASS == "WARLOCK") then
--		self:AddCategory("Consumable.Food.Buff.Intellect")
--		self:AddCategory("Consumable.Food.Buff.Mana Regen")
--		self:AddCategory("Consumable.Food.Buff.Spell Damage")
--		self:AddCategory("Consumable.Food.Buff.Spirit")
--	elseif (AutoBar.CLASS == "PALADIN") then
--		self:AddCategory("Consumable.Food.Buff.Strength")
--		self:AddCategory("Consumable.Food.Buff.Attack Power")
--		self:AddCategory("Consumable.Food.Buff.Dodge")
--		self:AddCategory("Consumable.Food.Buff.Healing")
--		self:AddCategory("Consumable.Food.Buff.Intellect")
--		self:AddCategory("Consumable.Food.Buff.Mana Regen")
--		self:AddCategory("Consumable.Food.Buff.Spell Damage")
--		self:AddCategory("Consumable.Food.Buff.Spirit")
--	elseif (AutoBar.CLASS == "PRIEST") then
--		self:AddCategory("Consumable.Food.Buff.Intellect")
--		self:AddCategory("Consumable.Food.Buff.Mana Regen")
--		self:AddCategory("Consumable.Food.Buff.Spell Damage")
--		self:AddCategory("Consumable.Food.Buff.Spirit")
--		self:AddCategory("Consumable.Food.Buff.Healing")
--	elseif (AutoBar.CLASS == "ROGUE") then
--		self:AddCategory("Consumable.Food.Buff.Agility")
--		self:AddCategory("Consumable.Food.Buff.Attack Power")
--	elseif (AutoBar.CLASS == "SHAMAN") then
--		self:AddCategory("Consumable.Food.Buff.Agility")
--		self:AddCategory("Consumable.Food.Buff.Attack Power")
--		self:AddCategory("Consumable.Food.Buff.Healing")
--		self:AddCategory("Consumable.Food.Buff.Intellect")
--		self:AddCategory("Consumable.Food.Buff.Mana Regen")
--		self:AddCategory("Consumable.Food.Buff.Spell Damage")
--		self:AddCategory("Consumable.Food.Buff.Spirit")
--	end
--
--	self:AddCategory("Consumable.Food.Buff.Other")
end


local AutoBarButtonFoodCombo = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonFoodCombo"] = AutoBarButtonFoodCombo

function AutoBarButtonFoodCombo.prototype:init(parentBar, buttonDB)
	AutoBarButtonFoodCombo.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Muffin.Food.Combo.Basic")
	self:AddCategory("Muffin.Food.Combo.Buff")

end


local AutoBarButtonFoodPet = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonFoodPet"] = AutoBarButtonFoodPet

function AutoBarButtonFoodPet.prototype:init(parentBar, buttonDB)
	AutoBarButtonFoodPet.super.prototype.init(self, parentBar, buttonDB)

	if (AutoBar.CLASS == "HUNTER") then
		self:AddCategory("Consumable.Food.Pet.Bread")
		self:AddCategory("Consumable.Food.Pet.Cheese")
		self:AddCategory("Consumable.Food.Pet.Fish")
		self:AddCategory("Consumable.Food.Pet.Fruit")
		self:AddCategory("Consumable.Food.Pet.Fungus")
		self:AddCategory("Consumable.Food.Pet.Meat")
		self:AddCategory("Consumable.Buff Pet")
	end

	self.rightClickTargetsPet = true
end


local AutoBarButtonFreeAction = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonFreeAction"] = AutoBarButtonFreeAction

function AutoBarButtonFreeAction.prototype:init(parentBar, buttonDB)
	AutoBarButtonFreeAction.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Buff.Free Action")
end


local AutoBarButtonHeal = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonHeal"] = AutoBarButtonHeal

function AutoBarButtonHeal.prototype:init(parentBar, buttonDB)
	AutoBarButtonHeal.super.prototype.init(self, parentBar, buttonDB)

	--self:AddCategory("Consumable.Potion.Recovery.Healing.Endless")
	--self:AddCategory("Consumable.Potion.Recovery.Healing.Basic")
	
	--self:AddCategory("Consumable.Potion.Recovery.Rejuvenation.Basic")
	
	self:AddCategory("Muffin.Potion.Health")
	self:AddCategory("Muffin.Potion.Combo")
	
	self:AddCategory("Consumable.Cooldown.Stone.Health.Other")
	self:AddCategory("Consumable.Cooldown.Stone.Health.Statue")
	self:AddCategory("Consumable.Cooldown.Stone.Health.Warlock")

	--self:AddCategory("Consumable.Cooldown.Potion.Rejuvenation")
	--self:AddCategory("Consumable.Cooldown.Potion.Health.Coilfang")
	--self:AddCategory("Consumable.Cooldown.Potion.Health.Tempest Keep")
	--self:AddCategory("Consumable.Cooldown.Potion.Health.Blades Edge")
	--self:AddCategory("Consumable.Cooldown.Potion.Health.Anywhere")
	--self:AddCategory("Consumable.Cooldown.Potion.Health.PvP")
	--self:AddCategory("Consumable.Cooldown.Potion.Health.Basic")
end


local AutoBarButtonHearth = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonHearth"] = AutoBarButtonHearth

function AutoBarButtonHearth.prototype:init(parentBar, buttonDB)
	AutoBarButtonHearth.super.prototype.init(self, parentBar, buttonDB)
	
	local class = AutoBar.CLASS

	if (class == "DEATHKNIGHT" or class == "DRUID" or class == "MAGE" or class == "SHAMAN" or class == "WARLOCK" or class ==  "MONK") then
		self:AddCategory("Spell.Portals")
	end

	if(buttonDB.hearth_include_ancient_dalaran and class == "MAGE") then
		self:AddCategory("Spell.AncientDalaranPortals")
	end
	
	self:AddCategory("Misc.Hearth")
end

function AutoBarButtonHearth.prototype:AddOptions(optionList, passValue)
	self:SetOptionBoolean(optionList, passValue, "hearth_include_ancient_dalaran", L["HearthIncludeAncientDalaran"])
end


local AutoBarButtonMount = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonMount"] = AutoBarButtonMount

_, _, spellIconList["Amani War Bear"] = AutoBar:LoggedGetSpellInfo(43688)

function AutoBarButtonMount.prototype:init(parentBar, buttonDB)
	AutoBarButtonMount.super.prototype.init(self, parentBar, buttonDB)

	if (not AutoBarCategoryList["Spell.Mount"]) then
		AutoBarCategoryList["Spell.Mount"] = AutoBarSpells:new( "Spell.Mount", spellIconList["Amani War Bear"], {} )
		AutoBarCategoryList["Spell.Mount"]:SetNoSpellCheck(true)
	end
	self:AddCategory("Spell.Mount")

	local buttonData = AutoBar.db.char.buttonDataList[buttonDB.buttonKey]
	if (not buttonData) then
		buttonData = {}
		AutoBar.db.char.buttonDataList[buttonDB.buttonKey] = buttonData
	end
	
	if(buttonDB.mount_show_favourites == nil) then buttonDB.mount_show_favourites = true end
	if(buttonDB.mount_show_nonfavourites == nil) then buttonDB.mount_show_nonfavourites = false end

	buttonData.SetBest = self.SetBest
	self.flyable = -1
	self:Refresh(parentBar, buttonDB)
end

function AutoBarButtonMount.prototype:Refresh(parentBar, buttonDB, updateMount)
	AutoBarButtonMount.super.prototype.Refresh(self, parentBar, buttonDB)

	local category = AutoBarCategoryList["Spell.Mount"]
	if (not category) then
		AutoBarCategoryList["Spell.Mount"] = AutoBarSpells:new(
			"Spell.Mount", spellIconList["Amani War Bear"], {})
		category = AutoBarCategoryList["Spell.Mount"]
		category:SetNoSpellCheck(true)
		category.unInitialized = true
	end
	
	local companionType = "MOUNT"
	local count = GetNumCompanions(companionType)
	local total_mounts = C_MountJournal.GetNumMounts()
	local thisIsSpam = true

--print("NumCompanions:" .. count .. " UpdateMount:" .. tostring(updateMount))

	if (count > 0) then
		if (not category.castList) then
			category.castList = {}
		end

		local unInitialized = category.unInitialized --or (# category.castList ~= count)
		local spellName
		thisIsSpam = not unInitialized
--print("AutoBarButtonMount.prototype:Refresh unInitialized", unInitialized, "thisIsSpam", thisIsSpam, category.unInitialized, # category.castList, count)
		for index = 1, total_mounts, 1 do
			local creatureName, spellID, icon, active, isUsable, _, isFavorite, _, _, hideOnChar, isCollected = C_MountJournal.GetMountInfo(index)
--			print("  MountName:" .. creatureName .. " active:" .. tostring(active) .. " hideOnChar:" .. tostring(hideOnChar) .. " collected:" .. tostring(isCollected))
			--creatureID, creatureName, spellID, icon, active = GetCompanionInfo(companionType, index)
			spellName = GetSpellInfo(spellID)
			local user_selected = (isFavorite and buttonDB.mount_show_favourites) or (not isFavorite and buttonDB.mount_show_nonfavourites)
			if (unInitialized and isCollected and not hideOnChar and isUsable and user_selected) then
				spellIconList[spellName] = icon
				AutoBarSearch:RegisterSpell(spellName, true)
				local spellInfo = AutoBarSearch.spells[spellName]
				spellInfo.spellLink = "spell:" .. spellID
				category.castList[# category.castList + 1] = spellName
			end
			if (active and updateMount) then
				local buttonData = AutoBar.db.char.buttonDataList[self.buttonName]
				if (AutoBar.flyable) then
--print("AutoBarButtonMount.prototype:Refresh flyingMount", buttonData.flyingMount, "-->", spellName)
					if (buttonData.flyingMount ~= spellName) then
						thisIsSpam = false
--print("AutoBarButtonMount.prototype:Refresh thisIsSpam", thisIsSpam, buttonData.flyingMount, spellName)
					end
					buttonData.flyingMount = spellName
				else
--print("AutoBarButtonMount.prototype:Refresh groundMount", buttonData.groundMount, "-->", spellName)
					if (buttonData.groundMount ~= spellName) then
						thisIsSpam = false
--print("AutoBarButtonMount.prototype:Refresh thisIsSpam", thisIsSpam, buttonData.groundMount, spellName)
					end
					buttonData.groundMount = spellName
				end
			end
		end
		category.unInitialized = nil
	end
	return thisIsSpam
end

function AutoBarButtonMount.prototype:AddOptions(optionList, passValue)
	self:SetOptionBoolean(optionList, passValue, "mount_show_favourites", L["MountShowFavourites"])
	self:SetOptionBoolean(optionList, passValue, "mount_show_nonfavourites", L["MountShowNonFavourites"])
end

function AutoBarButtonMount.prototype:Learned(parentBar, buttonDB, updateMount)
--	AutoBarButtonMount.super.prototype.Learned(self, parentBar, buttonDB)


end
--[[
/dump GetSpellInfo(43688)
/dump GetSpellInfo("Amani War Bear")
/dump AutoBarCategoryList["Spell.Mount"]
/script AutoBarSearch.sorted:Update("AutoBarButtonMount")
/dump AutoBarSearch.sorted:GetList("AutoBarButtonMount")
--]]

function AutoBarButtonMount.prototype.SetBest(sorted, buttonDB, buttonData, sortedItems, searchItems)
	local stopProcessing
	local flyable = AutoBar.flyable
	local self = AutoBar.buttonList[buttonDB.buttonKey]
	if (self.flyable ~= flyable) then
		self.flyable = flyable
		local mountId = nil
		if (flyable) then
			mountId = buttonData.flyingMount
		else
			mountId = buttonData.groundMount
		end

		if (mountId) then
			buttonData.arrangeOnUse = mountId
		end
	end
	return stopProcessing
end

--- Temporary until Blizzard makes their code work for mounts & critters
function AutoBarButtonMount.prototype:UpdateUsable()
	local frame = self.frame
	local itemType = frame:GetAttribute("type")
	if (itemType) then
		if (AutoBar.inCombat) then
			frame.icon:SetVertexColor(0.4, 0.4, 0.4)
		else
			frame.icon:SetVertexColor(1.0, 1.0, 1.0)
			frame.hotKey:SetVertexColor(1.0, 1.0, 1.0)
		end

		local popupHeader = self.frame.popupHeader
		if (popupHeader) then
			for _, popupButton in pairs(popupHeader.popupButtonList) do
				frame = popupButton.frame
				if (AutoBar.inCombat) then
					frame.icon:SetVertexColor(0.4, 0.4, 0.4)
				else
					frame.icon:SetVertexColor(1.0, 1.0, 1.0)
					frame.hotKey:SetVertexColor(1.0, 1.0, 1.0)
				end
			end
		end
	end
end



local AutoBarButtonPets = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonPets"] = AutoBarButtonPets

_, _, spellIconList["Phoenix Hatchling"] = AutoBar:LoggedGetSpellInfo(46599)

function AutoBarButtonPets.prototype:init(parentBar, buttonDB)
	AutoBarButtonPets.super.prototype.init(self, parentBar, buttonDB)

--if (not AutoBarCategoryList["Spell.Critter"]) then
--	AutoBarCategoryList["Spell.Critter"] = AutoBarSpells:new(
--		"Spell.Critter", spellIconList["Phoenix Hatchling"], {})
--	AutoBarCategoryList["Spell.Critter"]:SetNoSpellCheck(true)
--end
--self:AddCategory("Spell.Critter")

	self:Refresh(parentBar, buttonDB)
end

function AutoBarButtonPets.prototype:Refresh(parentBar, buttonDB)
	AutoBarButtonPets.super.prototype.Refresh(self, parentBar, buttonDB)

--	if (not AutoBarCategoryList["Spell.Critter"]) then
--		AutoBarCategoryList["Spell.Critter"] = AutoBarSpells:new(
--			"Spell.Critter", spellIconList["Phoenix Hatchling"], {})
--		AutoBarCategoryList["Spell.Critter"]:SetNoSpellCheck(true)
--	end
--	local category = AutoBarCategoryList["Spell.Critter"]

--	local companionType = "CRITTER"
--	local count = GetNumCompanions(companionType)
--
--	if (count > 0) then
--		if (not category.castList) then
--			category.castList = {}
--		end
--		local castList = category.castList
--
--		local spellName, icon
--		local creatureID, creatureName, spellID, active
--		for index = 1, count, 1 do
--			creatureID, creatureName, spellID, icon, active = GetCompanionInfo(companionType, index)
--			spellName = GetSpellInfo(spellID)
--			spellIconList[spellName] = icon
--			AutoBarSearch:RegisterSpell(spellName, true)
--			local spellInfo = AutoBarSearch.spells[spellName]
--			spellInfo.spellLink = "spell:" .. spellID
--			category.castList[index] = spellName
--		end
--	end                             

--	local _, pet_count = C_PetJournal.GetNumPets()
--	local index, pet_id, owned, favorite, description, icon
--	for index = 1, pet_count, 1 do
--		local pet_data = {C_PetJournal.GetPetInfoByIndex(index)}
--		pet_id = pet_data[1] 
--		owned = pet_data[3]
--		favorite = pet_data[6]
--		icon = pet_data[9]
--		description = pet_data[13]
--	end
	
end


--- Temporary until Blizzard makes their code work for mounts & critters
function AutoBarButtonPets.prototype:UpdateUsable()
	local frame = self.frame
	local itemType = frame:GetAttribute("type")
	if (itemType) then
		frame.icon:SetVertexColor(1.0, 1.0, 1.0)
		frame.hotKey:SetVertexColor(1.0, 1.0, 1.0)

		local popupHeader = self.frame.popupHeader
		if (popupHeader) then
			for _, popupButton in pairs(popupHeader.popupButtonList) do
				frame = popupButton.frame
				frame.icon:SetVertexColor(1.0, 1.0, 1.0)
				frame.hotKey:SetVertexColor(1.0, 1.0, 1.0)
			end
		end
	end
end


local AutoBarButtonPickLock = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonPickLock"] = AutoBarButtonPickLock

function AutoBarButtonPickLock.prototype:init(parentBar, buttonDB)
	AutoBarButtonPickLock.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Misc.Unlock")
	self:AddCategory("Misc.Lockboxes")
end

local AutoBarButtonMillHerbs = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonMillHerbs"] = AutoBarButtonMillHerbs

function AutoBarButtonMillHerbs.prototype:init(parentBar, buttonDB)
	AutoBarButtonMillHerbs.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Tradeskill.Gather.Herbalism")
end


local AutoBarButtonMiscFun = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonMiscFun"] = AutoBarButtonMiscFun

function AutoBarButtonMiscFun.prototype:init(parentBar, buttonDB)
	AutoBarButtonMiscFun.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Food.Feast")
	self:AddCategory("Misc.Usable.Permanent")
	self:AddCategory("Misc.Usable.Fun")
	self:AddCategory("Misc.Usable.Replenished")
end

local AutoBarButtonSunsongRanch = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonSunsongRanch"] = AutoBarButtonSunsongRanch

function AutoBarButtonSunsongRanch.prototype:init(parentBar, buttonDB)
	AutoBarButtonSunsongRanch.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Muffin.SunSongRanch")
end

local AutoBarButtonGarrison = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonGarrison"] = AutoBarButtonGarrison

function AutoBarButtonGarrison.prototype:init(parentBar, buttonDB)
	AutoBarButtonGarrison.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Muffin.Garrison")
end

local AutoBarButtonQuest = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonQuest"] = AutoBarButtonQuest

function AutoBarButtonQuest.prototype:init(parentBar, buttonDB)
	AutoBarButtonQuest.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Misc.Usable.StartsQuest")
	self:AddCategory("Muffin.Misc.Quest")
	self:AddCategory("Misc.Usable.BossItem")
end


local AutoBarButtonRecovery = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonRecovery"] = AutoBarButtonRecovery

function AutoBarButtonRecovery.prototype:init(parentBar, buttonDB)
	AutoBarButtonRecovery.super.prototype.init(self, parentBar, buttonDB)

	if (AutoBar.CLASS == "ROGUE") then
		self:AddCategory("Consumable.Buff.Energy")
	end
	
	if (AutoBar.CLASS == "WARRIOR" or AutoBar.CLASS == "DRUID") then
		self:AddCategory("Consumable.Buff.Rage")
		self:AddCategory("Muffin.Potion.Rage")
	end

	if  (AutoBar:ClassUsesMana(AutoBar.CLASS)) then
		--self:AddCategory("Consumable.Potion.Recovery.Mana.Endless")
		--self:AddCategory("Consumable.Potion.Recovery.Mana.Basic")
	
		--self:AddCategory("Consumable.Potion.Recovery.Rejuvenation.Basic")
		
		self:AddCategory("Muffin.Potion.Mana")
		self:AddCategory("Muffin.Potion.Combo")


		self:AddCategory("Consumable.Cooldown.Stone.Mana.Other")
		--self:AddCategory("Consumable.Cooldown.Potion.Rejuvenation")
		--self:AddCategory("Consumable.Cooldown.Potion.Mana.Basic")
		--self:AddCategory("Consumable.Cooldown.Potion.Mana.Pvp")
		--self:AddCategory("Consumable.Cooldown.Potion.Mana.Coilfang")
		--self:AddCategory("Consumable.Cooldown.Potion.Mana.Tempest Keep")
		--self:AddCategory("Consumable.Cooldown.Potion.Mana.Blades Edge")
		--self:AddCategory("Consumable.Cooldown.Potion.Mana.Anywhere")
	end
end




local AutoBarButtonCooldownDrums = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonCooldownDrums"] = AutoBarButtonCooldownDrums

function AutoBarButtonCooldownDrums.prototype:init(parentBar, buttonDB)
	AutoBarButtonCooldownDrums.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Cooldown.Drums")
end


local AutoBarButtonCooldownPotionCombat = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonCooldownPotionCombat"] = AutoBarButtonCooldownPotionCombat

function AutoBarButtonCooldownPotionCombat.prototype:init(parentBar, buttonDB)
	AutoBarButtonCooldownPotionCombat.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Cooldown.Potion.Combat")
end


local AutoBarButtonCooldownStoneCombat = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonCooldownStoneCombat"] = AutoBarButtonCooldownStoneCombat

function AutoBarButtonCooldownStoneCombat.prototype:init(parentBar, buttonDB)
	AutoBarButtonCooldownStoneCombat.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Cooldown.Stone.Combat")
end


local AutoBarButtonCooldownPotionHealth = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonCooldownPotionHealth"] = AutoBarButtonCooldownPotionHealth

function AutoBarButtonCooldownPotionHealth.prototype:init(parentBar, buttonDB)
	AutoBarButtonCooldownPotionHealth.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Cooldown.Potion.Health.Basic")
	self:AddCategory("Consumable.Cooldown.Potion.Health.PvP")
	self:AddCategory("Consumable.Cooldown.Potion.Health.Coilfang")
	self:AddCategory("Consumable.Cooldown.Potion.Health.Tempest Keep")
	self:AddCategory("Consumable.Cooldown.Potion.Health.Blades Edge")
	self:AddCategory("Consumable.Cooldown.Potion.Health.Anywhere")
end


local AutoBarButtonCooldownStoneHealth = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonCooldownStoneHealth"] = AutoBarButtonCooldownStoneHealth

function AutoBarButtonCooldownStoneHealth.prototype:init(parentBar, buttonDB)
	AutoBarButtonCooldownStoneHealth.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Cooldown.Stone.Health.Other")
	self:AddCategory("Consumable.Cooldown.Stone.Health.Statue")
	self:AddCategory("Consumable.Cooldown.Stone.Health.Warlock")
end


local AutoBarButtonCooldownPotionMana = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonCooldownPotionMana"] = AutoBarButtonCooldownPotionMana

function AutoBarButtonCooldownPotionMana.prototype:init(parentBar, buttonDB)
	AutoBarButtonCooldownPotionMana.super.prototype.init(self, parentBar, buttonDB)

	if (AutoBar.CLASS == "ROGUE") then
		self:AddCategory("Consumable.Buff.Energy")
	end
	
	if (AutoBar.CLASS == "WARRIOR" or AutoBar.CLASS == "DRUID") then
		self:AddCategory("Consumable.Buff.Rage")
		self:AddCategory("Muffin.Potion.Rage")
	end

	if(AutoBar:ClassUsesMana(AutoBar.CLASS)) then
		self:AddCategory("Muffin.Potion.Mana")
		--self:AddCategory("Consumable.Cooldown.Potion.Mana.Anywhere")
	end

end


local AutoBarButtonCooldownStoneMana = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonCooldownStoneMana"] = AutoBarButtonCooldownStoneMana

function AutoBarButtonCooldownStoneMana.prototype:init(parentBar, buttonDB)
	AutoBarButtonCooldownStoneMana.super.prototype.init(self, parentBar, buttonDB)

	if (AutoBar.CLASS ~= "ROGUE" and AutoBar.CLASS ~= "WARRIOR") then
		self:AddCategory("Consumable.Cooldown.Stone.Mana.Other")
	end
end


local AutoBarButtonCooldownPotionRejuvenation = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonCooldownPotionRejuvenation"] = AutoBarButtonCooldownPotionRejuvenation

function AutoBarButtonCooldownPotionRejuvenation.prototype:init(parentBar, buttonDB)
	AutoBarButtonCooldownPotionRejuvenation.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Cooldown.Potion.Rejuvenation")
end



local AutoBarButtonCooldownStoneRejuvenation = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonCooldownStoneRejuvenation"] = AutoBarButtonCooldownStoneRejuvenation

function AutoBarButtonCooldownStoneRejuvenation.prototype:init(parentBar, buttonDB)
	AutoBarButtonCooldownStoneRejuvenation.super.prototype.init(self, parentBar, buttonDB)

	if (AutoBar.CLASS ~= "ROGUE" and AutoBar.CLASS ~= "WARRIOR") then
--		self:AddCategory("Consumable.Cooldown.Potion.Rejuvenation")
	end
end


local AutoBarButtonShields = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonShields"] = AutoBarButtonShields

function AutoBarButtonShields.prototype:init(parentBar, buttonDB)
	AutoBarButtonShields.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Shields")
end


local AutoBarButtonSpeed = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonSpeed"] = AutoBarButtonSpeed

function AutoBarButtonSpeed.prototype:init(parentBar, buttonDB)
	AutoBarButtonSpeed.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Consumable.Buff.Speed")
end


local AutoBarButtonStance = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonStance"] = AutoBarButtonStance

function AutoBarButtonStance.prototype:init(parentBar, buttonDB)
	AutoBarButtonStance.super.prototype.init(self, parentBar, buttonDB)

	if (AutoBar.CLASS == "WARRIOR") then
		self:AddCategory("Spell.Stance")
	end
end

function AutoBarButtonStance.prototype:GetLastUsed()
	local nStance = GetShapeshiftForm(true)
	local _, name = GetShapeshiftFormInfo(nStance)
	return name
end


local AutoBarButtonStealth = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonStealth"] = AutoBarButtonStealth

function AutoBarButtonStealth.prototype:init(parentBar, buttonDB)
	AutoBarButtonStealth.super.prototype.init(self, parentBar, buttonDB)
	
	self:AddCategory("Spell.Stealth")
end




local AutoBarButtonSeal = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonSeal"] = AutoBarButtonSeal

function AutoBarButtonSeal.prototype:init(parentBar, buttonDB)
	AutoBarButtonSeal.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Seal")
end


local AutoBarButtonGuildSpell = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonGuildSpell"] = AutoBarButtonGuildSpell

function AutoBarButtonGuildSpell.prototype:init(parentBar, buttonDB)
	AutoBarButtonGuildSpell.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Guild")
end


--------------------------------------------------ADDING NEW FUNCTIONALITY HERE

local totemAir = 4
local totemEarth = 2
local totemFire = 1
local totemWater = 3

local destroyMacro = {
	[totemFire] = "/run DestroyTotem(1)",
	[totemEarth] = "/run DestroyTotem(2)",
	[totemWater] = "/run DestroyTotem(3)",
	[totemAir] = "/run DestroyTotem(4)",
}
local function DestroyTotem(frame, totemType)
	frame:SetAttribute("type2", "macro")
	frame:SetAttribute("macrotext2", destroyMacro[totemType])
end

local AutoBarButtonTotemAir = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonTotemAir"] = AutoBarButtonTotemAir

function AutoBarButtonTotemAir.prototype:init(parentBar, buttonDB)
	AutoBarButtonTotemAir.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Totem.Air")
end

function AutoBarButtonTotemAir.prototype:SetupAttributes(button, bag, slot, spell, macroId, itemId, itemData)
	AutoBarButtonTotemAir.super.prototype.SetupAttributes(self, button, bag, slot, spell, macroId, itemId, itemData)

	DestroyTotem(self.frame, totemAir)
end

-- Set cooldown based on the deployed totem
function AutoBarButtonTotemAir.prototype:UpdateCooldown()
	local itemType = self.frame:GetAttribute("type")
	if (itemType and not self.parentBar.faded) then
		local start, duration, enabled = 0, 0, 1
		local totemName
		_, totemName, start, duration = GetTotemInfo(totemAir)

		if (start and duration and enabled and start > 0 and duration > 0) then
			self.frame.cooldown:Show() -- ToDo: necessary?
			CooldownFrame_SetTimer(self.frame.cooldown, start, duration, enabled)
		else
			CooldownFrame_SetTimer(self.frame.cooldown, 0, 0, 0)
		end

		local popupHeader = self.frame.popupHeader
		if (popupHeader) then
			for _, popupButton in pairs(popupHeader.popupButtonList) do
				popupButton:UpdateCooldown()
			end
		end
	end
end
-- /script CooldownFrame_SetTimer(AutoBarButtonTotemAirFrame.cooldown, 0, 0, 0)

local AutoBarButtonTotemEarth = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonTotemEarth"] = AutoBarButtonTotemEarth

function AutoBarButtonTotemEarth.prototype:init(parentBar, buttonDB)
	AutoBarButtonTotemEarth.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Totem.Earth")
end

function AutoBarButtonTotemEarth.prototype:SetupAttributes(button, bag, slot, spell, macroId, itemId, itemData)
	AutoBarButtonTotemEarth.super.prototype.SetupAttributes(self, button, bag, slot, spell, macroId, itemId, itemData)

	DestroyTotem(self.frame, totemEarth)
end

-- Set cooldown based on the deployed totem
function AutoBarButtonTotemEarth.prototype:UpdateCooldown()
	local itemType = self.frame:GetAttribute("type")
	if (itemType and not self.parentBar.faded) then
		local start, duration, enabled = 0, 0, 1
		local totemName
		_, totemName, start, duration = GetTotemInfo(totemEarth)

		if (start and duration and enabled and start > 0 and duration > 0) then
			self.frame.cooldown:Show() -- ToDo: necessary?
			CooldownFrame_SetTimer(self.frame.cooldown, start, duration, enabled)
		else
			CooldownFrame_SetTimer(self.frame.cooldown, 0, 0, 0)
		end

		local popupHeader = self.frame.popupHeader
		if (popupHeader) then
			for _, popupButton in pairs(popupHeader.popupButtonList) do
				popupButton:UpdateCooldown()
			end
		end
	end
end


local AutoBarButtonTotemFire = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonTotemFire"] = AutoBarButtonTotemFire

function AutoBarButtonTotemFire.prototype:init(parentBar, buttonDB)
	AutoBarButtonTotemFire.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Totem.Fire")
end

function AutoBarButtonTotemFire.prototype:SetupAttributes(button, bag, slot, spell, macroId, itemId, itemData)
	AutoBarButtonTotemFire.super.prototype.SetupAttributes(self, button, bag, slot, spell, macroId, itemId, itemData)

	DestroyTotem(self.frame, totemFire)
end

-- Set cooldown based on the deployed totem
function AutoBarButtonTotemFire.prototype:UpdateCooldown()
	local itemType = self.frame:GetAttribute("type")
	if (itemType and not self.parentBar.faded) then
		local start, duration, enabled = 0, 0, 1
		local totemName
		_, totemName, start, duration = GetTotemInfo(totemFire)

		if (start and duration and enabled and start > 0 and duration > 0) then
			self.frame.cooldown:Show() -- ToDo: necessary?
			CooldownFrame_SetTimer(self.frame.cooldown, start, duration, enabled)
		else
			CooldownFrame_SetTimer(self.frame.cooldown, 0, 0, 0)
		end

		local popupHeader = self.frame.popupHeader
		if (popupHeader) then
			for _, popupButton in pairs(popupHeader.popupButtonList) do
				popupButton:UpdateCooldown()
			end
		end
	end
end


local AutoBarButtonTotemWater = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonTotemWater"] = AutoBarButtonTotemWater

function AutoBarButtonTotemWater.prototype:init(parentBar, buttonDB)
	AutoBarButtonTotemWater.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Totem.Water")
end

function AutoBarButtonTotemWater.prototype:SetupAttributes(button, bag, slot, spell, macroId, itemId, itemData)
	AutoBarButtonTotemWater.super.prototype.SetupAttributes(self, button, bag, slot, spell, macroId, itemId, itemData)

	DestroyTotem(self.frame, totemWater)
end

-- Set cooldown based on the deployed totem
function AutoBarButtonTotemWater.prototype:UpdateCooldown()
	local itemType = self.frame:GetAttribute("type")
	if (itemType and not self.parentBar.faded) then
		local start, duration, enabled = 0, 0, 1
		local totemName
		_, totemName, start, duration = GetTotemInfo(totemWater)

		if (start and duration and enabled and start > 0 and duration > 0) then
			self.frame.cooldown:Show() -- ToDo: necessary?
			CooldownFrame_SetTimer(self.frame.cooldown, start, duration, enabled)
		else
			CooldownFrame_SetTimer(self.frame.cooldown, 0, 0, 0)
		end

		local popupHeader = self.frame.popupHeader
		if (popupHeader) then
			for _, popupButton in pairs(popupHeader.popupButtonList) do
				popupButton:UpdateCooldown()
			end
		end
	end
end


local AutoBarButtonTrap = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonTrap"] = AutoBarButtonTrap

function AutoBarButtonTrap.prototype:init(parentBar, buttonDB)
	AutoBarButtonTrap.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Spell.Trap")
end


local AutoBarButtonTrinket1 = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonTrinket1"] = AutoBarButtonTrinket1

function AutoBarButtonTrinket1.prototype:init(parentBar, buttonDB)
	AutoBarButtonTrinket1.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Muffin.Gear.Trinket")
	buttonDB.targeted = TRINKET1_SLOT
	buttonDB.equipped = TRINKET1_SLOT
end

function AutoBarButtonTrinket1.prototype:GetLastUsed()
	local _, itemId = AutoBar.LinkDecode(GetInventoryItemLink("player", TRINKET1_SLOT))
	return itemId
end

function AutoBarButtonTrinket1.prototype:SetDragCursor()
	local itemType = self.frame:GetAttribute("type")
	if (itemType) then
		if (itemType == "item") then
			PickupInventoryItem(TRINKET1_SLOT)
		end
	end
end

local AutoBarButtonTrinket2 = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonTrinket2"] = AutoBarButtonTrinket2

function AutoBarButtonTrinket2.prototype:init(parentBar, buttonDB)
	AutoBarButtonTrinket2.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Muffin.Gear.Trinket")
	buttonDB.targeted = TRINKET2_SLOT
	buttonDB.equipped = TRINKET2_SLOT
end

function AutoBarButtonTrinket2.prototype:GetLastUsed()
	local _, itemId = AutoBar.LinkDecode(GetInventoryItemLink("player", TRINKET2_SLOT))
	return itemId
end

function AutoBarButtonTrinket2.prototype:SetDragCursor()
	local itemType = self.frame:GetAttribute("type")
	if (itemType) then
		if (itemType == "item") then
      PickupInventoryItem(TRINKET2_SLOT)
		end
	end
end


local equipTrinket2String = "/equipslot " .. TRINKET2_SLOT .. " "
function AutoBarButtonTrinket2.prototype:SetupAttributes(button, bag, slot, spell, macroId, itemId, itemData)
--AutoBar:Print("AutoBarButtonTrinket2.prototype:SetupAttributes " .. tostring(bag) .. "|" .. tostring(slot) .. "|" .. tostring(itemId))

	local _, equippedItemId = AutoBar.LinkDecode(GetInventoryItemLink("player", TRINKET2_SLOT))

	if (equippedItemId == itemId) then
		AutoBarButtonTrinket2.super.prototype.SetupAttributes(self, button, bag, slot, spell, macroId, itemId, itemData)
	elseif (not bag) then
		AutoBarButtonTrinket2.super.prototype.SetupAttributes(self, button, bag, slot, spell, macroId, itemId, itemData)
	else
		local _,_,_,_,_,_,_,_,_,macroTexture = GetItemInfo(tonumber(itemId))
		local macroText = equipTrinket2String .. bag .." " .. slot -- "/equipslot [button:2] Z X Y" to do right click filtering

		button.macroText = macroText
		button.macroTexture = macroTexture
		local macroId = macroText
		AutoBarSearch:RegisterMacro(macroId, nil, L["AutoBarButtonTrinket2"], macroText)
--AutoBar:Print("AutoBarButtonTrinket2.prototype:SetupAttributes macroId " .. tostring(macroId))
		AutoBarButtonTrinket2.super.prototype.SetupAttributes(self, button, nil, nil, nil, macroId)
	end
end


local AutoBarButtonWater = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonWater"] = AutoBarButtonWater

function AutoBarButtonWater.prototype:init(parentBar, buttonDB)
	AutoBarButtonWater.super.prototype.init(self, parentBar, buttonDB)

	if (AutoBar.CLASS == "MAGE" and not buttonDB.disableConjure) then
		self:AddCategory("Consumable.Water.Conjure")
	end
	if (AutoBar:ClassUsesMana(AutoBar.CLASS)) then
		self:AddCategory("Consumable.Water.Percentage")
		self:AddCategory("Consumable.Water.Basic")

		self:AddCategory("Muffin.Food.Mana.Basic")
	end
end

--function AutoBarButtonWater.prototype:Refresh(parentBar, buttonDB)
--	AutoBarButtonWater.super.prototype.Refresh(self, parentBar, buttonDB)
--	if (AutoBar.CLASS == "MAGE") then
--		if (buttonDB.disableConjure) then
--			self:DeleteCategory("Consumable.Water.Conjure")
--			buttonDB.castSpell = nil
--			AutoBarCategoryList["Consumable.Water.Basic"]:SetCastList(nil)
--		else
--			self:AddCategory("Consumable.Water.Conjure")
--		end
--	end
--end

function AutoBarButtonWater.prototype:AddOptions(optionList, passValue)
	if (AutoBar.CLASS == "MAGE") then
		self:SetOptionBoolean(optionList, passValue, "disableConjure", L["Disable Conjure Button"])
	end
end


local AutoBarButtonWaterBuff = AceOO.Class(AutoBarButton)
AutoBar.Class["AutoBarButtonWaterBuff"] = AutoBarButtonWaterBuff

function AutoBarButtonWaterBuff.prototype:init(parentBar, buttonDB)
	AutoBarButtonWaterBuff.super.prototype.init(self, parentBar, buttonDB)

	self:AddCategory("Muffin.Food.Mana.Buff")

end



--[[
/script print(AutoBarProfile.basic[2].castSpell)
/script print(AutoBar.buttons[2].castSpell)
/script AutoBarSAB1Border:Hide()
/dump AutoBar.buttonList["AutoBarButtonMount"].frame:GetScript("OnEvent")
/dump AutoBarCategoryList["Spell.Portals"]
/dump AutoBarSearch.sorted:GetList("AutoBarButtonMount")
--]]
