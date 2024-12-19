return {
  'sainnhe/gruvbox-material',
  priority = 1000, -- Load this plugin before others
  config = function()
    -- Set gruvbox-material to dark mode
    vim.g.gruvbox_material_background = 'medium'
    -- Enable the material palette
    vim.g.gruvbox_material_palette = 'material'
    -- Disable bold fonts (optional)
    vim.g.gruvbox_material_bold = false
    -- Set better contrast for sidebars, popups, and floats
    vim.g.gruvbox_material_visual = 'reverse'
    vim.g.gruvbox_material_sign_column_background = 'none'
    vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'

    -- Apply the colorscheme
    vim.cmd.colorscheme 'gruvbox-material'
    -- Link Python docstring highlight group to Comment
    vim.api.nvim_set_hl(0, '@string.documentation.python', { link = 'Comment' })
    -- Set custom highlight for HTML attributes
    vim.api.nvim_set_hl(0, '@tag.attribute', { fg = '#b16286' })
    vim.api.nvim_set_hl(0, '@tag.delimiter', { fg = '#b16286' })
  end,
}
