return {
  "epwalsh/obsidian.nvim",
  config = function()
    require("obsidian").setup({
      dir = "~/Documents/rcommande",
      -- Optional, key mappings.
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gr"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
      },

      -- Optional, if set to true, the specified mappings in the `mappings`
      -- table will overwrite existing ones. Otherwise a warning is printed
      -- and the mappings are not applied.
      -- overwrite_mappings = false,
      --
      new_notes_location = "current_dir",
      -- Optional, completion.
      completion = {
        -- If using nvim-cmp, otherwise set to false
        -- nvim_cmp = true,
        -- Trigger completion at 2 chars
        min_chars = 2,
        -- Where to put new notes created from completion. Valid options are
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.

        -- Whether to add the output of the node_id_func to new notes in autocompletion.
        -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
        -- prepend_note_id = true
      },
    })
    vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>oqs", ":ObsidianQuickSwitch<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>on", ":ObsidianNew ", { noremap = true })
  end,
}
