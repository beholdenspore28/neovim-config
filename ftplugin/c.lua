local map = vim.keymap.set
local opts = { noremap = true }

-------------------------------------------------------------------------------
--                             CODE SNIPPETS                                 --
-------------------------------------------------------------------------------

map("i", "switch<CR>", 
	"switch (@) {<CR>case: @;<CR>break;<CR>}<C-c>kkk0/@<CR>", opts)

map("i", "for<CR>", "for (@;@;@) {<CR><CR>}<C-c>kk0/@<CR>", opts)

map("i", "if<CR>", "if (@) {<CR>@<CR>}<C-c>kk0/@<CR>", opts)

map("i", "elif<CR>", "else if (@) {<CR>@<CR>}<C-c>kk0/@<CR>", opts)

map("i", "fun<CR>", "@ @ (@) {<CR>@<CR>}<C-c>kk/@<CR>", opts)

map("i", "fori<CR>", 
	"for (int i = 0; i < @; i++) {<CR>@<CR>}<C-c>kk0/@<CR>", opts)

map("i", "forj<CR>", 
	"for (int j = 0; j < @; j++) {<CR>@<CR>}<C-c>kk0/@<CR>", opts)

map("i", "fork<CR>", 
	"for (int k = 0; k < @; k++) {<CR>@<CR>}<C-c>kk0/@<CR>", opts)

map("i", "while<CR>", "while @ do<CR>@<CR>end<C-c>kk0/@<CR>", opts)

-------------------------------------------------------------------------------
--                                   OTHER                                   --
-------------------------------------------------------------------------------

--comment toggling
map("v", "<C-/>", "<S-i>//<Esc>", opts)
map("n", "<C-/>", "0i//<Esc>", opts)

-------------------------------------------------------------------------------
--                                 CLANGD LSP                                --
-------------------------------------------------------------------------------

local root_files = {
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'configure.ac', -- AutoTools
}

local paths = vim.fs.find(root_files, {stop = vim.env.HOME})
local root_dir = vim.fs.dirname(paths[1])

if root_dir then
	vim.lsp.start({
		cmd = {'clangd'},
		root_dir = root_dir,
	})
end
