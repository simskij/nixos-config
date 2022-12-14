{...}: {
  programs = {
    btop = {
      enable = true;
      settings = {
        color_theme = "catppuccin";
      };
    };
  };
  home = {
    file = {
      ".config/btop/themes/catppuccin.theme" = {
          text = ''
            theme[main_bg]="#1e1d2f"
            theme[main_fg]="#d9e0ee"
            theme[title]="#d9e0ee"
            theme[hi_fg]="#96cdfb"
            theme[selected_bg]="#302d41"
            theme[selected_fg]="#96cdfb"
            theme[inactive_fg]="#6e6c7e"
            theme[graph_text]="#c3bac6"
            theme[meter_bg]="#575268"
            theme[proc_misc]="#C3BAC6"
            theme[cpu_box]="#89dceb"
            theme[mem_box]="#abe9b3"
            theme[net_box]="#ddb6f2"
            theme[proc_box]="#96cdfb"
            theme[div_line]="#575268"
            theme[temp_start]="#fae3b0"
            theme[temp_mid]="#f8bd95"
            theme[temp_end]="#e8a2af"
            theme[cpu_start]="#89dceb"
            theme[cpu_mid]="#89dceb"
            theme[cpu_end]="#96cdfb"
            theme[free_start]="#b5e8e0"
            theme[free_mid]="#abe9b3"
            theme[free_end]="#abe9b3"
            theme[cached_start]="#c9cbff"
            theme[cached_mid]="#ddb6f2"
            theme[cached_end]="#ddb6f2"
            theme[available_start]="#f5e0dc"
            theme[available_mid]="#f2cdcd"
            theme[available_end]="#f2cdcd"
            theme[used_start]="#f8bd96"
            theme[used_mid]="#f8bd96"
            theme[used_end]="#e8a2af"
            theme[download_start]="#c9cbff"
            theme[download_mid]="#c9cbff"
            theme[download_end]="#ddb6f2"
            theme[upload_start]="#c9cbff"
            theme[upload_mid]="#c9cbff"
            theme[upload_end]="#ddb6f2"
            theme[process_start]="#96cdfb"
            theme[process_mid]="#96cdfb"
            theme[process_end]="#89dceb"
          '';
      };
    };
  };
}
