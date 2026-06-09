return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = function()
      -- Disable in VSCode and Cursor
      if vim.g.vscode or vim.g.cursor then
        return { enabled = false }
      end
      return {}
    end,
  },
}
