-- [[ Setting options ]]
require('basic.vim-settings')

-- [[ Basic Keymaps ]]
require('basic.keybindings')

-- [[ Basic Autocommands ]]
require('basic.autocommands')

-- [[ Configure and install plugins ]]
require('lazy').setup('plugins')
