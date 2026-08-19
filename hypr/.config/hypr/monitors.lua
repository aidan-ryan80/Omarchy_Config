-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

-- Physical layout (left to right): HP Monitor | Acer Monitor | Laptop
-- Laptop + Acer bottoms aligned; laptop sits higher due to shorter logical height.
-- To switch machines: comment out the active block and uncomment the other.

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 1.6

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- MACHINE: Acer PHN16
-- Laptop logical size: 2560/1.60 = 1600w x 1600/1.60 = 1000h
-- Acer logical size: 1920w x 1080h - 80px taller, so laptop sits at y=80
hl.monitor({ output = "desc:Hewlett Packard HP E240c", mode = "preferred", position = "0x0", scale = 1 })
hl.monitor({ output = "desc:Acer Technologies B246HL", mode = "preferred", position = "1920x0", scale = 1 })
hl.monitor({
	output = "desc:AU Optronics B160QAN03.Y",
	mode = "2560x1600@240",
	position = "3840x80",
	scale = omarchy_monitor_scale,
})

-- MACHINE: Old Laptop
-- Laptop logical size: 1920/1.33334 = 1440w x 1080/1.33334 = 810h
-- Acer logical size: 1920w x 1080h - 270px taller, so laptop sits at y=270
-- hl.monitor({ output = "desc:Hewlett Packard HP E240c", mode = "preferred", position = "0x0", scale = 1 })
-- hl.monitor({ output = "desc:Acer Technologies B246HL", mode = "preferred", position = "1920x0", scale = 1 })
-- hl.monitor({ output = "desc:BOE 0x08C2", mode = "1920x1080@60", position = "3840x270", scale = 1.33334 })

-- Persistent workspace assignments (laptop).
hl.workspace_rule({ workspace = "1", monitor = "desc:AU Optronics B160QAN03.Y", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "desc:AU Optronics B160QAN03.Y", persistent = true })
hl.workspace_rule({ workspace = "7", monitor = "desc:AU Optronics B160QAN03.Y", persistent = true })

-- Old laptop persistent assignments.
-- hl.workspace_rule({ workspace = "1", monitor = "desc:BOE 0x08C2", persistent = true })
-- hl.workspace_rule({ workspace = "4", monitor = "desc:BOE 0x08C2", persistent = true })
-- hl.workspace_rule({ workspace = "7", monitor = "desc:BOE 0x08C2", persistent = true })

-- Shared workspace assignments (external monitors).
hl.workspace_rule({ workspace = "2", monitor = "desc:Acer Technologies B246HL" })
hl.workspace_rule({ workspace = "5", monitor = "desc:Acer Technologies B246HL" })
hl.workspace_rule({ workspace = "8", monitor = "desc:Acer Technologies B246HL" })
hl.workspace_rule({ workspace = "3", monitor = "desc:Hewlett Packard HP E240c" })
hl.workspace_rule({ workspace = "6", monitor = "desc:Hewlett Packard HP E240c" })
hl.workspace_rule({ workspace = "9", monitor = "desc:Hewlett Packard HP E240c" })
