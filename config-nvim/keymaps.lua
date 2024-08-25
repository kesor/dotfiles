local map = vim.keymap.set
local function desc(description)
  local opts = { noremap = true, silent = true }
  opts.desc = description
  return opts
end

-- TODO: add a key to dismiss notifications
-- require('notify').dismiss({ pending = true, silent = true })

map({"n","v","i"},"<ScrollWheelUp>","<C-Y>");
map({"n","v","i"},"<ScrollWheelDown>","<C-E>");


-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("n", "<Leader>vr", ":source $MYVIMRC<cr>", desc("Reload vim configuration"))
map("n", "<Leader>ve", ":e $MYVIMRC<cr>", desc("Edit vim configuration"))

map("n", "<Leader>s", ":w<cr>", desc("Save the file"))

map("", "Y", "y$", desc("Yank from cursor to $"))
map("v", "<Leader>y", '"+y', desc("Copy to system clipboard"))
map("n", "<Leader>Y", '"+yg', desc("Copy to system clipboard"))
map("n", "<Leader>y", '"+y', desc("Copy to system clipboard"))
-- map('n', '<Leader>yy', '"+yy', desc('Copy to system clipboard'))
map("n", "<Leader>p", '"+p', desc("Paste from system clipboard"))
map("n", "<Leader>P", '"+P', desc("Paste from system clipboard"))
map("v", "<Leader>p", '"+p', desc("Paste from system clipboard"))
map("v", "<Leader>P", '"+P', desc("Paste from system clipboard"))
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- indentation
map({ "n", "v" }, "<Tab>", ">>", desc("Indent increase"))
map({ "n", "v" }, "<S-Tab>", "<<", desc("Indent reduce"))

-- nvim terminal
map("t", "<Esc>", "<C-\\><C-N>", desc("Exit terminal mode"))

map("n", "<cr>", ":nohlsearch<cr>", { desc = "Highlight off", silent = true }) -- don't add noremap!
map("n", "<Esc>", ":nohlsearch<cr>", { desc = "Highlight off", silent = true }) -- don't add noremap!
map("n", "<LocalLeader>tw", ":set wrap!<cr>", desc("Toggle word wrap"))
map("n", "<LocalLeader>tl", ":set list!<cr>", desc("Toggle list mode"))
map("n", "<LocalLeader>tp", ":set paste!<cr>", desc("Toggle paste mode"))
map("n", "<LocalLeader>cd", ":cd%:p:h<cr>", desc("cwd to that of current file"))
map("n", "<LocalLeader>lcd", ":lcd%:p:h<cr>", desc("local cwd to that of current file"))

map("n", "q:", ":q", desc("dyslexia correct type-'s on exit"))
map("i", "jj", "<Esc>", desc('Forgetful insert mode scroll fix - how often do you type "jj" anyway?'))

map("n", "<LocalLeader>wm", ":w<cr>:!make<cr>", desc("Save and build"))

map("v", "<LocalLeader>f", ":fold<cr>", desc("Fold selected"))
map("n", "<LocalLeader>fo", "%foldopen!<cr>", desc("Open all folds"))
map("n", "<LocalLeader>fc", "%foldclose!<cr>", desc("Close all folds"))

-- " If I forgot to sudo vim a file, do that with :w!!
map("c", "w!!", "%!sudo tee > /dev/null %", desc("Write to file with sudo"))

map("c", "<C-a>", "<home>", desc("Jump to start of line (normal mode)"))
map("c", "<C-e>", "<end>", desc("Jump to end of line (normal mode)"))
map("i", "<C-a>", "<esc>I", desc("Jump to start of line (insert mode)"))
map("i", "<C-e>", "<esc>A", desc("Jump to end of line (insert mode)"))

--- commentary
-- in tmux <C-/> sends <C-_>
map({ "n", "v" }, "<C-_>", ":Commentary<cr>", desc("Comment out this line (normal)(tmux)"))
map("i", "<C-_>", "<esc>:Commentary<cr>i", desc("Comment out this line (insert)(tmux)"))
map({ "n", "v" }, "<C-/>", ":Commentary<cr>", desc("Comment out this line (normal)"))
map("i", "<C-/>", "<esc>:Commentary<cr>i", desc("Comment out this line (insert)"))

--- neogen
map("n", "<Leader>nf", ':lua require"neogen".generate()<cr>', desc("NeoGen generate annotations"))

map("n", "[b", "<cmd>bprevious<cr>", desc("Previous buffer"))
map("n", "]b", "<cmd>bnext<cr>", desc("Next buffer"))

-- Minimal rename NUI input prompt for LSP-renaming symbols
-- ** replaced with dressing.nvim plugin **
-- local lsp_rename_func = function()
--     local input = require 'nui.input' ({
--         size = { width = 25, height = 1 },
--         border = {
--             style = 'rounded',
--             text = { top = ' rename: ', top_align = 'left' }
--         },
--         -- relative = 'cursor',
--         position = { row = 2, col = 0 },
--         relative = { type = 'cursor' }
--     }, {
--         on_submit = function(value)
--             vim.lsp.buf.rename(value)
--         end
--     })
--     input:mount()
-- end

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- vim.lsp.inlay_hint.enable(0, true)

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local function opts(description)
      local options = desc(description)
      options.buffer = ev.buf
      return options
    end

    map("n", "<space>d", vim.diagnostic.open_float, opts("LSP Diagnostics at cursor"))
    -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    -- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    -- See `:help K` ; LSP client sets K to show LSP "hover"
    map("n", "K", vim.lsp.buf.hover, opts("LSP Buffer Hover"))
    map("n", "<C-k>", vim.lsp.buf.signature_help, opts("LSP Signature Help"))

    map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder to LSP"))
    map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder form LSP"))
    map("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts("List LSP workspace folders"))
    -- map('n', '<space>rn', lsp_rename_func, opts('Rename symbol'))
    map("n", "<space>rn", vim.lsp.buf.rename, opts("Rename symbol"))
    map("n", "<space>f", vim.lsp.buf.format, opts("Format document"))
    -- Create a command `:Format` local to the LSP buffer
    -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    --   vim.lsp.buf.format()
    -- end, { desc = 'Format current buffer with LSP' })

    map("n", "]d", diagnostic_goto(true), desc("Next Diagnostic"))
    map("n", "[d", diagnostic_goto(false), desc("Prev Diagnostic"))
    map("n", "]e", diagnostic_goto(true, "ERROR"), desc("Next Error"))
    map("n", "[e", diagnostic_goto(false, "ERROR"), desc("Prev Error"))
    map("n", "]w", diagnostic_goto(true, "WARN"), desc("Next Warning"))
    map("n", "[w", diagnostic_goto(false, "WARN"), desc("Prev Warning"))
  end,
})


vim.api.nvim_create_user_command('Redir', function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
  vim.cmd('new')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })
