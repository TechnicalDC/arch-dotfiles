require("full-border"):setup({
	type = ui.Border.ROUNDED
})

require("eza-preview"):setup({
	-- Set the tree preview to be default (default: true)
	default_tree = true,

	-- Directory depth level for tree preview (default: 3)
	level = 3,

	-- Show file icons
	icons = true,

	-- Follow symlinks when previewing directories (default: true)
	follow_symlinks = true,

	-- Show target file info instead of symlink info (default: false)
	dereference = false,

	-- Show hidden files (default: true)
	all = true,

	-- Ignore files matching patterns (default: {})
	-- ignore_glob = "*.log"
	-- ignore_glob = { "*.tmp", "node_modules", ".git", ".DS_Store" }
	-- SEE: https://www.linuxjournal.com/content/pattern-matching-bash to learn about glob patterns
	ignore_glob = {},

	-- Ignore files mentioned in '.gitignore'  (default: true)
	git_ignore = true,

	-- Show git status (default: false)
	git_status = false
})

-- ~/.config/yazi/init.lua

-- Display information associated with the file/folder to mirror the output
-- of the 'ls -l' command. i.e. permissions, hardlinks, owner, size, mtime
function Linemode:ls_equivalent()

	local permissions = self._file.cha:perm() or ""

	local nlink = self._file.cha.nlink or ""

	local user = ya.user_name and ya.user_name(self._file.cha.uid) or self._file.cha.uid
	local group = ya.group_name and ya.group_name(self._file.cha.gid) or self._file.cha.gid
	local owner = string.format("%s:%s", user, group)

	local mtime = math.floor(self._file.cha.mtime or 0)
	if mtime == 0 then
		mtime = ""
	elseif os.date("%Y", mtime) == os.date("%Y") then
		mtime = os.date("%b %d %H:%M", mtime)
	else
		mtime = os.date("%b %d  %Y", mtime)
	end

	local size = self._file:size()
	if size then
		size = ya.readable_size(size) or "-"
	else
		local folder = cx.active:history(self._file.url)
		size = folder and tostring(#folder.files) or ""
	end

	return string.format("%s %s %s %6s %s", permissions, nlink, owner, size, mtime)
end
