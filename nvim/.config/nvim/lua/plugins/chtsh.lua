local baseUrl = "https://cht.sh/"
local cheat_term = nil

local languages = {
  "go",
  "bash",
  "c",
  "cpp",
  "java",
  "javascript",
  "kotlin",
  "lua",
  "python",
}

local function toggle()
  if cheat_term then
    cheat_term:toggle()
  end
end

local function open_in_buffer(query, language)
  local lines = vim.fn.systemlist("curl -s '" .. baseUrl .. query .. "?T'")

  vim.cmd("enew")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.api.nvim_buf_set_name(0, query .. "." .. language)

  vim.bo.buftype = "nofile"
  vim.bo.swapfile = false
  vim.bo.modifiable = false
  vim.bo.filetype = language

  vim.keymap.set("n", "q", "<cmd>bd<cr>", { buffer = true })
end

local function open_in_terminal(query)
  local Terminal = require("toggleterm.terminal").Terminal
  local direction = "float"

  cheat_term = Terminal:new({
    cmd = "curl -s " .. baseUrl .. query .. " | less",
    close_on_exit = true,
    direction = direction,
    on_exit = function()
      cheat_term = nil
    end,
  })

  vim.keymap.set("t", "q", toggle, { buffer = true })
  toggle()
end

local function open(query, language)
  local mode = "terminal"

  if mode == "buffer" then
    open_in_buffer(query, language)
  else
    open_in_terminal(query)
  end
end

local function pick_language(callback)
  vim.ui.select(languages, { prompt = "language?" }, function(language)
    if not language then
      print("no language selected")
    else
      callback(language)
    end
  end)
end

local function search()
  pick_language(function(language)
    local topic = vim.trim(vim.fn.input("topic?"))

    if topic == "" then
      print("no topic provided")
    else
      -- replace spaces with +
      topic = topic:gsub(" ", "+")
      open(language .. "/" .. topic, language)
    end
  end)
end

local function pick_topic()
  pick_language(function(language)
    local topics = vim.fn.systemlist("curl -s " .. baseUrl .. language .. "/:list")

    if not topics or #topics == 0 then
      print("could not fetch topics")
      return
    end

    vim.ui.select(topics, { prompt = "topic?" }, function(topic)
      if topic then
        open(language .. "/" .. topic, language)
      end
    end)
  end)
end

local function learn()
  pick_language(function(language)
    open(language .. "/:learn", language)
  end)
end

vim.keymap.set("n", "<leader>h", "", { desc = "cheat.sh" })
vim.keymap.set("n", "<leader>hs", search, { desc = "search" })
vim.keymap.set("n", "<leader>hc", pick_topic, { desc = "topic" })
vim.keymap.set("n", "<leader>hl", learn, { desc = "learn language" })
vim.keymap.set({ "n", "t" }, "<C-;>", toggle, { desc = "hide/show cheat.sh" })

return {}
