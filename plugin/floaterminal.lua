local state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

local function open_floating_window(opts)
    -- Get current editor size
    local width = vim.o.columns
    local height = vim.o.lines

    -- Default width and height to 80% of the screen if not provided
    local win_width = opts and opts.width or math.floor(width * 0.8)
    local win_height = opts and opts.height or math.floor(height * 0.8)

    -- Calculate centered position
    local row = math.floor((height - win_height) / 2)
    local col = math.floor((width - win_width) / 2)

    -- Create a buffer (listed, scratch buffer)
    local buf = vim.api.nvim_create_buf(false, true)

    -- Define window options object
    local win_opts = {
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    }
    
    -- Return the buffer and the window config, don't open window here
    return { buf = buf, config = win_opts }
end

-- Example usage:
vim.api.nvim_create_user_command("T", function ()
    -- Check if the buffer associated with our terminal exists and is valid
    if state.floating.buf ~= -1 and vim.api.nvim_buf_is_valid(state.floating.buf) then
        -- Buffer exists, check if the window is currently visible/valid
        local window_visible = false
        if state.floating.win ~= -1 and vim.api.nvim_win_is_valid(state.floating.win) then
             -- nvim_win_is_valid confirms it's not closed/hidden
             window_visible = true
        end

        if window_visible then
            -- Window is visible, just hide it
            vim.api.nvim_win_hide(state.floating.win)
            -- Window ID becomes invalid, but keep buffer ID
            state.floating.win = -1 
        else
            -- Buffer exists, but window is hidden or invalid. Re-open the existing buffer.
            local float_info = open_floating_window() -- Get fresh window config (size/position)
            state.floating.win = vim.api.nvim_open_win(state.floating.buf, true, float_info.config) -- Open existing buffer with new config

            -- Clean up the extra buffer created by open_floating_window
            vim.api.nvim_buf_delete(float_info.buf, {force = true})

            -- Set common window options
            vim.wo[state.floating.win].number = false
            vim.wo[state.floating.win].relativenumber = false

            -- Focus window and enter terminal mode
            vim.api.nvim_set_current_win(state.floating.win)
            vim.cmd('startinsert')
        end
    else
        -- No valid buffer exists, create a new terminal from scratch
        local float_info = open_floating_window() -- Get new buffer and window config
        state.floating.buf = float_info.buf
        -- state.floating.win is still -1

        -- Set buffer options *before* opening terminal
        vim.bo[state.floating.buf].bufhidden = 'hide'

        -- Open the actual window now
        state.floating.win = vim.api.nvim_open_win(state.floating.buf, true, float_info.config)

        -- Set common window options
        vim.wo[state.floating.win].number = false
        vim.wo[state.floating.win].relativenumber = false

        -- Open terminal in the buffer (attaches to existing buffer/window)
        vim.fn.termopen(vim.o.shell, {
            buf = state.floating.buf,
            detach = false,
            on_exit = function(job_id, code, event)
                print("Terminal exited with code: " .. code)
                -- Buf may still be valid but we want a fresh term next time
                state.floating.buf = -1
                state.floating.win = -1
            end
        })

        -- Set the terminal-specific keymap to toggle off
        vim.keymap.set('t', '<leader>T', '<C-\\><C-n>:T<CR>', { buffer = state.floating.buf, noremap = true, silent = true, desc = "Toggle floating terminal" })

        -- Focus window and enter terminal mode
        vim.api.nvim_set_current_win(state.floating.win)
        vim.cmd('startinsert')
    end
end, {})

-- open_floating_window({ width = 100, height = 30 })

