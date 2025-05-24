return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
   },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "fatih/vim-go",
    ft = "go",
  },
  {
  	"nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "dockerfile", "go", "goctl",
        "gomod", "gosum", "gowork",
        "html", "css", "bash",
        "ini", "javascript", "typescript",
        "json", "lua", "luadoc",
        "markdown", "python", "sql",
        "toml", "typescript", "vim",
        "vimdoc", "xml", "yaml",
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },
  -- {
  --   "pasky/claude.vim",
  --   lazy = false,
  --   config = function()
  --     -- Load API key from environment variable
  --     local api_key = os.getenv("ANTHROPIC_API_KEY")
  --     if api_key then
  --       vim.g.claude_api_key = api_key
  --     else
  --       vim.notify("ANTHROPIC_API_KEY environment variable is not set", vim.log.levels.WARN)
  --     end
  --     -- Add keymaps (the default conflict with NVChad.  Skip if you want)
  --   vim.keymap.set("v", "<leader>Ci", ":'<,'>ClaudeImplement ", { noremap = true, desc = "Claude Implement" })
  --   vim.keymap.set("n", "<leader>Cc", ":ClaudeChat<CR>", { noremap = true, silent = true, desc = "Claude Chat" })
  --   end
  -- },
}
