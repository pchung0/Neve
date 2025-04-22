{ lib, config, ... }:
{
  options = {
    harpoon.enable = lib.mkEnableOption "Enable harpoon module";
  };
  config = lib.mkIf config.harpoon.enable {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;
      # keymapsSilent = true;
      # keymaps = {
      #   addFile = "<leader>ha";
      #   toggleQuickMenu = "<C-e>";
      #   navFile = {
      #     "1" = "<leader>hj";
      #     "2" = "<leader>hk";
      #     "3" = "<leader>hl";
      #     "4" = "<leader>hm";
      # };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>ha";
        action.__raw = "function() require'harpoon':list():add() end";
      }
      {
        mode = "n";
        key = "<C-e>";
        action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
      }
      {
        mode = "n";
        key = "<leader>hj";
        action.__raw = "function() require'harpoon':list():select(1) end";
      }
      {
        mode = "n";
        key = "<leader>hk";
        action.__raw = "function() require'harpoon':list():select(2) end";
      }
      {
        mode = "n";
        key = "<leader>hl";
        action.__raw = "function() require'harpoon':list():select(3) end";
      }
      {
        mode = "n";
        key = "<leader>hm";
        action.__raw = "function() require'harpoon':list():select(4) end";
      }
    ];
  };
}
