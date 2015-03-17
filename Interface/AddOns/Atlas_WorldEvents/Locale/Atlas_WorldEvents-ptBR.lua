﻿-- $Id: Atlas_WorldEvents-ptBR.lua 77 2015-03-01 07:55:32Z arith $
--[[

	Atlas World Events, a World of Warcraft map browser for world events
	Copyright 2011 ~ 2015 Arith Hsu

	This file is a plugin of Atlas.

	Atlas World Events is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas World Events is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local AL = AceLocale:NewLocale("Atlas_WorldEvents", "ptBR", false);

if AL then
-- AL["A Cloudlet of Classy Cologne"] = ""
-- AL["A Friendly Chat..."] = ""
-- AL["A gift for a Lord of Ironforge"] = ""
-- AL["A gift for a Lord of Stormwind"] = ""
-- AL["A Gift for the Banshee Queen"] = ""
-- AL["A Gift for the High Chieftain"] = ""
-- AL["A Gift for the High Priestess of Elune"] = ""
-- AL["A Gift for the Prophet"] = ""
-- AL["A Gift for the Regent Lord of Quel'Thalas"] = ""
-- AL["A Gift for the Warchief"] = ""
-- AL["Aimee <Pie, Pastry & Cakes>"] = ""
-- AL["Alliance Questline"] = ""
-- AL["A New Supplier of Souvenirs"] = ""
-- AL["A Perfect Puff of Perfume"] = ""
-- AL["A Smokywood Pastures' Thank You!"] = ""
-- AL["Baine Bloodhoof"] = ""
-- AL["Bark for Drohn's Distillery!"] = ""
-- AL["Bark for T'chali's Voodoo Brewery!"] = ""
-- AL["Bark for the Barleybrews!"] = ""
-- AL["Bark for the Thunderbrews!"] = ""
-- AL["Baruma <Replica Armor Prizes>"] = ""
-- AL["Barum <Replica Armor Prizes>"] = ""
-- AL["Becan Barleybrew"] = ""
-- AL["Belbi Quikswitch"] = ""
-- AL["Bizzle Quicklift"] = ""
-- AL["Blix Fixwidget"] = ""
-- AL["Blood Elf Commoner"] = ""
AL["Blue: "] = "Azul:" -- Needs review
-- AL["Bok Dropcertain"] = ""
-- AL["Bonbon Blitz"] = ""
-- AL["Boomie Sparks <Fireworks>"] = ""
-- AL["Boxey Boltspinner"] = ""
AL["Brewfest"] = "CervaFest" -- Needs review
AL["Brewfest!"] = "CervaFest!" -- Needs review
-- AL["Brewfest_Date"] = ""
-- AL["Brew For Brewfest"] = ""
-- AL["Brew of the Month Club"] = ""
-- AL["Candy Buckets"] = ""
-- AL["Catch the Wild Wolpertinger!"] = ""
-- AL["Chronos <He Who Never Forgets!>"] = ""
-- AL["Chug and Chuck!"] = ""
-- AL["Cort Gorestein"] = ""
-- AL["Costumed Orphan Matron"] = ""
-- AL["Crushing the Crown"] = ""
-- AL["Daenrand Dawncrest <Heirloom Prizes>"] = ""
-- AL["Daily Group"] = ""
-- AL["Daily Quest"] = ""
-- AL["Daran Thunderbrew"] = ""
-- AL["Dark Iron Mole Machine Wreckage"] = ""
-- AL["Darkspear Gumdrop"] = ""
-- AL["Darnassus Marzipan"] = ""
-- AL["Detective Snap Snagglebolt"] = ""
-- AL["Draenei Commoner"] = ""
-- AL["Driz Tumblequick"] = ""
-- AL["Dwarf Commoner"] = ""
AL["Elder Arp"] = "Ancião Arp" -- Needs review
AL["Elder Beldak"] = "Elder Beldak" -- Needs review
AL["Elder Bellowrage"] = "Ancião Vocifúria" -- Needs review
AL["Elder Bladeleaf"] = "Ancião Folhâmina" -- Needs review
AL["Elder Bladesing"] = "Anciã Chialâmina" -- Needs review
AL["Elder Bladeswift"] = "Ancião Açolesto" -- Needs review
AL["Elder Bloodhoof"] = "Ancião Casco Sangrento" -- Needs review
AL["Elder Bluewolf"] = "Ancião Lobo Azul" -- Needs review
AL["Elder Brightspear"] = "Anciã Setalume" -- Needs review
AL["Elder Bronzebeard"] = "Ancião Barbabronze" -- Needs review
AL["Elder Chogan'gada"] = "Ancião Chogan'gada" -- Needs review
AL["Elder Darkcore"] = "Ancião Negrocerne" -- Needs review
AL["Elder Darkhorn"] = "Anciã Chifre Preto" -- Needs review
AL["Elder Dawnstrider"] = "Anciã Andarilha da Aurora" -- Needs review
AL["Elder Dreamseer"] = "Vidente Onírico Ancião" -- Needs review
AL["Elder Ezra Wheathoof"] = "Ancião Ezra Casco de Trigo" -- Needs review
AL["Elder Fargal"] = "Ancião Fargal" -- Needs review
AL["Elder Farwhisper"] = "Ancião Murmulonge" -- Needs review
AL["Elder Goldwell"] = "Ancião Poçodouro" -- Needs review
AL["Elder Graveborn"] = "Ancião Nascitumba" -- Needs review
AL["Elder Graymane"] = "Ancião Pelo Pardo" -- Needs review
AL["Elder Hammershout"] = "Ancião Malhogrito" -- Needs review
AL["Elder High Mountain"] = "Ancião Monte Alto" -- Needs review
AL["Elder Highpeak"] = "Ancião Topoalto" -- Needs review
AL["Elder Igasho"] = "Ancião Igasho" -- Needs review
AL["Elder Ironband"] = "Ancião Bandaferro" -- Needs review
AL["Elder Jarten"] = "Ancião Jarten" -- Needs review
AL["Elder Kilias"] = "Ancião Kilias" -- Needs review
AL["Elder Lunaro"] = "Ancião Lunaro" -- Needs review
AL["Elder Meadowrun"] = "Anciã Correcampo" -- Needs review
AL["Elder Mistwalker"] = "Anciã Andanévoa" -- Needs review
AL["Elder Moonstrike"] = "Anciã Raioluna" -- Needs review
AL["Elder Moonwarden"] = "Ancião Velaluna" -- Needs review
AL["Elder Morndeep"] = "Ancião Alvafunda" -- Needs review
AL["Elder Morningdew"] = "Anciã Serenalva" -- Needs review
AL["Elder Morthie"] = "Ancião Morthie" -- Needs review
AL["Elder Muraco"] = "Ancião Muraco" -- Needs review
AL["Elder Nightwind"] = "Ancião Noctéolas" -- Needs review
AL["Elder Northal"] = "Ancião Northal" -- Needs review
AL["Elder Nurgen"] = "Ancião Nurgen" -- Needs review
AL["Elder Obsidian"] = "Ancião Obsidiano" -- Needs review
AL["Elder Ohanzee"] = "Ancião Ohanzi" -- Needs review
-- AL["Elder Pamuya"] = ""
-- AL["Elder Primestone"] = ""
-- AL["Elder Ragetotem"] = ""
-- AL["Elder Riversong"] = ""
-- AL["Elder Rumblerock"] = ""
-- AL["Elder Sandrene"] = ""
-- AL["Elder Sardis"] = ""
-- AL["Elder Silvervein"] = ""
-- AL["Elder Skychaser"] = ""
-- AL["Elder Skygleam"] = ""
-- AL["Elder Skyseer"] = ""
-- AL["Elder Skywarden"] = ""
-- AL["Elder Snowcrown"] = ""
-- AL["Elder Splitrock"] = ""
-- AL["Elder Starglade"] = ""
-- AL["Elder Starsong"] = ""
-- AL["Elder Starweave"] = ""
-- AL["Elder Stonebeard"] = ""
-- AL["Elder Stonefort"] = ""
-- AL["Elder Stonespire"] = ""
-- AL["Elder Stormbrow"] = ""
-- AL["Elder Tauros"] = ""
-- AL["Elder Thoim"] = ""
-- AL["Elder Thunderhorn"] = ""
-- AL["Elder Wanikaya"] = ""
-- AL["Elder Whurain"] = ""
-- AL["Elder Wildmane"] = ""
-- AL["Elder Windrun"] = ""
-- AL["Elder Windtotem"] = ""
-- AL["Elder Winterhoof"] = ""
-- AL["Elder Yurauk"] = ""
-- AL["End"] = ""
-- AL["Entrance (Transported)"] = ""
-- AL["Faded Lovely Greeting Card"] = ""
-- AL["Fariel Starsong"] = ""
-- AL["Feast of Winter Veil"] = ""
-- AL["Finlay Coolshot <Tonk Challenge>"] = ""
-- AL["Fire Brigade Practice"] = ""
-- AL["Fire Training"] = ""
-- AL["Fireworks At The Gilded Rose"] = ""
-- AL["Flynn Firebrew"] = ""
-- AL["Forsaken Commoner"] = ""
-- AL["Furmund"] = ""
-- AL["Gelvas Grimegate <Souvenir & Toy Prizes>"] = ""
-- AL["Glodrak Huntsniper"] = ""
-- AL["Gnome Commoner"] = ""
-- AL["Gnomeregan Gumdrop"] = ""
-- AL["Goldark Snipehunter"] = ""
-- AL["Goli Krumn"] = ""
-- AL["Gotri's Traveling Gear"] = ""
-- AL["Great-father Winter"] = ""
-- AL["Greatfather Winter"] = ""
-- AL["Great-father Winter is Here!"] = ""
-- AL["Greatfather Winter is Here!"] = ""
-- AL["Grimtotem Elder"] = ""
-- AL["Hallow_Date"] = ""
-- AL["Hallow's End"] = ""
-- AL["Hallow's End Treats for Jesper!"] = ""
-- AL["Hallow's End Treats for Spoops!"] = ""
-- AL["Harvest_Date"] = ""
-- AL["Harvest Festival"] = ""
-- AL["He Shoots, He Scores!"] = ""
-- AL["Historian Karnik"] = ""
-- AL["Honoring a Hero"] = ""
-- AL["Horde Questline"] = ""
-- AL["Hot On The Trail"] = ""
-- AL["Human Commoner"] = ""
-- AL["Innkeeper Allison"] = ""
-- AL["Innkeeper Firebrew"] = ""
-- AL["Innkeeper Gryshka"] = ""
-- AL["Innkeeper Norman"] = ""
-- AL["Innkeeper Pala"] = ""
-- AL["Innkeeper Saelienne"] = ""
AL["(Inside the fortress)"] = "dentro da fortaleza" -- Needs review
-- AL["Inspector Snip Snagglebolt"] = ""
-- AL["Ipfelkofer Ironkeg"] = ""
-- AL["Ironforge Mint"] = ""
-- AL["It's Hammer Time"] = ""
-- AL["Jan. 23 ~ Feb. 13"] = ""
-- AL["Ja'ron"] = ""
-- AL["Javnir Nashak"] = ""
-- AL["Jesper"] = ""
-- AL["Jessica Rogers <Ring Toss>"] = ""
-- AL["Jun. 21 ~ Jul. 4"] = ""
-- AL["June 21 ~ July 4"] = ""
-- AL["June 21 - July 4"] = ""
-- AL["Junior Detective"] = ""
-- AL["Kali Remik"] = ""
-- AL["Kaymard Copperpinch"] = ""
-- AL["Keeping the Faire Sparkling"] = ""
-- AL["Kerri Hicks <The Strongest Woman Alive!>"] = ""
-- AL["King Varian Wrynn"] = ""
-- AL["Korgol Crushskull <The Pit Master>"] = ""
-- AL["Kwee Q. Peddlefeet"] = ""
-- AL["L90ETC Concert"] = ""
-- AL["Lady Sylvanas Windrunner"] = ""
-- AL["Larkin Thunderbrew"] = ""
-- AL["\"Let the Fires Come!\""] = ""
-- AL["Lhara <Pet & Mount Prizes>"] = ""
-- AL["Lor'themar Theron"] = ""
-- AL["Love_Date"] = ""
-- AL["Love is in the Air"] = ""
-- AL["Lower"] = ""
-- AL["Lunar_Date"] = ""
-- AL["Lunar Festival"] = ""
-- AL["Major Cities"] = ""
-- AL["Marion Sutton"] = ""
-- AL["Masked Orphan Matron"] = ""
-- AL["Maxima Blastenheimer <Darkmoon Faire Cannoneer>"] = ""
-- AL["Midsummer_Date"] = ""
-- AL["Midsummer Fire Festival"] = ""
-- AL["Mola <Whack-a-Mole>"] = ""
-- AL["Muradin Bronzebeard"] = ""
-- AL["Neill Ramstein"] = ""
AL["(Next to the flight master)"] = "Próximo ao mestre de voo" -- Needs review
-- AL["Night Elf Commoner"] = ""
-- AL["Now This is Ram Racing... Almost."] = ""
-- AL["Oct. 18 ~ Oct. 31"] = ""
-- AL["October 18 ~ October 31"] = ""
-- AL["Omen"] = ""
AL["(On the ground)"] = "No chão" -- Needs review
AL["(On the roof of the bank)"] = "No telhado do banco" -- Needs review
-- AL["Orange: "] = ""
-- AL["Orc Commoner"] = ""
-- AL["Orgrimmar Nougat"] = ""
AL["(Outside the city gate)"] = "Fora do portão da cidade" -- Needs review
AL["(Outside the gate)"] = "Fora do portão" -- Needs review
-- AL["Petting Zoo"] = ""
-- AL["Pilfering Perfume"] = ""
-- AL["Pink Elekks On Parade"] = ""
-- AL["Pol Amberstill"] = ""
-- AL["Portals"] = ""
-- AL["Professor Thaddeus Paleo <Darkmoon Cards>"] = ""
-- AL["Prophet Velen"] = ""
-- AL["Public Relations Agent"] = ""
-- AL["Purple: "] = ""
-- AL["Putting the Carnies Back Together Again"] = ""
-- AL["Putting the Crunch in the Frog"] = ""
-- AL["Putting Trash to Good Use"] = ""
-- AL["Quest: "] = ""
-- AL["Quest Destination"] = ""
-- AL["Quest: Elune's Blessing"] = ""
AL["Ram Master Ray"] = "Mestre de Carneiros Ray" -- Needs review
AL["Ray'ma"] = "Ray'ma" -- Needs review
-- AL["Red: "] = ""
-- AL["Rinling"] = ""
-- AL["Roka"] = ""
-- AL["Rona Greenteeth"] = ""
-- AL["Runetotem the Elder"] = ""
-- AL["Sagorne Creststrider"] = ""
-- AL["Sayge"] = ""
-- AL["Sazz Coincatcher <Game Tokens>"] = ""
-- AL["Selina Dourman <Darkmoon Faire Information>"] = ""
AL["Sep. 28 ~ Oct. 13"] = "28 de Set. ~ 13 de Out." -- Needs review
-- AL["Snivel's Sweetheart"] = ""
-- AL["Something is in the Air (and it Ain't Love)"] = ""
-- AL["Something Stinks"] = ""
-- AL["Southeast coast of the Lake Elune'ara"] = ""
-- AL["Spoops"] = ""
-- AL["Stamp Thunderhorn <Food Vendor>"] = ""
-- AL["Start"] = ""
-- AL["Steven Stagnaro <Fishing Trainer>"] = ""
-- AL["Stop the Fires!"] = ""
-- AL["Stormwind Nougat"] = ""
-- AL["Sylannia <Drink Vendor>"] = ""
-- AL["Talvash del Kissel"] = ""
AL["Tapper Swindlekeg"] = "Torneiro Barrilantra" -- Needs review
-- AL["Target: Turtle"] = ""
-- AL["Tatia Brine <Fishing Supplies>"] = ""
AL["Tauren Commoner"] = "Plebeu Tauren" -- Needs review
-- AL["Teleportologist Fozlebub <Gone Fishin'>"] = ""
-- AL["Test Your Strength"] = ""
-- AL["The Abominable Greench"] = ""
-- AL["The Feast of Winter Veil"] = ""
-- AL["The first Sunday each month, last for a week"] = ""
-- AL["The Gilded Rose"] = ""
-- AL["The Humanoid Cannonball"] = ""
AL["There and Back Again"] = "Lá e de volta outra vez" -- Needs review
-- AL["The Reason for the Season"] = ""
-- AL["(The roof of Scholomance, outside the dungeon)"] = ""
AL["This One Time, When I Was Drunk..."] = "Certa vez, quando eu estava bêbado..." -- Needs review
-- AL["Thunder Bluff Marzipan"] = ""
-- AL["Tonk Commander"] = ""
-- AL["Treats for Great-father Winter"] = ""
-- AL["Treats for Greatfather Winter"] = ""
-- AL["Trick: "] = ""
-- AL["Trixi Sharpworth <Game Tokens>"] = ""
AL["Troll Commoner"] = "Plebeu Troll" -- Needs review
-- AL["Tyrande Whisperwind"] = ""
-- AL["Uncommon Scents"] = ""
-- AL["Undercity Mint"] = ""
-- AL["Valadar Starsong"] = ""
-- AL["Wagner Hammerstrike"] = ""
-- AL["Winter_Date"] = ""
-- AL["World Events Maps"] = ""
-- AL["Wulmort Jinglepocket"] = ""
-- AL["You're a Mean One..."] = ""
-- AL["Zina Sharpworth <Game Tokens>"] = ""

end
