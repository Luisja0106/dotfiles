--plugin that allow close smart sentences like () '' "" etc
return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {},
	config = function()
		local autopairs = require("nvim-autopairs")

		autopairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "String" },
				javascript = { "template_string" },
			},
		})
	end,
}
