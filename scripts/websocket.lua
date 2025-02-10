-- mpv_websocket
-- https://github.com/kuroahna/mpv_websocket

local options = {
  socket_port = "6677"
}

local utils = require 'mp.utils'
mp.options = require "mp.options"
mp.options.read_options(options, "websocket")

local config_file_path = mp.find_config_file("mpv.conf")
local config_folder_path, config_file = utils.split_path(config_file_path)
local mpv_websocket_path
local tmp_path
local initialised_websocket

local platform
if mp.get_property_native('options/vo-mmcss-profile', o) ~= o then
  platform = 'windows'
else
  platform = 'linux'
end

if platform == 'windows' then
	mpv_websocket_path = utils.join_path(config_folder_path, "mpv_websocket.exe")
	tmp_path = "\\\\.\\pipe\\tmp\\mpv-socket"
else
	mpv_websocket_path = utils.join_path(config_folder_path, "mpv_websocket")
	tmp_path = "/tmp/mpv-socket"
end

local function start_websocket()
	initialised_websocket = mp.command_native_async({
		name = "subprocess",
		playback_only = false,
		capture_stdout = true,
		capture_stderr = true,
		args = {
			mpv_websocket_path,
			"-m",
			tmp_path,
			"-w",
			options.socket_port,
		},
	})
end

local function end_websocket()
	mp.abort_async_command(initialised_websocket)
	initialised_websocket = nil
end

local function toggle_websocket()
	local paused = mp.get_property_bool('pause')
	if initialised_websocket and paused then
		end_websocket()
	elseif not initialised_websocket and not paused then
		start_websocket()
	end
end

mp.register_script_message('togglewebsocket', toggle_websocket)
start_websocket()