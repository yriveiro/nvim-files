local g = vim.g

g.completion_auto_change_source = 1
g.completion_enable_auto_paren = 1
g.completion_enable_auto_signature = 1
g.completion_enable_auto_hover = 1
g.completion_enable_snippet = "vim-vsnip"
g.completion_sorting = "alphabet"
g.completion_customize_lsp_label = {
  Function = " [function]",
  Method = " [method]",
  Reference = " [refrence]",
  Enum = " [enum]",
  Field = "ﰠ [field]",
  Keyword = " [key]",
  Variable = " [variable]",
  Folder = " [folder]",
  Snippet = " [snippet]",
  Operator = " [operator]",
  Module = " [module]",
  Text = "ﮜ [text]",
  Class = " [class]",
  Interface = " [interface]",
  File = " [file]",
  Constant = "ℇ [constant]",
}

g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
