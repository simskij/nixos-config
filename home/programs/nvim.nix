{ pkgs, config, lib, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    extraConfig = ''
        lua << EOF
        vim.g.mapleader = ';'
        vim.g.maplocalleader = ';'
        vim.opt.expandtab = true
        vim.opt.shiftwidth = 4
        vim.opt.smartindent = true
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.wo.number = true
        vim.wo.wrap = false
        function map(mode, lhs, rhs, opts)
          local options = {noremap = true, silent = true}
          if opts then
            options = vim.tbl_extend("force", options, opts)
          end
          vim.keymap.set(mode, lhs, rhs, options)
        end
        
        map('n', '<leader>t',        ':ToggleTerm<CR>'      )
        map('i', '<leader><leader>', '<Esc>'                )
        map('t', '<Esc>',            '<C-\\><C-n>'          )
        map('n', '<leader>p',        ':NvimTreeToggle<CR>'  )
        map('n', '<leader><Space>',  ':NvimTreeToggle<CR>'  )
        map('n', '<leader>ff',       ':Telescope find_files<CR>')
        map('n', '<leader>fg',       ':Telescope live_grep<CR>' )
        map('n', '<leader>fb',       ':Telescope buffers<CR>'   )
        map('n', '<leader>fh',       ':Telescope help_tags<CR>' )
        
        EOF
    '';


    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      nvim-web-devicons
      nvim-tree-lua
      nvim-treesitter
      vim-easy-align
      refactoring-nvim
      vim-gitgutter
      telescope-nvim
      {
        plugin = toggleterm-nvim;
        type = "lua";
        config = ''
            require('toggleterm').setup()
        '';
      }
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = ''
            require('nvim-tree').setup({ update_cwd = true })
        '';
      }
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = ''
            require('catppuccin').setup {
                flavour = 'mocha',
            }
            vim.api.nvim_command 'colorscheme catppuccin'
        '';
      }
    ];
  };
}
