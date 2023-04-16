local keymap = vim.keymap

-- leader key mapping
vim.g.mapleader = " "

keymap.set('i', 'jj', '<Esc>')

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-Down>', ':resize -2<CR>')
keymap.set('n', '<C-Up>', ':resize +2<CR>')
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- git
keymap.set('n', '<leader>gb', ':GitBlame<CR>', { noremap = true, silent = true })

-- comment string
vim.keymap.set("n", "<C-_>", function() require('Comment.api').toggle.linewise.current() end,
  { noremap = true, silent = true })
