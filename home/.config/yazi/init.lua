th.git = th.git or {}
th.git.unknown_sign = " "
th.git.modified_sign = "M"
th.git.deleted_sign = "D"
th.git.ignored_sign = "i"
th.git.added_sign = "A"
th.git.untracked_sign = "U"

require("git"):setup({
	-- Order of status signs showing in the linemode
	order = 1500,
})
