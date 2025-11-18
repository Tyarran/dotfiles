return {
	{
		"deparr/tairiki.nvim",
	},

	-- {
	-- 	"baliestri/aura-theme",
	-- 	lazy = false,
	-- 	-- priority = 1000,
	-- 	config = function(plugin)
	-- 		vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
	-- 		-- vim.cmd([[colorscheme aura-dark]])
	-- 	end,
	-- },
	{
		"vague-theme/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				-- optional configuration here
			})
			-- vim.cmd("colorscheme vague")
		end,
	},
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
			-- config = function()
			--   vim.cmd("colorscheme tokyonight")
			-- end
		},
		{
			"catppuccin/nvim",
			-- config = function()
			--   vim.cmd.colorscheme "catppuccin"
			-- end
		},
		{
			"EdenEast/nightfox.nvim",
			config = function()
				require("nightfox").setup({
					-- options = {
					--   transparent = true,
					-- },
				})
				-- vim.cmd("colorscheme tokyonight")
			end,
		},
		{
			"navarasu/onedark.nvim",
			-- config = function()
			--   -- Lua
			--   require('onedark').setup {
			--     style = 'deep'
			--   }
			--   require('onedark').load()
			-- end
		},
		{
			"AlexvZyl/nordic.nvim",
		},
		{
			"nyoom-engineering/oxocarbon.nvim",
			-- Add in any other configuration;
			--   event = foo,
			--   config = bar
			--   end,
		},
		{
			"rose-pine/neovim",
			-- lazy = false,
			-- priority = 1000,
			-- opts = {},
			-- config = function()
			--   vim.cmd("colorscheme rose-pine")
			-- end
		},
		{
			"elvessousa/sobrio",
		},
		{
			"nyoom-engineering/nyoom.nvim",
		},
	},
}
