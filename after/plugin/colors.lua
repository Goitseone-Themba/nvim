function ColorMyPencils(color)
    color = color or theme[2].opts.colorscheme or "gruvbox"
    vim.cmd.colorscheme(color)

    local function make_transparent(name)
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
        if ok then
            hl.bg = nil
            vim.api.nvim_set_hl(0, name, hl)
        end
    end

    local groups = {
        "Normal",
        "NormalFloat",
        "FloatBorder",
        "Pmenu",
        "PmenuSel",
        "PmenuSbar",
        "PmenuThumb",
        "Terminal",
        "EndOfBuffer",
        "Folded",
        "FoldColumn",
        "SignColumn",
        "LineNr",
        "LineNrAbove",
        "LineNrBelow",
        "CursorLineNr",
        "CursorLine",
        "NormalNC",
        "NormalCNL",
        "WhichKeyFloat",
        "TelescopeBorder",
        "TelescopeNormal",
        "TelescopePromptBorder",
        "TelescopePromptTitle",
        "TelescopeResultsBorder",
        "TelescopeResultsTitle",
        "NotifyINFOBody",
        "NotifyERRORBody",
        "NotifyWARNBody",
        "NotifyTRACEBody",
        "NotifyDEBUGBody",
        "NotifyINFOTitle",
        "NotifyERRORTitle",
        "NotifyWARNTitle",
        "NotifyTRACETitle",
        "NotifyDEBUGTitle",
        "NotifyINFOBorder",
        "NotifyERRORBorder",
        "NotifyWARNBorder",
        "NotifyTRACEBorder",
        "NotifyDEBUGBorder",
        "NvimTreeNormal",
        "NvimTreeVertSplit",
        "NvimTreeEndOfBuffer",
        "NvimTreeNormalNC",
        "NvimTreeWinSeparator",
        "OilNormal",
        "OilNormalNC",
        "OilDir",
        "OilFile",
        "DiffAdd",
        "DiffChange",
        "DiffDelete",
        "DiffviewNormal",
        "DiffviewNormalNC",
    }

    for _, name in ipairs(groups) do
        make_transparent(name)
    end
end

ColorMyPencils()
