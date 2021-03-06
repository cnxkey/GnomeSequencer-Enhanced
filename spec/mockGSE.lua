GSE = {}
GSE.L = {}
GSE.Static = {}
GSE.VersionString = 2000;

GNOME = "UnitTest"

GSELibrary = {}

-- Mock Character FUncitons
function GetTalentTierInfo(tier, ...)
  return 1
end

function GetSpecialization()
  return 11
end

function GetClassInfo(i)
  if i == 11 then
    return "Druid", "DRUID", 11
  else
    return "Paladin", "PALADIN", 2
  end
end

function GetSpecializationInfoByID(id)
  return id, "SPecName", "SPecDescription", 1234567, "file.blp", 1, "DRUID"
end

function UnitClass(str)
  return "Druid", "DRUID", 11
end

function GetUnitName(str)
  local retval = "Unknown"
  if str == "player" then
    retval = "Draik"
  end
  return retval
end

function GetSpellInfo(spellstring)
  print( "GetSpellInfo -- " .. spellstring)
  local name, rank, icon, castTime, minRange, maxRange, spellId
  if type(spellstring) == "string" then
    name = spellstring
    spellId = 1010101
  else
    name = "Eye of Tyr"
    spellId = spellstring
  end
  print( "GetSpellInfo " .. name .. spellId)
  return name, rank, icon, castTime, minRange, maxRange, spellId
end

-- Mock standard functions
function GSE.Print(message, title)
  print (title .. ": " .. message)
end

function GSE.PrintDebugMessage(message, title)
  GSE.Print(message, title)
end


GSE.PVPFlag = false
GSE.inRaid = false
GSE.inMythic = false
GSE.inDungeon = false
GSE.inHeroic = false

function strmatch(string, pattern, initpos)
  return string.match(string, pattern, initpos)
end

function newLocale(application, locale, isDefault, silent)
  local writedefaultproxy = setmetatable({}, {
    __newindex = function(self, key, value)
      if not rawget(registering, key) then
        rawset(registering, key, value == true and key or value)
      end
    end,
    __index = assertfalse
  })
  if isDefault then
    return writedefaultproxy
  end
end

function GetLocale()
  return "enUS"
end

INVSLOT_AMMO = 0
INVSLOT_HEAD = 1
INVSLOT_NECK = 2
INVSLOT_SHOULDER = 3
INVSLOT_BODY = 4 --(shirt)
INVSLOT_CHEST = 5
INVSLOT_WAIST = 6
INVSLOT_LEGS = 7
INVSLOT_FEET = 8
INVSLOT_WRIST = 9
INVSLOT_HAND = 10
INVSLOT_FINGER1 = 11
INVSLOT_FINGER2 = 12
INVSLOT_TRINKET1 = 13
INVSLOT_TRINKET2 = 14
INVSLOT_BACK = 15
INVSLOT_MAINHAND = 16
INVSLOT_OFFHAND = 17
INVSLOT_RANGED = 18
INVSLOT_TABARD = 19
