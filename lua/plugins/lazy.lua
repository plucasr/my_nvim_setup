
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
	-- No need for packer.nvim (lazy self-manages)

	-- Telescope (fuzzy finder)
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',  -- or branch = '0.1.x'
		dependencies = { 'nvim-lua/plenary.nvim' },
	},

	-- Rose Pine colorscheme (load immediately)
	{
		'rose-pine/neovim',
		name = 'rose-pine',  -- 'as=' becomes 'name='
		lazy = false,        -- Load at startup
		priority = 1000,     -- High priority for colorschemes
		config = function()
			vim.cmd.colorscheme('rose-pine')
		end,
	},

	-- Treesitter (syntax highlighting)
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',  -- 'run=' becomes 'build='
	},

	-- Treesitter playground
	{ 'nvim-treesitter/playground' },

	-- Harpoon (navigation)
	{ 'theprimeagen/harpoon' },

	-- Fugitive (Git)
	{ 'tpope/vim-fugitive' },

	-- Undotree
	{ 'mbbill/undotree' },

	-- Icons (loaded immediately - fixes some UI issues)
	{
		'nvim-tree/nvim-web-devicons',
		lazy = false,  -- Load immediately (avoids flash of missing icons)
	},

	-- Gitsigns (Git status)
	{ 'lewis6991/gitsigns.nvim' },

	-- Barbar (buffer tabs)
	{ 'romgrk/barbar.nvim' },
	{ 'VonHeikemen/lsp-zero.nvim', requires = {
		{'neovim/nvim-lspconfig'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'saadparwaiz1/cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-nvim-lua'},
		{'L3MON4D3/LuaSnip'},
	}},
	{
		"williamboman/mason.nvim"
	},
	-- In your lazy.nvim setup (plugins.lua or equivalent)
	-- In your lazy.nvim setup (plugins.lua or equivalent)
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false, -- Important for directory opens
		config = function()
			require("nvim-tree").setup({
				-- your existing config
			})

			-- Auto-open when directory is detected
			vim.api.nvim_create_autocmd({ "VimEnter" }, {
				callback = function(data)
					-- Only open if argument is a directory
					local directory = vim.fn.isdirectory(data.file) == 1
					if not directory then return end

					-- Change to the directory
					vim.cmd.cd(data.file)

					-- Open nvim-tree
					require("nvim-tree.api").tree.open({
						current_window = false, -- Open in sidebar, not full window
						focus = true,
						find_file = true
					})
				end
			})
		end
	},
	{"numToStr/FTerm.nvim"}

})

