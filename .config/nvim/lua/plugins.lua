local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", { command = "source <afile> | PackerCompile", group = packer_group, pattern = "init.lua" })

require("packer").startup(function(use)
  -- plugin manager
  use "wbthomason/packer.nvim"
  -- lsp
  use {
    "neovim/nvim-lspconfig",
    config = function()
        require "plugins.nvim-lspconfig"
    end
  }
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
        require "plugins.lsp_signature"
    end
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  }
  use "ziglang/zig.vim"
  -- linting
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" },
    config = function()
      require "plugins.null-ls"
    end
  }
  -- autocomplete
  use {
    "hrsh7th/nvim-cmp",
    config = function()
        require "plugins.nvim-cmp"
    end
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
  -- dap
  use {
    "mfussenegger/nvim-dap",
    config = function()
        require "plugins.nvim-dap"
    end
  }
  use {
    "mfussenegger/nvim-dap-python",
    config = function()
        require "plugins.nvim-dap-python"
    end
  }
  use {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
        require"nvim-dap-virtual-text".setup()
    end
  }
  use {
    "rcarriga/nvim-dap-ui",
    config = function()
        require "plugins.nvim-dap-ui"
    end
  }
  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require "plugins.nvim-treesitter"
    end,
    run = ":TSUpdate"
  }
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "nvim-treesitter/playground"
  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"}, { "BurntSushi/ripgrep" } }
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    config = function()
        require"telescope".load_extension"fzf"
    end
  }
  use {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
        require"telescope".load_extension"dap"
    end
  }
  -- utility
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"
  use "tpope/vim-sleuth"
  use "ludovicchabant/vim-gutentags"
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
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup()
    end
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.gitsigns"
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }
  use {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup()
      require "telescope".load_extension "zk"
    end
  }
  -- cosmetic
  use { "deforde/vscode.nvim", branch = "bugfix/issue-90" }
  end
)

