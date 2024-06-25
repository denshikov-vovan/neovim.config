return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, prefix = "●" },
        severity_sort = true,
      },
      autoformat = true,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = {},
      setup = {},
    },
    config = function(plugin, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local map = vim.keymap.set
          local lspBuf = vim.lsp.buf

          map("n", "gD", lspBuf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
          map("n", "gd", lspBuf.definition, { buffer = ev.buf, desc = "Go to definition" })
          map("n", "gi", lspBuf.implementation, { buffer = ev.buf, desc = "Go to implementation" })
          map("n", "gr", lspBuf.references, { buffer = ev.buf, desc = "Go to reference" })

          map("n", "K", lspBuf.hover, { buffer = ev.buf, desc = "Hover info" })
          map("n", "<C-k>", lspBuf.signature_help, { buffer = ev.buf, desc = "Signature help" })
          map("n", "<space>D", lspBuf.type_definition, { buffer = ev.buf, desc = "Type definition" })
          map("n", "<leader>rn", lspBuf.rename, { buffer = ev.buf, desc = "Rename" })
          map({ "n", "v" }, "<space>ca", lspBuf.code_action, { buffer = ev.buf, desc = "Code action" })

          map("n", "<space>lf", function()
            lspBuf.format({ async = true })
          end, { buffer = ev.buf, desc = "Format code" })

          map("n", "<space>ld", function()
            vim.diagnostic.open_float({ focusable = false })
          end, { buffer = ev.buf, desc = "Diagnostic info" })
        end,
      })

      -- diagnostics
      local icons = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      }

      for name, icon in pairs(icons) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      vim.diagnostic.config(opts.diagnostics)

      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- temp fix for lspconfig rename
      -- https://github.com/neovim/nvim-lspconfig/pull/2439
      local mappings = require("mason-lspconfig.mappings.server")

      if not mappings.lspconfig_to_package.lua_ls then
        mappings.lspconfig_to_package.lua_ls = "lua-language-server"
        mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
      end

      local mlsp = require("mason-lspconfig")
      local available = mlsp.get_available_servers()

      local ensure_installed = {}

      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup_handlers({ setup })
    end,
  },
  {
    "linrongbin16/lsp-progress.nvim",
    event = { "VimEnter" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lsp-progress").setup()
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      ensure_installed = {
        "eslint-lsp",
        "json-lsp",
        "typescript-language-server",
        "vue-language-server",
        "tailwindcss-language-server",
        "bash-language-server",
        "lua-language-server",
        "python-lsp-server",
        "svelte-language-server",
        "yaml-language-server",
        "editorconfig-checker",
        "stylua",
        "rust-analyzer",
        "flake8",
        "cspell",
        "jsonlint"
      },
    },
    config = function(plugin, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({})
    end,
  }
}
