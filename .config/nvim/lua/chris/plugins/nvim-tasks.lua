local path_setup, path = pcall(require, "plenary.path")
if not path_setup then
    return
end

local tasks_setup, tasks = pcall(require, "tasks")
if not tasks_setup then
    return
end

tasks.setup({
    default_params = {
        cmake = {
            cmd = "cmake",
            build_dir = tostring(path:new("{cwd}", "build", "{os}-{build_type}")),
            build_type = "Debug",
            dap_name = "lldb",
            args = {
                configure = { "-G", "Ninja", "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1"}
            },
        },
    },
    save_before_run = true,
    params_file = 'neovim.json',
    quickfix = {
        pos = 'botright',
        height = 12,
    },
    dap_open_command = function() return require('dap').repl.open() end,
})
