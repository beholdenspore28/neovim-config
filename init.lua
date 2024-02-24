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

-------------------------------------------------------------------------------
--                                 COLORSCHEME                               --
-------------------------------------------------------------------------------

vim.cmd.colorscheme("quiet")
--background opacity
--	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
--	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

-------------------------------------------------------------------------------
--                                  KEYBINDS                                 --
-------------------------------------------------------------------------------

vim.g.mapleader = " "

--find file
vim.keymap.set("n","<leader>f",":find ./**/")

--netrw (file tree / file manager)
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("n", "<leader>e", ":25Lex<CR>")

--buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
vim.keymap.set("n", "<leader>q", ":bd!<CR>")

--window switching
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

--scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")

--visual mode maps
--find and replace
vim.keymap.set("v","<leader>r","\"hy:%s/<C-r>h//g<left><left>")
--move selected line down
vim.keymap.set("v","J",":m '>+1<CR>gv=gv");
--move selected line up
vim.keymap.set("v","K",":m '>-2<CR>gv=gv");

--lsp: format buffer
vim.keymap.set("n","<leader><F7>",":lua vim.lsp.buf.format()<CR>");

-------------------------------------------------------------------------------
--                          LUA-LANGUAGE-SERVER                              --
-------------------------------------------------------------------------------

--THIS IS BROKEN FOR SOME REASON

--require'lspconfig'.lua_ls.setup {
--  on_init = function(client)
--    local path = client.workspace_folders[1].name
--    if not vim.loop.fs_stat(path..'/.luarc.json') and not 
--			vim.loop.fs_stat(path..'/.luarc.jsonc') then
--      client.config.settings = i
--			vim.tbl_deep_extend('force', client.config.settings, {
--        Lua = {
--          runtime = {
--            -- Tell the language server which version of Lua you're using
--            -- (most likely LuaJIT in the case of Neovim)
--            version = 'LuaJIT'
--          },
--          -- Make the server aware of Neovim runtime files
--          workspace = {
--            checkThirdParty = false,
--            library = {
--              vim.env.VIMRUNTIME
--              -- "${3rd}/luv/library"
--              -- "${3rd}/busted/library",
--            }
--            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
--            -- library = vim.api.nvim_get_runtime_file("", true)
--          }
--        }
--      })
--
--      client.notify(
--				"workspace/didChangeConfiguration",
--				{ settings = client.config.settings }
--			)
--    end
--    return true
--  end
--}
