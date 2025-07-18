require("settings").setup()
require("keymaps").setup()
require("autocommands").setup()

local enable_which_key = false

Enable_autocomplete = true
-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	"xiyaowong/transparent.nvim",
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	--{
	--	"nyoom-engineering/oxocarbon.nvim",
	--	lazy = false,
	--	priority = 1000,
	--	config = function()
	--		vim.cmd.colorscheme("oxocarbon")
	--	end,
	--},
	--{
	--	"AlexvZyl/nordic.nvim",
	--	lazy = false,
	--	priority = 1000,
	--	config = function()
	--		require("nordic").load()
	--	end,
	--},
	--{
	--	"Tsuzat/NeoSolarized.nvim",
	--	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--	priority = 1000, -- make sure to load this before all the other start plugins
	--	config = function()
	--		vim.cmd([[ colorscheme NeoSolarized ]])
	--	end,
	--},
	---- Lazy
	--{
	--	"vague2k/vague.nvim",
	--	lazy = false,
	--	priority = 1000,
	--	config = function()
	--		require("vague").setup({
	--			-- optional configuration here
	--		})
	--		vim.cmd.colorscheme("vague")
	--	end,
	--},
	--{
	--	"rebelot/kanagawa.nvim",
	--	lazy = false,
	--	priority = 1000,
	--	config = function()
	--		vim.cmd.colorscheme("kanagawa-dragon")
	--	end,
	--},
	--{
	--	"EdenEast/nightfox.nvim",
	--	lazy = false,
	--	priority = 1000,
	--	config = function()
	--		vim.cmd.colorscheme("nordfox")
	--	end,
	--}, -- lazy
	--
	--{
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			require("ayu").setup({
				mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
				terminal = true, -- Set to `false` to let terminal manage its own colors.
				overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
			})
			vim.cmd.colorscheme("ayu")
		end,
	},
	--	{
	--		"tjdevries/colorbuddy.nvim",
	--		lazy = false,
	--		config = function()
	--			require("colors.monochrome")
	--		end,
	--	},
	"tpope/vim-rails",
	-- "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to force a plugin to be loaded.
	--
	--  This is equivalent to:
	--    require('Comment').setup({})

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
	--    require('gitsigns').setup({ ... })
	--
	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
	--
	-- This is often very useful to both group configuration, as well as handle
	-- lazy loading plugins that don't need to be loaded immediately at startup.
	--
	-- For example, in the following configuration, we use:
	--  event = 'VimEnter'
	--
	-- which loads which-key before all the UI elements are loaded. Events can be
	-- normal autocommands events (`:help autocmd-events`).
	--
	-- Then, because we use the `config` key, the configuration only runs
	-- after the plugin has been loaded:
	--  config = function() ... end

	{ -- Useful plugin to show you pending keybinds.
		(function()
			if enable_which_key then
				return {
					"folke/which-key.nvim",
					event = "VimEnter", -- Sets the loading event to 'VimEnter'
					config = function() -- This is the function that runs, AFTER loading
						require("which-key").setup()
					end,
				}
			end
		end)(),
	},

	-- NOTE: Plugins can specify dependencies.
	--
	-- The dependencies are proper plugin specifications as well - anything
	-- you do for a plugin at the top level, you can do for a dependency.
	--
	-- Use the `dependencies` key to specify the dependencies of a particular plugin

	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use Telescope, is to start by doing something like:
			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`
				--
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				-- pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search Git Files" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},

	{ -- Autoformat
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				-- javascript = { { "prettierd", "prettier" } },
			},
		},
	},

	{ -- Autocompletion
		(function()
			if Enable_autocomplete then
				return {
					"hrsh7th/nvim-cmp",
					--event = "InsertEnter",
					dependencies = {
						-- Snippet Engine & its associated nvim-cmp source
						{
							"L3MON4D3/LuaSnip",
							build = (function()
								-- Build Step is needed for regex support in snippets.
								-- This step is not supported in many windows environments.
								-- Remove the below condition to re-enable on windows.
								if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
									return
								end
								return "make install_jsregexp"
							end)(),
							dependencies = {
								-- `friendly-snippets` contains a variety of premade snippets.
								--    See the README about individual language/framework/plugin snippets:
								--    https://github.com/rafamadriz/friendly-snippets
								-- {
								--   'rafamadriz/friendly-snippets',
								--   config = function()
								--     require('luasnip.loaders.from_vscode').lazy_load()
								--   end,
								-- },
							},
						},
						"saadparwaiz1/cmp_luasnip",

						-- Adds other completion capabilities.
						--  nvim-cmp does not ship with all sources by default. They are split
						--  into multiple repos for maintenance purposes.
						"hrsh7th/cmp-nvim-lsp",
						"hrsh7th/cmp-path",
					},
					config = function()
						require("plugins.autocomplete")
					end,
				}
			end
		end)(),
	},

	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			require("plugins.lsp")
		end,
	},
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	--{ -- Collection of various small independent plugins/modules
	--	"echasnovski/mini.nvim",
	--	config = function()
	--		-- Better Around/Inside textobjects
	--		--
	--		-- Examples:
	--		--  - va)  - [V]isually select [A]round [)]paren
	--		--  - yinq - [Y]ank [I]nside [N]ext [']quote
	--		--  - ci'  - [C]hange [I]nside [']quote
	--		require("mini.ai").setup({ n_lines = 500 })

	--		-- Add/delete/replace surroundings (brackets, quotes, etc.)
	--		--
	--		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
	--		-- - sd'   - [S]urround [D]elete [']quotes
	--		-- - sr)'  - [S]urround [R]eplace [)] [']
	--		require("mini.surround").setup()

	--		-- Simple and easy statusline.
	--		--  You could remove this setup call if you don't like it,
	--		--  and try some other statusline plugin
	--		local statusline = require("mini.statusline")
	--		-- set use_icons to true if you have a Nerd Font
	--		statusline.setup({ use_icons = vim.g.have_nerd_font })

	--		-- You can configure sections in the statusline by overriding their
	--		-- default behavior. For example, here we set the section for
	--		-- cursor location to LINE:COLUMN
	--		---@diagnostic disable-next-line: duplicate-set-field
	--		statusline.section_location = function()
	--			return "%2l:%-2v"
	--		end

	--		-- ... and there is more!
	--		--  Check out: https://github.com/echasnovski/mini.nvim
	--	end,
	--},
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"vim",
				"vimdoc",
				"rust",
				"go",
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			-- Prefer git instead of curl in order to improve connectivity in some environments
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)

			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	--    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
	-- { import = 'custom.plugins' },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
