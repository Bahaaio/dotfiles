local baseUrl = "https://cht.sh/"
local cached_topics = {}
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

local utils = {
  "awk",
  "sed",
  "grep",
  "xargs",
  "find",
  "mv",
  "git",
  "docker",
  "docker-compose",
  "chmod",
  "chown",
  "make",
  "cargo",
  "kill",
}

local function toggle()
  if cheat_term then
    cheat_term:toggle()
  end
end

local function open(query)
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

  toggle()
end

local function pick(prompt, things, callback)
  vim.ui.select(things, { prompt = prompt }, function(thing)
    if not thing then
      print("nothing selected")
    else
      callback(thing)
    end
  end)
end

local function pick_language(callback)
  local language = vim.bo.filetype

  if not language or language == "" or not vim.tbl_contains(languages, language) then
    pick("language?", languages, callback)
  else
    callback(language)
  end
end

local function pick_util(callback)
  pick("util?", utils, callback)
end

local function prompt_topic(query)
  local topic = vim.trim(vim.fn.input("topic?"))

  if topic == "" then
    print("no topic provided")
  else
    -- replace spaces with +
    topic = topic:gsub(" ", "+")
    open(query .. topic)
  end
end

local function get_topics(language)
  local topics = cached_topics[language]

  if not topics then
    topics = vim.fn.systemlist("curl -s " .. baseUrl .. language .. "/:list")

    if not topics or #topics == 0 then
      return nil
    else
      cached_topics[language] = topics
    end
  end

  return cached_topics[language]
end

local function search_language_topics()
  pick_language(function(language)
    local topics = get_topics(language)

    if not topics then
      print("could not fetch topics")
      return
    end

    vim.ui.select(topics, { prompt = "topic?" }, function(topic)
      if topic then
        open(language .. "/" .. topic)
      end
    end)
  end)
end

local function search_language()
  pick_language(function(language)
    prompt_topic(language .. "/")
  end)
end

local function search_util()
  pick_util(function(util)
    prompt_topic(util .. "~")
  end)
end

vim.keymap.set("n", "<leader>hs", search_language, { desc = "search" })
vim.keymap.set("n", "<leader>hc", search_language_topics, { desc = "topic" })
vim.keymap.set("n", "<leader>hu", search_util, { desc = "core util" })
vim.keymap.set({ "n", "t" }, "<M-;>", toggle, { desc = "hide/show cheat.sh" })

return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>h", group = "cht.sh", icon = { icon = "󱀁", color = "blue" } },
      },
    },
  },
}
