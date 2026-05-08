th.git = th.git or {}
th.git.unknown_sign = " "
th.git.modified_sign = "M"
th.git.deleted_sign = "D"
th.git.added_sign = "A"
th.git.untracked_sign = "U"
th.git.ignored_sign = "i"

require("git"):setup({
	-- Order of status signs showing in the linemode
	order = 1500,
})
