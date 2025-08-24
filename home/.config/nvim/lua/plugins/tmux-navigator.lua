return {
  {
    "christoomey/vim-tmux-navigator",
    enabled = true,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigateProcessList",
    },

    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Window Left" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Window Down" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Window Up" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Window Right" },
      { "<c-\\>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Window Right" },
    },
  },
}
