{ pkgs, lib, config, ... }:

{
    programs.zsh = {
      enable = true;
      dotDir = ".config/zsh";

      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;

      history = {
        save = 1000;
        size = 1000;
        path = "$HOME/.cache/zsh_history";
      };

      shellAliases = {
        ll        = "ls -la";
        ls        = "exa";
        auth      = "ssh-add ~/.ssh/id_rsa";
        dust      = "dust --si";
        reload    = "source ~/.zshrc";
        k         = "kubectl";
        vi        = "nvim";
        vim       = "nvim";
        nano      = "nvim";
        jj        = "juju";
        ssh       = "mosh";
        speedtest = "curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -";
        whatsmyip = "curl ifconfig.co";
      };
    };
}
