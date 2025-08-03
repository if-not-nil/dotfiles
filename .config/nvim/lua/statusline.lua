local base16 = {
    base00 = "#101010",
    base01 = "#202020",
    base02 = "#2b2b2b",
    base03 = "#505050",
    base04 = "#b0b0b0",
    base05 = "#d0d0d0",
    base06 = "#e0e0e0",
    base07 = "#fafafa",
    base08 = "#ab4642",
    base09 = "#dc9656",
    base0A = "#f7ca88",
    base0B = "#a1b56c",
    base0C = "#86c1b9",
    base0D = "#7cafc2",
    base0E = "#ba8baf",
    base0F = "#a16946",
}

local theme = {
    normal = {
        a = { bg = base16.base00, fg = base16.base05, gui = "bold" },
        b = { bg = base16.base01, fg = base16.base05 },
        c = { bg = base16.base00, fg = base16.base05 },
        z = { bg = base16.base00, fg = base16.base05 },
    },
    insert = {
        a = { bg = base16.base00, fg = base16.base0B, gui = "bold" },
        b = { bg = base16.base01, fg = base16.base05 },
        c = { bg = base16.base00, fg = base16.base05 },
        z = { bg = base16.base00, fg = base16.base05 },
    },
    visual = {
        a = { bg = base16.base00, fg = base16.base0E, gui = "bold" },
        b = { bg = base16.base01, fg = base16.base05 },
        c = { bg = base16.base00, fg = base16.base05 },
        z = { bg = base16.base00, fg = base16.base05 },
    },
    replace = {
        a = { bg = base16.base00, fg = base16.base08, gui = "bold" },
        b = { bg = base16.base01, fg = base16.base05 },
        c = { bg = base16.base00, fg = base16.base05 },
        z = { bg = base16.base00, fg = base16.base05 },
    },
    command = {
        a = { bg = base16.base00, fg = base16.base0D, gui = "bold" },
        b = { bg = base16.base01, fg = base16.base05 },
        c = { bg = base16.base00, fg = base16.base05 },
        z = { bg = base16.base00, fg = base16.base05 },
    },
    inactive = {
        a = { bg = base16.base01, fg = base16.base04, gui = "bold" },
        b = { bg = base16.base01, fg = base16.base05 },
        c = { bg = base16.base00, fg = base16.base05 },
        z = { bg = base16.base00, fg = base16.base05 },
    },
}

require('lualine').setup {
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
                    active = { fg = base16.base0D, bg = base16.base00, gui = 'bold' },
                    inactive = { fg = base16.base03, bg = base16.base00 },
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
