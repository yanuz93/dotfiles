local remap = vim.api.nvim_set_keymap

-- override default mapping that conflicts with vim-lexima
vim.g.lexima_no_default_rules = 1
vim.call('lexima#set_default_rules')

vim.g.completion_confirm_key = ""
remap(
  'i', '<CR>',
  table.concat{
  'pumvisible()',
  '? complete_info()["selected"] != "-1"',
  '? "<Plug>(completion_confirm_completion)"',
  ': "<C-g>u".lexima#expand("<LT>CR>", "i")',
  ': v:lua.Util.check_html_char() ? lexima#expand("<LT>CR>", "i")."<ESC>O"',
  ': lexima#expand("<LT>CR>", "i")'
  },
  { silent = true, expr = true }
)

remap(
  'i', '<Tab>',
  'pumvisible() ? "<C-n>" : v:lua.Util.check_backspace() ? "<Tab>" : completion#trigger_completion()',
  { silent = true, noremap = true, expr = true }
)
remap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, expr = true })

-- force completion menu to appear
remap('i', '<C-c>', '<Plug>(completion_trigger)', { noremap = false, silent = true })

-- vim-vsnip stuff
remap('i', '<C-j>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-j>"', { silent = true, expr = true })
remap('s', '<C-j>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-j>"', { silent = true, expr = true })
remap('i', '<C-k>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"', { silent = true, expr = true })
remap('s', '<C-k>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"', { silent = true, expr = true })
