require("full-border"):setup({
	type = ui.Border.ROUNDED
})

-- YATLINE {{{
-- require("yatline"):setup({
-- 	section_separator = { open = "", close = "" },
-- 	part_separator = { open = "", close = "" },
-- 	inverse_separator = { open = "", close = "" },
--
-- 	padding = { inner = 1, outer = 1 },
--
-- 	style_a = {
-- 		bg = "red",
-- 		fg = "brightblack",
-- 		bg_mode = {
-- 			normal = "red",
-- 			select = "brightyellow",
-- 			un_set = "brightred",
-- 		},
-- 	},
-- 	style_b = { bg = "brightblack", fg = "brightwhite" },
-- 	style_c = { bg = "black", fg = "brightwhite" },
--
-- 	permissions_t_fg = "green",
-- 	permissions_r_fg = "yellow",
-- 	permissions_w_fg = "red",
-- 	permissions_x_fg = "cyan",
-- 	permissions_s_fg = "white",
--
-- 	tab_width = 20,
--
-- 	selected = { icon = "󰻭", fg = "yellow" },
-- 	copied = { icon = "", fg = "green" },
-- 	cut = { icon = "", fg = "red" },
--
-- 	files = { icon = "", fg = "blue" },
-- 	filtereds = { icon = "", fg = "magenta" },
--
-- 	total = { icon = "󰮍", fg = "yellow" },
-- 	success = { icon = "", fg = "green" },
-- 	failed = { icon = "", fg = "red" },
--
-- 	show_background = true,
--
-- 	display_header_line = true,
-- 	display_status_line = true,
--
-- 	component_positions = { "header", "tab", "status" },
--
-- 	header_line = {
-- 		left = {
-- 			section_a = {
-- 				{ type = "line", name = "tabs" },
-- 			},
-- 			section_b = {},
-- 			section_c = {},
-- 		},
-- 		right = {
-- 			section_a = {
-- 				-- { type = "string", name = "date", params = { "%A, %d %B %Y" } },
-- 			},
-- 			section_b = {
-- 				-- { type = "string", name = "date", params = { "%X" } },
-- 			},
-- 			section_c = {},
-- 		},
-- 	},
--
-- 	status_line = {
-- 		left = {
-- 			section_a = {
-- 				{ type = "string", name = "tab_mode" },
-- 			},
-- 			section_b = {
-- 				{ type = "string", name = "hovered_size" },
-- 			},
-- 			section_c = {
-- 				{ type = "string", name = "hovered_path" },
-- 				{ type = "coloreds", name = "count" },
-- 			},
-- 		},
-- 		right = {
-- 			section_a = {
-- 				{ type = "string", name = "cursor_position" },
-- 			},
-- 			section_b = {
-- 				{ type = "string", name = "cursor_percentage" },
-- 			},
-- 			section_c = {
-- 				{ type = "string", name = "hovered_file_extension", params = { true } },
-- 				{ type = "coloreds", name = "permissions" },
-- 			},
-- 		},
-- 	},
-- })
-- }}}

-- EZA-PREVIEW {{{
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
-- }}}

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
