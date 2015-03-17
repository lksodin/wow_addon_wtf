--
-- Muffin.SunSongRanch
--
if not LibStub("LibPeriodicTable-3.1", true) then error("PT3 must be loaded before data") end
LibStub("LibPeriodicTable-3.1"):AddData("Muffin.Gems", "Rev: 4",
{
	["Muffin.Gems.Blue.Raw"] = "23117,23234,23438,27863,27864,32228,36923,36924,36925,37430,38499,52178,52191,71807,76133,76138,76714,97307,97537,97941,98090",
	["Muffin.Gems.Blue.Cut"] = "23116,23118,23119,23120,23121,24033,24035,24037,24039,24051,28463,28464,28465,28468,31860,31861,32200,32201,32202,32203,32206,32210,33135,33137,33141,34256,34831,36767,39915,39919,39920,39927,39932,40008,40009,40010,40011,40014,40119,40120,40121,40122,40125,41440,41441,41442,41443,41447,42145,42146,42155,42156,45880,45881,45987,52086,52087,52088,52089,52168,52169,52170,52171,52235,52242,52244,52246,52261,52262,52263,52264,71817,71818,71819,71820,76502,76504,76505,76506,76570,76571,76572,76573,76636,76637,76638,76639,77140,83144,83148,83149",
	["Muffin.Gems.Red.Raw"] = "23077,23233,23436,27774,27811,28117,28388,32227,32735,34835,36917,36918,36919,37550,37551,38292,38500,38725,39302,39998,40012,52177,52190,52256,54616,71805,76131,76136,97313,98094",
	["Muffin.Gems.Red.Cut"] = "23094,23095,23096,23097,23113,24027,24028,24029,24030,24031,24036,24047,27777,27812,28118,28360,28361,28362,28458,28459,28460,28461,28462,28466,28595,30571,30598,32193,32194,32195,32196,32197,32199,32204,33131,33132,33133,33134,33139,35487,35488,35489,36766,38545,38549,39900,39905,39906,39908,39910,39911,39912,39996,39997,39999,40001,40003,40111,40112,40113,40114,40116,40118,40123,41432,41433,41434,41435,41437,41438,41444,42142,42143,42144,42148,42152,42154,45862,45879,45882,45883,52081,52082,52083,52084,52085,52172,52173,52174,52175,52176,52206,52207,52212,52216,52230,52255,52257,52258,52259,52260,63696,63697,69922,69923,71879,71880,71881,71882,71883,76560,76561,76562,76563,76564,76626,76627,76628,76629,76630,76692,76693,76694,76695,76696,83141,83147,83150,83151,83152",
	["Muffin.Gems.Green.Raw"] = "23079,23437,32249,36932,36933,36934,38503,40232,52182,52192,71810,76137,76139,97308,97312,98025,101380,101492,103661",
	["Muffin.Gems.Green.Cut"] = "23103,23104,23105,24062,24066,24067,27785,27786,27809,27820,30548,30550,30560,30563,30565,30575,30590,30592,30594,30601,30602,30605,30606,30608,32223,32224,32226,32639,33782,35318,35707,35758,35759,39933,39938,39974,39975,39976,39977,39978,39980,39981,39982,39983,39985,39986,39988,39989,39990,39991,39992,40031,40033,40086,40088,40089,40090,40091,40095,40096,40098,40099,40100,40101,40102,40103,40104,40105,40106,40138,40140,40165,40166,40167,40168,40169,40171,40172,40173,40174,40176,40177,40178,40179,40180,40181,40182,41456,41458,41464,41465,41466,41467,41468,41469,41470,41471,41472,41474,41475,41476,41477,41478,41480,41481,52119,52120,52121,52122,52123,52124,52125,52126,52127,52128,52129,52130,52131,52132,52133,52134,52135,52136,52137,52138,52218,52223,52225,52227,52228,52231,52233,52237,52245,52250,68741,71822,71823,71824,71825,71826,71827,71828,71829,71830,71831,71832,71833,71834,71835,71836,71837,71838,71839,76507,76508,76509,76510,76511,76512,76513,76514,76515,76517,76518,76519,76520,76521,76522,76523,76524,76525,76574,76575,76576,76577,76578,76579,76580,76581,76582,76583,76584,76585,76586,76587,76588,76589,76590,76591,76640,76641,76642,76643,76644,76645,76646,76647,76648,76649,76650,76651,76652,76653,76654,76655,76656,76657,77130,77131,77137,77139,77142,77143,77154,88911,88912,88913,88914,88915,88916,88917,88918,88919,88920,88921,88922,88923,88924,88925,88926,88927,88928,93705,93706,93707,93708",
	["Muffin.Gems.Yellow.Raw"] = "23112,23235,23440,28120,28389,32229,34627,36920,36921,36922,38501,52070,52179,52195,71806,76134,76142,97311,97535,97938,98026,98027,98088",
	["Muffin.Gems.Yellow.Cut"] = "23114,23115,24032,24048,24050,24052,24053,27679,28119,28290,28467,28469,28470,32198,32205,32207,32208,32209,33138,33140,33142,33143,33144,35315,35761,38546,38550,39907,39909,39914,39916,39917,39918,40000,40002,40013,40015,40016,40017,40115,40117,40124,40126,40127,40128,41436,41439,41445,41446,41448,41449,42149,42150,42151,42153,42157,42158,44066,52090,52091,52092,52093,52094,52163,52164,52165,52166,52167,52219,52226,52232,52241,52247,52265,52266,52267,52268,52269,71874,71875,71876,71877,71878,76565,76566,76567,76568,76569,76631,76632,76633,76634,76635,76697,76698,76699,76700,76701,77134,83142,83143,83145,83146",
	["Muffin.Gems.Orange.Raw"] = "21929,23439,28122,32231,36929,36930,36931,38502,52181,52193,71808,76130,76140,97538,97943,98028,98051,98089",
	["Muffin.Gems.Orange.Cut"] = "23098,23099,23101,24058,24059,24060,28123,28363,30547,30551,30554,30558,30581,30582,30584,30585,30587,30588,30591,30593,30604,30607,31868,31869,32217,32218,32219,32222,32637,32638,35316,35760,38547,38548,39946,39947,39949,39950,39951,39952,39954,39955,39956,39958,39959,39960,39962,39963,39964,39965,39967,40037,40039,40040,40041,40043,40045,40046,40047,40048,40050,40051,40052,40054,40055,40056,40057,40059,40142,40144,40145,40146,40147,40149,40150,40152,40154,40155,40156,40158,40159,40160,40161,40163,41429,41483,41484,41485,41486,41487,41489,41490,41492,41493,41495,41497,41498,41499,41500,41501,52106,52107,52108,52109,52110,52111,52112,52113,52114,52115,52116,52117,52118,52139,52140,52141,52142,52143,52144,52145,52146,52147,52148,52149,52150,52151,52204,52205,52208,52209,52211,52214,52215,52222,52224,52229,52239,52240,52249,68356,68357,68358,71840,71841,71842,71843,71844,71845,71846,71847,71848,71849,71850,71851,71852,71853,71854,71855,71856,71857,71858,71859,71860,71861,76526,76527,76528,76529,76530,76531,76532,76533,76534,76535,76536,76537,76538,76539,76540,76541,76542,76543,76544,76545,76546,76547,76592,76593,76594,76595,76596,76597,76598,76599,76600,76601,76602,76603,76604,76605,76606,76607,76608,76609,76610,76611,76612,76613,76658,76659,76660,76661,76662,76663,76664,76665,76666,76667,76668,76669,76670,76671,76672,76673,76674,76675,76676,76677,76678,76679,77132,77136,77138,77141,77144,88930,88931,88932,88933,88934,88935,88936,88937,88938,88939,88940,88941,88942,88943,88944,88945,88946,88947,88948,88949,88950,88951,93404,93405,93406",
	["Muffin.Gems.Purple.Raw"] = "23107,23441,32230,36926,36927,36928,38498,52180,52194,71809,76135,76141,97310,97536,97547,97939",
	["Muffin.Gems.Purple.Cut"] = "23100,23106,23108,23109,23110,23111,24054,24055,24056,24057,24061,24065,30546,30549,30552,30553,30555,30556,30559,30564,30566,30572,30573,30574,30583,30586,30589,30600,30603,31116,31117,31118,31862,31863,31864,31865,31866,31867,32211,32212,32213,32214,32215,32216,32220,32221,32225,32634,32635,32636,32833,32836,37503,39934,39935,39936,39937,39939,39940,39941,39942,39943,39944,39945,39948,39953,39957,39961,39966,39968,39979,39984,40022,40023,40024,40025,40026,40027,40028,40029,40030,40032,40034,40038,40044,40049,40053,40058,40085,40092,40094,40129,40130,40131,40132,40133,40134,40135,40136,40137,40139,40141,40143,40148,40151,40153,40157,40162,40164,40170,40175,41450,41451,41452,41453,41454,41455,41457,41459,41460,41461,41462,41463,41473,41479,41482,41488,41491,41494,41496,41502,52095,52096,52097,52098,52099,52100,52101,52102,52103,52104,52105,52152,52153,52154,52155,52156,52157,52158,52159,52160,52161,52162,52203,52210,52213,52217,52220,52221,52234,52236,52238,52243,52248,71862,71863,71864,71865,71866,71867,71868,71869,71870,71871,71872,71873,76548,76549,76550,76551,76552,76553,76554,76555,76556,76557,76558,76559,76614,76615,76616,76617,76618,76619,76620,76621,76622,76623,76624,76625,76680,76681,76682,76683,76684,76685,76686,76687,76688,76689,76690,76691,77133,88952,88953,88954,88955,88956,88958,88959,88960,88961,88962,88963,88987,89674,89675,89676,89677,89678,89679,89680,89681,93408,93409,93410",
	["Muffin.Gems.Meta.Raw"] = "23236,23364,23366,25867,25868,33633,38538,41266,41334,52303,76132,97306,97534,97937",
	["Muffin.Gems.Meta.Cut"] = "25890,25893,25894,25895,25896,25897,25898,25899,25901,28556,28557,32409,32410,32640,32641,34220,35501,35503,41285,41307,41333,41335,41339,41375,41376,41377,41378,41379,41380,41381,41382,41385,41389,41395,41396,41397,41398,41400,41401,44076,44078,44081,44082,44084,44087,44088,44089,52289,52291,52292,52293,52294,52295,52296,52297,52298,52299,52300,52301,52302,68778,68779,68780,76879,76884,76885,76886,76887,76888,76890,76891,76892,76893,76894,76895,76896,76897,95344,95345,95346,95347,95348",
	["Muffin.Gems.Prismatic.Raw"] = "33060,34967,42225,45054,52196,76734",
	["Muffin.Gems.Prismatic.Cut"] = "22459,22460,34142,34143,42701,42702,49110,115803,115804,115805,115806,115807,115808,115809,115811,115812,115813,115814,115815",
	["Muffin.Gems.Raw"] = "m,Muffin.Gems.Blue.Raw,Muffin.Gems.Red.Raw,Muffin.Gems.Green.Raw,Muffin.Gems.Yellow.Raw,Muffin.Gems.Orange.Raw,Muffin.Gems.Purple.Raw,Muffin.Gems.Meta.Raw,Muffin.Gems.Prismatic.Raw",
	["Muffin.Gems.Cut"] = "m,Muffin.Gems.Blue.Cut,Muffin.Gems.Red.Cut,Muffin.Gems.Green.Cut,Muffin.Gems.Yellow.Cut,Muffin.Gems.Orange.Cut,Muffin.Gems.Purple.Cut,Muffin.Gems.Meta.Cut,Muffin.Gems.Prismatic.Cut",


	["Muffin.Gems.Cogwheel"] = "59477,59478,59479,59480,59489,59491,59493,59496,68660,77540,77541,77542,77543,77544,77545,77546,77547",
	["Muffin.Gems.Simple"] = "774,818,1206,1210,1529,1705,3864,5498,5500,7909,7910,7971,11382,12361,12363,12364,12799,12800,13926,19774,23158,23159,24478,24479,36783,36784,52338,52339,77951,77952",
})
