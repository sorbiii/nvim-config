-- Treesiter config
require("nvim-treesitter.configs").setup({
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', "vimdoc", "vim" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true, disable = { "python" } },
    disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
})

