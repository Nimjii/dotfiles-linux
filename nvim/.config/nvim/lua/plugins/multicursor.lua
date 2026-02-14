-- multicursor.lua

return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  config = function()
    require('multicursor-nvim').setup();

    vim.keymap.set({'n', 'x'}, 'mk', function() require('multicursor-nvim').lineAddCursor(-1) end, { desc = 'Add new cursor above' })
    vim.keymap.set({'n', 'x'}, 'mj', function() require('multicursor-nvim').lineAddCursor(1) end, { desc = 'Add new cursor below' })
    vim.keymap.set({'n', 'x'}, 'mK', function() require('multicursor-nvim').lineSkipCursor(-1) end, { desc = 'Skip cursor on line above' })
    vim.keymap.set({'n', 'x'}, 'mJ', function() require('multicursor-nvim').lineSkipCursor(1) end, { desc = 'Skip cursor on line below' })

    vim.keymap.set({'n', 'x'}, 'mn', function() require('multicursor-nvim').matchAddCursor(1) end, { desc = 'Add new cursor on next match' })
    vim.keymap.set({'n', 'x'}, 'ms', function() require('multicursor-nvim').matchSkipCursor(1) end, { desc = 'Skip new cursor on next match' })
    vim.keymap.set({'n', 'x'}, 'mN', function() require('multicursor-nvim').matchAddCursor(-1) end, { desc = 'Add new cursor on previous match' })
    vim.keymap.set({'n', 'x'}, 'mS', function() require('multicursor-nvim').matchSkipCursor(-1) end, { desc = 'Skip new cursor on previous match' })

    vim.keymap.set({'n', 'x'}, 'mt', require('multicursor-nvim').toggleCursor, { desc = 'Toggle cursors' })

    require('multicursor-nvim').addKeymapLayer(function(layerSet)
        layerSet({'n', 'x'}, 'N', require('multicursor-nvim').prevCursor, { desc = 'Go to previous cursor' })
        layerSet({'n', 'x'}, 'n', require('multicursor-nvim').nextCursor, { desc = 'Go to next cursor' })

        layerSet({'n', 'x'}, 'mx', require('multicursor-nvim').deleteCursor, { desc = 'Delete cursor' })

        layerSet('n', '<Tab>', function()
            if not require('multicursor-nvim').cursorsEnabled() then
                require('multicursor-nvim').enableCursors()
            else
                require('multicursor-nvim').clearCursors()
            end
        end)
    end)

    vim.api.nvim_set_hl(0, 'MultiCursorCursor', { reverse = true })
    vim.api.nvim_set_hl(0, 'MultiCursorVisual', { link = 'Visual' })
    vim.api.nvim_set_hl(0, 'MultiCursorSign', { link = 'SignColumn'})
    vim.api.nvim_set_hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
    vim.api.nvim_set_hl(0, 'MultiCursorDisabledCursor', { reverse = true })
    vim.api.nvim_set_hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
    vim.api.nvim_set_hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn'})
  end,
}
