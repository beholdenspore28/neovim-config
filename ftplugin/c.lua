local map = vim.keymap.set
local opts = { noremap = true }

-------------------------------------------------------------------------------
--SECTION: CODE SNIPPETS
-------------------------------------------------------------------------------

map("i", "`switch", "switch (@) {<CR>case: @;<CR>break;<CR>}<C-c>kkk0/@<CR>", opts)

map("i", "`for", "for (@;@;@) {<CR><CR>}<C-c>kk0/@<CR>", opts)

map("i", "`if", "if (@) {<CR>@<CR>}<C-c>kk0/@<CR>", opts)

map("i", "`elif", "else if (@) {<CR>@<CR>}<C-c>kk0/@<CR>", opts)

map("i", "`fun", "@ @ (@) {<CR>@<CR>}<C-c>kk/@<CR>", opts)

map("i", "`fori", 
	"for (int i = 0; i < @; i++) {<CR>@<CR>}<C-c>kk0/@<CR>", opts)

map("i", "`forj", 
	"for (int j = 0; j < @; j++) {<CR>@<CR>}<C-c>kk0/@<CR>", opts)

map("i", "`fork", 
	"for (int k = 0; k < @; k++) {<CR>@<CR>}<C-c>kk0/@<CR>", opts)

map("i", "`while", "while (@) {<CR>@<CR>}<C-c>kk0/@<CR>", opts)

map("i", "`struct", "typedef struct {<CR>@<CR>} @;<C-c>kk0/@<CR>", opts)

map("i",",.", "->")

map("i", "`sec", 
"//************************************************************************"..
"***//<CR><Tab> SECTION:<CR>***********************************************"..
"****************************//<Up><Tab>")

--comment toggling
map("n", "<Leader>c", "<S-i>/*<Esc><S-a>*/<Esc>")

-------------------------------------------------------------------------------
--SECTION: CLANG-LSP
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
