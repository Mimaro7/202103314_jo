{ pkgs }: {
  deps = [
    pkgs.vim
    pkgs.q
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}