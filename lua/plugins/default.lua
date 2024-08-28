return {
  -- The colorscheme should be available when starting Neovim
  {
    "dracula/vim",
    as = "dracula",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme dracula]])
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 990,
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end
  },
  
  -- LSP and Tree-sitter
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").gleam.setup({})
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "gleam", "toml" }, -- Install gleam and toml
	      highlight = { enable = true },
      }
    end,
  },

  -- Tree file view
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeFocus",
    },
    keys = {
      { "<c-p>", "<cmd>NvimTreeFocus<cr>" },
    },
    config = function()
      require("nvim-tree").setup({
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
      })
    end
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    mode = "buffers",
    config = function()
      require("bufferline").setup {
        options = {
          diagnostics = "nvim_lsp",
          separator_style = "thin",
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
            },
          },
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_buffer_icons = true,
          show_close_icon = true,
        },
      }
    end,
    keys = {
      { "<c-left>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
      { "<c-right>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    }
  },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          theme = "dracula",
          icons_enabled = true,
        }
      }
    end
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end
  },

  -- Codeium (AI assistance)
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },

  -- Which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}
