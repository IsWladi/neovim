-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Map leader

local g     = vim.g
g.mapleader = ','

--remap hjkl
map('n', 'r', '<Left>')
map('n', 't', '<Down>')
map('n', 'n', '<Up>')
map('n', 's', '<Right>')

--para comandos nativos de neovim

--buffers
map('n', '<leader>q', ':q<CR>', {desc = '[no plugin] Exit'}) --salir
map('n', '<leader>a', ':bdelete<CR>', {desc = '[no plugin] Delete current buffer'}) --borrar buffer actual
map('n', '<leader><leader>a', [[:lua require('utils').save_delete_buffers_except_current()<CR>]], { noremap = true, silent = true, desc = '[no plugin] Save and delete all buffers except current'})

map('n', '<leader>o', ':w<CR>', {desc = '[no plugin] Save'}) --guardar
map('n', '<leader><leader>o', ':wa<CR>', {desc = '[no plugin] Save all buffers'}) --guardar todos los buffers

map('n', '<leader>n', ':bnext<CR>', {desc = '[no plugin] Go to next buffer'})
map('n', '<leader>t', ':bprevious<CR>', {desc = '[no plugin] Go to previous buffer'})

map("n", "<leader>u", ':so %<CR>', {desc = '[no plugin] Reload file'}) --recargar archivo

--bajar y subir media pagina
map('n', '<C-d>', '<C-d>zz', {desc = '[no plugin] Scroll down half a page and recenter'})
map('n', '<C-u>', '<C-u>zz', {desc = '[no plugin] Scroll up half a page and recenter'})
--buscar y centrar con m en vez de n
map("n", "m", "nzz", {desc = '[no plugin] Search for next match and recenter'})
map("n", "M", "Nzz", {desc = '[no plugin] Search for previous match and recenter'})
--para normal mode, no highlight
map("n", "<leader>nh", ":nohl<CR>", {desc = '[no plugin] Remove search highlight'})

--para normal mode y visual mode, sustituciones con very very magic
map('n', '<leader>/', ':%s/\\v//g', {desc = '[no plugin] Substitute in normal mode using very magic'})
map('n', '<leader>//', ':g/.*/normal ', {desc = '[no plugin] put normal commands on regex matches'})
map('v', '<leader>/', ':s/\\v//g', {desc = '[no plugin] Substitute in visual mode using very magic'})

-- change tabulations
map('v', '(', '<gv', {desc = '[no plugin] Indent left and reselect'})
map('v', ')', '>gv', {desc = '[no plugin] Indent right and reselect'})

-- live server: browser-sync start --proxy "127.0.0.1:8000" --files "**/*"
