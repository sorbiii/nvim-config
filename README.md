### Introduction

My neovim config based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

List of changes to kickstart.nvim:

* Enable relative line numbers
* [Catppuccin theme](https://github.com/catppuccin/nvim)
* Add [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
* Add a couple of useful keybinds
* Enable scrolloff
* Add [wakatime](https://github.com/wakatime/vim-wakatime)
* Set indent to 4 spaces

### Installation

* Backup your previous configuration
* Git clone this repository into your neovim configuration folder: `git clone https://github.com/ignassew/nvim-config $HOME/.config/nvim` (Linux) or `git clone https://github.com/ignassew/nvim-config ~/AppData/Local/nvim/init.lua` (Windows)
* Start Neovim (`nvim`) and run `:PackerInstall` - ignore any error message about missing plugins, `:PackerInstall` will fix that shortly
* Restart Neovim


If there are languages that you don't want to use, remove their configuration and notes from your `init.lua` after copy and pasting (for example, in the mason configuration).

### Windows Installation

Installation may require installing build tools, and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documention for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake, and the Microsoft C++ Build Tools on Windows

```lua
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```

### Configuration

You could directly modify the `init.lua` file with your personal customizations. This option is the most straightforward, but if you update your config from this repo, you may need to reapply your changes.

An alternative approach is to create a separate `custom.plugins` module to register your own plugins. In addition, you can handle further customizations in the `/after/plugin/` directory (see `:help load-plugins`). See the following examples for more information. Leveraging this technique should make upgrading to a newer version of this repo easier. 

#### Example `plugins.lua`

The following is an example of a `plugins.lua` module (located at `$HOME/.config/nvim/lua/custom/plugins.lua`) where you can register your own plugins. 

```lua
return function(use)
  use({
    "folke/which-key.nvim",
      config = function()
        require("which-key").setup({})
      end
  })
end
```

#### Example `defaults.lua`

For further customizations, you can add a file in the `/after/plugin/` folder (see `:help load-plugins`) to include your own options, keymaps, autogroups, and more. The following is an example `defaults.lua` file (located at `$HOME/.config/nvim/after/plugin/defaults.lua`).

```lua
vim.opt.relativenumber = true

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
```

### Contribution

Any contributions are welcome, but because this is my personal configuration, I will only accept those contributions that are fitting me.

### FAQ

 * What should I do if I already have a pre-existing neovim configuration?
     * You should back it up, then delete all files associated with it.
     * This includes your existing init.lua and the neovim files in `.local` which can be deleted with `rm -rf ~/.local/share/nvim/`

