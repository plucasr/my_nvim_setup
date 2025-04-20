vim.opt.rtp:prepend(vim.fn.stdpath('config') .. '/lua')

require('core.lazy')
require('core.keymaps')
require('plugins') 
