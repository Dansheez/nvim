local nmap = function(key, effect, desc)
  vim.keymap.set('n', key, effect, { silent = true, noremap = true, desc = desc })
end

local vmap = function(key, effect, desc)
  vim.keymap.set('v', key, effect, { silent = true, noremap = true, desc = desc })
end

local imap = function(key, effect, desc)
  vim.keymap.set('i', key, effect, { silent = true, noremap = true, desc = desc })
end

-- PEROSNAL
-- ripgrep primeagen
local builtin = require 'telescope.builtin'
nmap('<leader>sp', function()
  builtin.grep_string { search = vim.fn.input 'Grep > ' }
end, '[P]rimeagen [S]earch')

-- explorer
nmap('<leader>e', vim.cmd.Ex, 'Open explorer')

-- keep cursor in one place for half page move
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-U>zz')

-- move blocks in visual mode
vmap('J', ":m '>+1<CR>gv=gv", 'Move block down')
vmap('K', ":m '<-2<CR>gv=gv", 'Move block up')

-- keep search terms in the middle
nmap('n', 'nzzzv', '')
nmap('N', 'Nzzzv', '')

-- make current file executable
nmap('<leader>x', '<cmd>!chmod +x %>CR?', 'Make current file executable')

-- paste on visual block without replacing buffer
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste on visual block without replacing buffer' })

-- Harpoon
local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

nmap('<leader>a', function()
  harpoon:list():add()
end, '[Harpoon] Add file')

nmap('<C-h>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, '[Harpoon] Open harpoon window')

-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
nmap('<C-S-P>', function()
  harpoon:list():prev()
end, '[Harpoon] Previous file')
nmap('<C-S-N>', function()
  harpoon:list():next()
end, '[Harpoon] Next file')

-- UNDOTREE
nmap('<leader>u', vim.cmd.UndotreeToggle, '[Undotree] Show undotree')
-- TOGGLETERM
require 'toggleterm'
nmap('<C-§>', '<cmd>ToggleTerm<CR>', '[ToggleTerm] Open terminal')
nmap('<leader>§', '<cmd>ToggleTerm<CR>', '[ToggleTerm] Open terminal')

