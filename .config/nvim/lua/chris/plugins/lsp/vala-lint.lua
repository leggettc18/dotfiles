local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local handle_vala_lint_output = function(params)
	if params.output and params.output.mistakes then
		local output = params.output.mistakes

		local parser = h.diagnostics.from_json({
			severities = {
				warn = h.diagnostics.severities["warning"],
				error = h.diagnostics.severities["error"],
			},
		})

		return parser({ output = output })
	end
end

local vala_lint_generator_json = h.generator_factory({
	args = { "$FILENAME", "-z", "-j", "-e" },
	command = "io.elementary.vala-lint",
	format = "json",
	on_output = handle_vala_lint_output,
	to_temp_file = true,
})

local vala_lint_source = {
	name = "vala-lint",
	method = { methods.internal.DIAGNOSTICS_ON_SAVE, methods.internal.DIAGNOSTICS },
	filetypes = { "vala" },
	generator = vala_lint_generator_json,
}

return vala_lint_source
