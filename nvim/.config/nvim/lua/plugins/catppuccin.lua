-- catppuccin.lua

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function ()
    require('catppuccin').setup({
      flavour = 'mocha',
      dim_inactive = {
        enabled = true,
      },
      integrations = {
        aerial = true,
        alpha = false,
        blink_cmp = true,
        dashboard = false,
        fzf = false,
        illuminate = false,
        indent_blankline = {
          enabled = false,
          colored_indent_levels = true,
        },
        neogit = false,
        neotree = false,
        noice = true,
        nvim_surround = true,
        nvimtree = false,
        semantic_tokens = false,
        snacks = true,
        rainbow_delimiters = false,
        telescope = false,
        treesitter_context = false,
        ufo = false,
        which_key = true,
      },
      styles = {
        conditionals = {},
      },
      color_overrides = {
        -- gruvbox-adjacent colors (kudos to chatgpt on that one)
        mocha = {
          rosewater = "#fbbf24",
          flamingo = "#f6752a",
          pink = "#cc6699",
          mauve = "#c75fab",
          red = "#fb4934",
          maroon = "#e75c58",
          peach = "#f98a1f",
          yellow = "#fcd34d",
          green = "#a3be38",
          teal = "#7ebc8c",
          sky = "#69b9d6",
          sapphire = "#5ca9d8",
          blue = "#689d6a",
          lavender = "#e6d9b5",
          text = "#ebdbb2",
          subtext1 = "#d5c4a1",
          subtext0 = "#bdae93",
          overlay2 = "#a89984",
          overlay1 = "#928374",
          overlay0 = "#7c6f64",
          surface2 = "#665c54",
          surface1 = "#504945",
          surface0 = "#3c3836",
          base = "#282828",
          mantle = "#1e1e1e",
          crust = "#161616",
        },
      },
    })

    vim.cmd.colorscheme 'catppuccin'
  end,
}
