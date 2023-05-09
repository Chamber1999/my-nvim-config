--设置leader                                          
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local pluginKeys = {}
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }
-- 将 ctrl+s 设置为保存
map('n', '<C-s>', ':w<CR>', { noremap = true })
map('i', '<C-s>', '<Esc>:w<CR>', { noremap = true })

-- 将 ctrl+q 设置为退出
map('i', '<leader>q', '<esc>', { noremap = true })
map('n', '<leader>q', '<esc>', { noremap = true })
map('v', '<leader>q', '<esc>', { noremap = true })
map('n', '<leader>v', '<C-v>', { noremap = true })
-- coc
-- 跳转到定义
map('n', 'gd', '<Plug>(coc-definition)', opt)
-- 跳转到类型定义
map('n', 'gy', '<Plug>(coc-type-definition)', opt)
-- 跳转到实现
map('n', 'gi', '<Plug>(coc-implementation)', opt)
-- 代码重构
map('n', 'gr', '<Plug>(coc-rename)', opt)
--代码格式化
map('n', 'gf', '<Plug>(coc-format)', opt)
-- 自动完成
map('i', '<CR>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"',{expr = true} )
-- 触发代码提示
map('i', '<C-Space>', 'coc#refresh()', { expr = true })
-- 显示文档
map('n', 'K', ':call CocAction("doHover")<CR>', opt)
-- nvimTree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)
map("n", "<leader>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>l", ":BufferLineCycleNext<CR>", opt)
-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G", opt)
map("n", "<leader>c", ":Bdelete!<CR>", opt)
map("n","<leader>w","<C-w>",opt)
-- Telescope
-- 查找文件
map("n", "<C-f>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-g>", ":Telescope live_grep<CR>", opt)
map("n", "<C-p>", ":Telescope projects<CR>", opt)
-- visual模式下缩进代码
map("v", "H", "<gv", opt)
map("v", "L", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
    -- 分屏打开文件
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
    -- 显示隐藏文件
    { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
    { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
    -- 文件操作
    { key = "<F5>", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "s", action = "system_open" },
}
pluginKeys.mapVimspector = function()
    -- 开始
    map("n", "<leader>dd", ":call vimspector#Launch()<CR>", opt)
    -- 结束
    map("n", "<Leader>de", ":call vimspector#Reset()<CR>", opt)
    -- 继续
    map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opt)
    -- 设置断点
    map("n", "<Leader>bp", ":call vimspector#ToggleBreakpoint()<CR>", opt)
    map("n", "<Leader>bb", ":call vimspector#ClearBreakpoints()<CR>", opt)
    --  stepOver, stepOut, stepInto
    map("n", "<leader>dj", "<Plug>VimspectorStepOver", opt)
    map("n", "<leader>dk", "<Plug>VimspectorStepOut", opt)
    map("n", "<leader>di", "<Plug>VimspectorStepInto", opt)
end
return pluginKeys
