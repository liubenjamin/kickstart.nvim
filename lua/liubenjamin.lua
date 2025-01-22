vim.o.scrolloff = 10
vim.o.relativenumber = true

local hop = require 'hop'
vim.keymap.set('n', ';', hop.hint_words)
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('i', 'kj', '<esc>', { noremap = true })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')
vim.keymap.set('n', '<leader>n', '<cmd>tabprev<cr>')
vim.keymap.set('n', '<leader>p', '<cmd>tabnext<cr>')
vim.api.nvim_create_autocmd('VimLeave', { command = 'set guicursor=a:ver10-blinkon1-blinkwait10' })
vim.cmd.colorscheme 'catppuccin-macchiato'

function RestoreCursorPosition()
  local line = vim.fn.line '\'"'
  if line > 1 and line <= vim.fn.line '$' and vim.bo.filetype ~= 'commit' and vim.fn.index({ 'xxd', 'gitrebase' }, vim.bo.filetype) == -1 then
    vim.cmd 'normal! g`"'
  end
end

if vim.fn.has 'autocmd' then
  vim.cmd [[
    autocmd BufReadPost * lua RestoreCursorPosition()
  ]]
end
