vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Theme
    use 'folke/tokyonight.nvim'
    use 'navarasu/onedark.nvim'
    use 'pineapplegiant/spaceduck'
    use 'dracula/vim'
    -- Tree-sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- LSP, auto completion and snippets
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    -- Telescope for fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Auto pairs
    use "windwp/nvim-autopairs"

    -- Close html/jsx tags
    use "windwp/nvim-ts-autotag"

    -- Prettier
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "MunifTanjim/prettier.nvim"

    -- MDX support
    use "findango/vim-mdx"
end)
