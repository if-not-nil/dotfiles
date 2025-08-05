local p = require("base16")

local theme = {
    normal = {
        a = { bg = p.base00, fg = p.base05, gui = "bold" },
        b = { bg = p.base01, fg = p.base05 },
        c = { bg = p.base00, fg = p.base05 },
        z = { bg = p.base00, fg = p.base05 },
    },
    insert = {
        a = { bg = p.base00, fg = p.base0B, gui = "bold" },
        b = { bg = p.base01, fg = p.base05 },
        c = { bg = p.base00, fg = p.base05 },
        z = { bg = p.base00, fg = p.base05 },
    },
    visual = {
        a = { bg = p.base00, fg = p.base0E, gui = "bold" },
        b = { bg = p.base01, fg = p.base05 },
        c = { bg = p.base00, fg = p.base05 },
        z = { bg = p.base00, fg = p.base05 },
    },
    replace = {
        a = { bg = p.base00, fg = p.base08, gui = "bold" },
        b = { bg = p.base01, fg = p.base05 },
        c = { bg = p.base00, fg = p.base05 },
        z = { bg = p.base00, fg = p.base05 },
    },
    command = {
        a = { bg = p.base00, fg = p.base0D, gui = "bold" },
        b = { bg = p.base01, fg = p.base05 },
        c = { bg = p.base00, fg = p.base05 },
        z = { bg = p.base00, fg = p.base05 },
    },
    inactive = {
        a = { bg = p.base01, fg = p.base04, gui = "bold" },
        b = { bg = p.base01, fg = p.base05 },
        c = { bg = p.base00, fg = p.base05 },
        z = { bg = p.base00, fg = p.base05 },
    },
}

return {
    options = { theme = theme, section_separators = '', component_separators = '' },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diagnostics' },
        lualine_c = {
            '%=',
            {
                'buffers',
                padding = { left = 0 },
                symbols = {
                    modified = ' *',
                    alternate_file = '',
                    directory = ' D',
                },
                buffers_color = {
                    active = { fg = p.base0D, bg = p.base00, gui = 'bold' },
                    inactive = { fg = p.base03, bg = p.base00 },
                },
                separator = '',
            },
            '=%',
        },
        lualine_x = {},
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}
