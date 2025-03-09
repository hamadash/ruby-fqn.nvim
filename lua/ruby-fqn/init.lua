local M = {}

M.get_class_or_module_name_with_namespaces = function()
	local namespaces = {}
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

	for _, line in ipairs(lines) do
		local namespace = line:match("^%s*module%s+([%w_:]+)")
		local class_name = line:match("^%s*class%s+([%w_:]+)")

		if namespace then
			table.insert(namespaces, namespace)
		end

		if class_name then
			return (#namespaces > 0) and (table.concat(namespaces, "::") .. "::" .. class_name) or class_name
		end
	end

	-- e.g. Helper
	return #namespaces > 0 and table.concat(namespaces, "::") or nil
end

M.copy_name = function()
	local name = M.get_class_or_module_name_with_namespaces()
	if name then
		vim.fn.setreg("+", name)
	else
		print("Class or module name not found.")
	end
end

vim.api.nvim_create_user_command("RubyFQN", function(opts)
	if opts.args == "CopyName" then
		M.copy_name()
	else
		print("Unknown argument: " .. opts.args)
	end
end, {
	nargs = 1,
	complete = function()
		return { "CopyName" }
	end,
})

return M
