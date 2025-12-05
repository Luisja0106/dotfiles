--plugins for full focus
return {
	--plugin that focus on a part of the treesitter code.
	{
		"folke/twilight.nvim",
		cmd = { "Twilight" },
	},
	--Plugin that focus only in the code, and remove the UI
	{
		"folke/zen-mode.nvim",
		cmd = { "ZenMode" },
	},
}
