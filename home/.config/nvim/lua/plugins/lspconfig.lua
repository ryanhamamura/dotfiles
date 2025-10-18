return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        solargraph = {},
        templ = {
          filetypes = { "templ" },
          settings = {
            templ = {
              enable_snippets = true,
            },
          },
        },
      },
    },
  },
}
