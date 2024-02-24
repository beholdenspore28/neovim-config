local map = vim.keymap.set
--code snippets
map("i", "if<CR>", "if @ then<CR>@<CR>end<C-c>kk0/@<CR>")
map("i", "elif<CR>", "elseif @ then<CR>@<CR>end<C-c>kk0/@<CR>")
map("i", "fun<CR>", "function @ (@)<CR>@<CR>end<C-c>kk/@<CR>")

map("i", "for<CR>", "for @ do<CR>@<CR>end<C-c>kk0/@<CR>")
map("i", "fori<CR>", "for i = 1, @ do<CR>@<CR>end<C-c>kk0/@<CR>")
map("i", "forj<CR>", "for j = 1, @ do<CR>@<CR>end<C-c>kk0/@<CR>")
map("i", "fork<CR>", "for k = 1, @ do<CR>@<CR>end<C-c>kk0/@<CR>")

map("i", "while<CR>", "while @ do<CR>@<CR>end<C-c>kk0/@<CR>")

--comment toggling
map("v", "<C-/>", "<S-i>--<Esc>")
map("n", "<C-/>", "0i--<Esc>")

-------------------------------------------------------------------------------
--                           LUA-LANGUAGE-SERVER                             --
-------------------------------------------------------------------------------

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
