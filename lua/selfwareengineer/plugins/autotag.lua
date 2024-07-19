return {
	"windwp/nvim-ts-autotag",
	config = function()
		local autotag = require("nvim-ts-autotag")

		autotag.setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},

			-- Overrides per filetype, uncomment to enable. Stock text provided for example.
			-- per_filetype = {
			--     ["html"] = {
			--         enable_close = false
			--     }
			-- }
		})
	end,
}
