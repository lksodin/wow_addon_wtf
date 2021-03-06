--[[

	Report for Gatherer

]]

local filterName = Gatherer.Locale.Tr("REPORT_SEARCH_BY_SOURCE")

local function findSource(source, ...)
	local value, found
	for i = 1, select("#", ...) do
		value = select(i, ...)
		found = value:find(source, 1, true)
		if (found == 1) then return value end
	end
	return false
end

function filterFunction(parameter, zone, nodeid, index, x,y, count, harvest, inspect, source, gtype)
	if (findSource(parameter:lower(), strsplit(",", source:lower())) ~= false) then return true end
	return false
end

Gatherer.Report.AddButton(filterName, filterFunction)
