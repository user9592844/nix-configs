{ pkgs, lib, config, ... }:

{
  programs.vscode = {
    enable = true;
    userSettings = {
      editor.defaultFormatter = "rust-lang.rust-analyzer";
      editor.formatOnSave = true;
      rust-analyzer.check.allTargets = false;
      rust-analyzer.check.targets = "x86_64-unknown-linux-gnu";
    };
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      serayuzgur.crates
      tamasfe.even-better-toml
      vadimcn.vscode-lldb
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
  };
}
