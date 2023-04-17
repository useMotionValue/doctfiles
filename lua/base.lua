vim.cmd("autocmd!")
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- THIS IS FOR BUILTIN LSP
  vim.diagnostic.open_float(0, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})

vim.wo.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false

vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'

-- UI config
vim.opt.number = true          -- show absolute number
vim.opt.relativenumber = false -- add numbers to each line on the left side
vim.opt.cursorline = true      -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true      -- open new vertical split bottom
vim.opt.splitright = true      -- open new horizontal splits right
vim.opt.termguicolors = true   -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = true
vim.opt.showcmd = true

-- use system clipboard
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true

-- Tab
vim.opt.tabstop = 2      -- number of visual spaces per TAB
vim.opt.softtabstop = 2  -- number of spacesin tab when editing
vim.opt.shiftwidth = 2   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- allow the mouse to be used in Nvim
vim.opt.mouse = 'a'

-- No Wrap lines
vim.opt.wrap = false
vim.opt.backspace = { 'start', 'eol', 'indent' }

-- Finding files - Search down into subfolders
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
