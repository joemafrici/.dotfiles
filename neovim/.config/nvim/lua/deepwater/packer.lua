-- Install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- autocommand reloads neovim whenever packer.lua is saved
vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost packer.lua source <afile> | PackerSync
	augroup end
]])

-- use protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("packer had an error")
	return
end

-- use popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'        -- packer manage packer	
	-- Colorschemes
	use({
		"rebelot/kanagawa.nvim",
		as = "kanagawa",
		config = function()
			vim.cmd("colorscheme kanagawa-wave")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		end

	})

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- need some prerequisite for this to work
	-- check repo
	use "nvim-telescope/telescope-media-files.nvim"
	use "nvim-lua/popup.nvim"

	-- cmp plugins
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "saadparwaiz1/cmp_luasnip" 		-- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- snippets
	use "L3MON4D3/Luasnip" -- snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	use "neovim/nvim-lspconfig" -- enable LSP
	use {
		"williamboman/mason.nvim", -- simple to use language server installer
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}
	use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
	-- no longer being maintained
	use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

	-- Treesitter
	use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
	use('nvim-treesitter/playground')
	use "p00f/nvim-ts-rainbow"		-- no longer being maintained
	--use('mbbill/undotree')	-- need to setup if you want to use
	use('tpope/vim-fugitive')

    -- nvim tree
    use "nvim-tree/nvim-tree.lua"
    use "nvim-tree/nvim-web-devicons"

	-- Autopairs
	use "windwp/nvim-autopairs"

    -- Bufferline
    use "moll/vim-bbye"
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    use "akinsho/toggleterm.nvim"
    use "folke/which-key.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
