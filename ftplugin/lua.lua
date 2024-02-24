--comment toggling
vim.keymap.set("v", "<C-/>", "<S-i>--<Esc>")
vim.keymap.set("n", "<C-/>", "0i--<Esc>")

-------------------------------------------------------------------------------
--                           LUA-LANGUAGE-SERVER                             --
local root_files = {
  '.luarc.json',
  '.luarc.jsonc',
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
}

local paths = vim.fs.find(root_files, {stop = vim.env.HOME})
local root_dir = vim.fs.dirname(paths[1])

if root_dir then
	vim.lsp.start({
		cmd = {'lua-language-server'},
		root_dir = root_dir,
	})
end
