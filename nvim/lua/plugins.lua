local packer = require 'lib.packer-init'

packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use {
      "neovim/nvim-lspconfig",
      config = function()
          require "plugins.nvim-lspconfig"
      end
  }
  use "Mofiqul/vscode.nvim"
  use "ntpeters/vim-better-whitespace"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"
  use {
      "hrsh7th/nvim-cmp",
      config = function()
          require "plugins.nvim-cmp"
      end
  }
  use "L3MON4D3/LuaSnip"
  use "preservim/nerdtree"
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"}, { "BurntSushi/ripgrep" } }
  }
  use {
      "mfussenegger/nvim-dap",
      config = function()
          require "plugins.nvim-dap"
      end
  }
  use {
      "ray-x/lsp_signature.nvim",
      config = function()
          require "plugins.lsp_signature"
      end
  }
  use {
      "nvim-treesitter/nvim-treesitter",
      config = function()
          require "plugins.nvim-treesitter"
      end
  }
  use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require "plugins.lualine"
      end
  }
  -- use {
  --     "rcarriga/nvim-dap-ui",
  --     config = function()
  --         require "plugins.nvim-dap-ui"
  --     end
  -- }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  }
  use {
      "ggandor/leap.nvim",
      config = function()
          require("leap").set_default_keymaps()
      end
  }
  use {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup()
    end
  }
  use "tpope/vim-surround"
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup()
    end
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }
  use "tpope/vim-fugitive"
  end
)

