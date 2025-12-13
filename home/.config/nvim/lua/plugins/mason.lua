return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- Note: these are the LSP server names that have a corresponding
        -- server configuration in nvim-lspconfig and must also be installed
        -- by mason in order to be recognized.
        "gopls",
        "golangci_lint_ls",
        "templ",
        "html",
        "tailwindcss",
        "postgres_lsp",
        "docker_compose_language_service",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
}
