#!/usr/bin/env lua

local common = require "build_tools.lua.common"

local message, abort = common.build_rom("sonic3k", "sonic3k", "-D Sonic3_Complete=1", "-p=FF -z=0," .. "kosinski-optimised" .. ",Size_of_Snd_driver_guess,after", false, "https://github.com/sonicretro/skdisasm")

if message then
	exit_code = false
end

if abort then
	os.exit(exit_code, true)
end

-- Correct the ROM's header with a proper checksum and end-of-ROM value.
common.fix_header("sonic3k.bin")

os.exit(exit_code, false)
