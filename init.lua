-------------------------------------------------------------------------------
--                                 SETTINGS                                  --
-------------------------------------------------------------------------------

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.guicursor = ""
vim.opt.incsearch = true
vim.opt.scrolloff = 20
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
--vim.opt.foldnestmax = 1
--vim.opt.foldmethod = "indent"

-------------------------------------------------------------------------------
--                                 COLORSCHEME                               --
-------------------------------------------------------------------------------

vim.cmd.colorscheme("lunaperche")
--background opacity
--	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
--	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

-------------------------------------------------------------------------------
--                                  KEYBINDS                                 --
-------------------------------------------------------------------------------

vim.g.mapleader = " "
local map = vim.keymap.set
local opts = { noremap = true }

--Esc emulation
map("i", "jk","<Esc>", opts)
map("i", "kj","<Esc>", opts)

--find file
map("n","<leader>f",":find ./**/*", opts)

--netrw (file tree / file manager)
map("n", "<leader>pv", ":Ex<CR>", opts)
map("n", "<leader>e", ":25Lex<CR>", opts)

--buffers
map("n", "<Tab>", ":bnext<CR>:buffers<CR>", opts)
map("n", "<S-Tab>", ":bprev<CR>:buffers<CR>", opts)
map("n", "<leader>d", ":bd!<CR>", opts)

--window switching
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

--scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "j", "jzz", opts)
map("n", "k", "kzz", opts)

--visual mode maps
--find and replace
map("v","<leader>r","\"hy:%s/<C-r>h//g<left><left>", opts)
--move selected line down
map("v","J",":m '>+1<CR>gv=gv", opts);
--move selected line up
map("v","K",":m '>-2<CR>gv=gv", opts);
--indent selected text
map("v", "<Tab>","<S-i><Tab><Esc>")

--lsp: format buffer
map("n","<leader><F7>",":lua vim.lsp.buf.format()<CR>", opts);
