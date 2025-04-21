
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
	-- Core LSP Management (Following Documentation Style)
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "typescript-language-server", "eslint", "python-lsp-server", "ruby_ls", "omnisharp" }, -- Add your desired servers
				automatic_installation = true, -- Automatically install missing servers
			})
		end,
		dependencies = { "williamboman/mason.nvim" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")

			require("mason-lspconfig").setup_handlers {
				function (server_name) -- Default handler
					require("lspconfig")[server_name].setup {}
				end,
				["typescript-language-server"] = function ()
					lspconfig.tsserver.setup {}
				end,
				["eslint"] = function ()
					lspconfig.eslint.setup({
						root_dir = util.root_pattern(".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs"),
						settings = {
							workingDirectory = { mode = "auto" }
						},
						on_attach = function(client, bufnr)
							vim.api.nvim_create_autocmd("BufWritePre", {
								buffer = bufnr,
								command = "EslintFixAll",
							})
						end
					})
				end,
				["python-lsp-server"] = function()
					lspconfig.pyright.setup {} -- Or other Python LSP server
				end,
				["ruby-lsp"] = function()
					lspconfig.ruby_ls.setup {}
				end,
				["omnisharp"] = function()
					lspconfig.omnisharp.setup {}
				end,
				-- Add more server-specific handlers here
			}
		end,
	},


	-- Your other plugins (keep these)
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'rose-pine/neovim', name = 'rose-pine', lazy = false, priority = 1000, config = function() vim.cmd.colorscheme('rose-pine') end },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'nvim-treesitter/playground' },
	{ 'theprimeagen/harpoon' },
	{ 'tpope/vim-fugitive' },
	{ 'mbbill/undotree' },
	{ 'nvim-tree/nvim-web-devicons', lazy = false },
	{ 'lewis6991/gitsigns.nvim' },
	{ 'romgrk/barbar.nvim' },
	{ "nvim-tree/nvim-tree.lua", lazy = false, config = function() require("nvim-tree").setup({}) end },
	{"numToStr/FTerm.nvim"},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local util = require('lspconfig.util')

			dap.adapters.node = {
				type = "server",
				host = "127.0.0.1",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						require("mason-registry").get_package("js-debug-adapter"):get_install_path()
						.. "/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}

			dap.configurations.typescript = {
				{
					name = "Debug Server",
					type = "node",
					request = "launch",
					cwd = "${workspaceFolder}/packages/web",
					runtimeExecutable = "pnpm",
					runtimeArgs = { "dev" },
					console = "integratedTerminal",
					sourceMaps = true,
					skipFiles = { "<node_internals>/**" },
					protocol = "inspector",
				},
				{
					name = "Debug Tests",
					type = "node",
					request = "launch",
					cwd = "${workspaceFolder}/packages/web",
					runtimeExecutable = "yarn",
					runtimeArgs = { "test" },
					console = "integratedTerminal",
					sourceMaps = true,
					skipFiles = { "<node_internals>/**" },
					protocol = "inspector",
				}
			}
		end
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function() require("dap-vscode-js").setup({ adapters = { "pwa-node", "pwa-chrome" } }) end
	},
	{
		'jose-elias-alvarez/null-ls.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function() local null_ls = require('null-ls'); null_ls.setup({ sources = { null_ls.builtins.formatting.prettier.with({ prefer_local = 'node_modules/.bin' }) }, on_attach = function(client, bufnr) vim.api.nvim_create_autocmd('BufWritePre', { buffer = bufnr, callback = function() vim.lsp.buf.format({ async = false }) end }) end }) end
	},
	{ "nvim-neotest/nvim-nio" }, -- Ensure nvim-nio is listed

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local nio_status, nio = pcall(require, "nio")
			if not nio_status then
				vim.notify_error("nvim-nio could not be loaded. nvim-dap-ui might not work correctly.")
				return
			end
			require("dapui").setup()
		end,
	},

})

