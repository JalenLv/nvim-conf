local s = require('luasnip').snippet

local helpers = require 'custom.LuaSnip.luasnip-helper-funcs'
local line_begin = helpers.line_begin

return {
  s({
    trig = 'lsabbr',
    desc = 'luasnip abbreviation',
    snippetTpye = 'autosnippet',
    regTrig = false,
  }, {
    t 'Hello, world!',
  }),
}
