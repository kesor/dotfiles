local M = {}

local ON_TYPE_FORMATTING = "textDocument/onTypeFormatting"

local function is_support_on_type_fmt(client)
  return client.server_capabilities.documentOnTypeFormattingProvider ~= nil
end

local function get_buf_version(bufnr)
  return vim.api.nvim_buf_get_var(bufnr, "changedtick")
end

local function get_otf_client(bufnr)
  for _, client in pairs(vim.lsp.get_clients()) do
    if is_support_on_type_fmt(client) and vim.lsp.buf_is_attached(bufnr, client.id) then
      return client
    end
  end
end

local function get_trigger_chars(provider)
  local trigger_chars = { provider.firstTriggerCharacter }
  if provider.moreTriggerCharacter then
    vim.list_extend(trigger_chars, provider.moreTriggerCharacter)
  end
  return trigger_chars
end

local function handle_formatting_request(winnr, client, key)
  local bufnr = vim.api.nvim_win_get_buf(winnr)

  local provider = client.server_capabilities.documentOnTypeFormattingProvider
  if not (provider.firstTriggerCharacter == key or (provider.moreTriggerCharacter and vim.tbl_contains(provider.moreTriggerCharacter, key))) then
    return
  end

  local params = vim.lsp.util.make_position_params(winnr, client.offset_encoding)
  params.textDocument.version = get_buf_version(bufnr)
  params.ch = key
  params.options = {
    tabSize = vim.lsp.util.get_effective_tabstop(bufnr),
    insertSpaces = vim.bo[bufnr].expandtab,
  }

  client.request(ON_TYPE_FORMATTING, params, function(err, result, ctx, config)
    local handler = client.handlers[ON_TYPE_FORMATTING] or vim.lsp.handlers[ON_TYPE_FORMATTING] or vim.lsp.handlers["textDocument/formatting"]
    if handler then
      handler(err, result, ctx, config)
    else
      vim.notify("No handler found for onTypeFormatting", vim.log.levels.ERROR)
    end
  end, bufnr)
end

local function on_key_press(char)
  local winnr = vim.api.nvim_get_current_win()
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local client = get_otf_client(bufnr)

  if client then
    vim.api.nvim_feedkeys(char, 'n', false)
    vim.schedule(function()
      handle_formatting_request(winnr, client, char)
    end)
  else
    vim.api.nvim_feedkeys(char, 'i', false)  -- ensure the key press still works if no client is attached
  end
end

function M.attach_buf(bufnr, client)
  local provider = client.server_capabilities.documentOnTypeFormattingProvider
  local trigger_chars = get_trigger_chars(provider)

  for _, char in ipairs(trigger_chars) do
    vim.keymap.set('i', char, function() on_key_press(char) end, { buffer = bufnr, noremap = true, silent = true })
  end
end

function M.reset_buf(bufnr)
  vim.api.nvim_buf_clear_namespace(bufnr, -1, 0, -1)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = get_otf_client(args.buf)
    if client then
      M.attach_buf(args.buf, client)
    end
  end,
})

vim.api.nvim_create_autocmd("LspDetach", {
  callback = function(args)
    local client = get_otf_client(args.buf)
    if not client then
      M.reset_buf(args.buf)
    end
  end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(args)
    M.reset_buf(args.buf)
  end,
})

return M
