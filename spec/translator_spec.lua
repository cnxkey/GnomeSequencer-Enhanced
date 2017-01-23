describe('API Translator', function()
  setup (function()
    require("../spec/mockGSE")
    require("../GSE/API/Statics")
    require("../GSE/API/InitialOptions")
    require("../GSE/Localization/enUS")
    require("../GSE/Localization/enUSHash")
    require("../GSE/Localization/enUSSHADOW")
    require("../GSE/API/StringFunctions")
    require("../GSE/API/translator")
  end)

  it("Passes through non spell commands ", function()
    assert.are.equal("/targetenemy", GSE.TranslateString("/targetenemy", "enUS", "enUS"))

  end)

  -- it("checks that mods are retained", function()
  --   local originalstring = '/castsequence [talent:7/3] reset=combat Glacial Advance, [talent:6/1] Frostscythe, Frost Strike, Frost Strike, [talent:6/1] Frostscythe, [talent:6/1] Frostscythe'
  --   local newstring = GSE.TranslateString(originalstring, "enUS", "enUS")
  --   local finalstring = GSE.UnEscapeString(newstring)
  --   assert.are.equal(originalstring, finalstring)
  -- end)

  it("checks that ctrl:mods are retained", function()
    local originalstring = '/castsequence [mod:ctrl] !Rip, Ferocious Bite, Ferocious Bite, Ferocious Bite; [nomod] Rake, shred, shred, shred, shred'
    local newstring = GSE.TranslateString(originalstring, "enUS", "enUS")
    local finalstring = GSE.UnEscapeString(newstring)
    assert.are.equal(originalstring, finalstring)
  end)

  -- it("checks that [talent:123] choices are kept within a cast sequence]", function()
  --   local originalstring = '/castsequence reset=combat Frost Strike, Obliterate, [talent:6/1] Frostscythe'
  --   local newstring = GSE.TranslateString(originalstring, "enUS", "enUS")
  --   local finalstring = GSE.UnEscapeString(newstring)
  --   assert.are.equal(originalstring, finalstring)
  -- end)

  it ("checks that pet stuff is not weird", function()
    local originalstring = '/petautocaston [nogroup] Growl; [@focus,noexists] Growl'
    local newstring = GSE.TranslateString(originalstring, "enUS", "enUS")
    local finalstring = GSE.UnEscapeString(newstring)
    assert.are.equal(originalstring, finalstring)
  end)

  it("checks for weird macro translations that break things", function ()
    local originalstring = "/cast [mod:alt, talent:6/1, talent:7/1, nochanneling:Void Torrent] [mod:alt, talent:6/1, talent:7/2, nochanneling:Void Torrent] Power Infusion"
    local newstring = GSE.TranslateString(originalstring, "enUS", "enUS")
    local finalstring = GSE.UnEscapeString(newstring)
    assert.are.equal(originalstring, finalstring)

  end)

  it ("tests other unusual modifier cases", function ()
    local originalstring = "/castsequence [@mouseover,help,nodead] [@player] Void Torrent, Power Infusion"
    local newstring = GSE.TranslateString(originalstring, "enUS", "enUS")
    local finalstring = GSE.UnEscapeString(newstring)
    assert.are.equal(originalstring, finalstring)

  end)
end)
