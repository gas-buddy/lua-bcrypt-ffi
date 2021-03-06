local bcrypt = require "bcrypt"

describe("bcrypt", function ()
it("_VERSION field", function()
    assert.equal("1.0.0", bcrypt._VERSION)
  end)
  it("_AUTHOR field", function()
    assert.equal("Max Metral", bcrypt._AUTHOR)
  end)
  it("_LICENSE field", function()
    assert.equal("MIT", bcrypt._LICENSE)
  end)
  it("_URL field", function()
    assert.equal("https://github.com/gas-buddy/lua-bcrypt-ffi", bcrypt._URL)
  end)
end)

describe("digest()", function()
  it("should throw error on invalid argument", function()
    assert.has_error(function()
      bcrypt.digest(nil)
    end, "bad argument #1 to 'digest' (string expected, got nil)")

    assert.has_error(function()
      bcrypt.digest("", nil)
    end, "bad argument #2 to 'digest' (number expected, got nil)")

    assert.has_error(function()
      bcrypt.digest("", "")
    end, "bad argument #2 to 'digest' (number expected, got string)")
  end)
end)

describe("verify()", function()
  it("should throw error on invalid argument", function()
    assert.has_error(function()
      bcrypt.verify(nil)
    end, "bad argument #1 to 'verify' (string expected, got nil)")

    assert.has_error(function()
      bcrypt.verify("", nil)
    end, "bad argument #2 to 'verify' (string expected, got nil)")

    assert.has_error(function()
      bcrypt.verify("", 10)
    end, "bad argument #2 to 'verify' (string expected, got number)")
  end)
end)

describe("bcrypt", function()
  it("should digest and verify", function ()
    local digest = bcrypt.digest("this is a test", 10)
    assert.truthy(bcrypt.verify("this is a test", digest))
  end)

  it("should verify a test vector", function ()
    assert.truthy(bcrypt.verify("correctbatteryhorsestapler", "$2a$12$mACnM5lzNigHMaf7O1py1O3vlf6.BA8k8x3IoJ.Tq3IB/2e7g61Km"))
    assert.truthy(bcrypt.verify("abcdefghijklmnopqrstuvwxyz", "$2a$06$.rCVZVOThsIa97pEDOxvGuRRgzG64bvtJ0938xuqzv18d3ZpQhstC"))
    assert.truthy(bcrypt.verify("abcdefghijklmnopqrstuvwxyz", "$2a$08$aTsUwsyowQuzRrDqFflhgekJ8d9/7Z3GV3UcgvzQW3J5zMyrTvlz."))
    assert.truthy(bcrypt.verify("abcdefghijklmnopqrstuvwxyz", "$2a$08$aTsUwsyowQuzRrDqFflhgekJ8d9/7Z3GV3UcgvzQW3J5zMyrTvlz."))
    assert.truthy(bcrypt.verify("abcdefghijklmnopqrstuvwxyz", "$2a$12$D4G5f18o7aMMfwasBL7GpuQWuP3pkrZrOAnqP.bmezbMng.QwJ/pG"))
  end)
end)