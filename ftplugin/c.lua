--C code snippets
vim.keymap.set("i", "if<CR>", "if (@) {<CR><CR>}<C-c>kk0/@<CR>")
vim.keymap.set("i", "fun<CR>", "@ @ (@) {<CR><CR>}<C-c>kkk/@<CR>")
vim.keymap.set("i", "switch<CR>", 
	"switch (@) {<CR>case: @;<CR>break;<CR>}<C-c>kk0/@<CR>")
vim.keymap.set("i", "for<CR>", "for (@;@;@) {<CR><CR>}<C-c>kk0/@<CR>")

--comment toggling
vim.keymap.set("v", "<C-/>", "<S-i>//<Esc>")
vim.keymap.set("n", "<C-/>", "0i//<Esc>")

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
