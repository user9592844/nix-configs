{ pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;

    shellAliases = {
      home = "cd ~";
      gita = "git add";
      gitb = "git branch";
      gitc = "git checkout";
      gitd = "git branch -D";
      gitf = "git fetch --prune --recurse-submodules";
      giti = "git init";
      gitl = "git lg";
      gitm = "git merge";
      gitr = "git restore";
      gits = "git status";
      gitt = "git tag";
      gitv = "git version";
      gpul = "git pull";
      gpus = "git push";
      gsub = "git submodule";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      cp = "cp -i";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      erg = "rg -e";
      fgrep = "fgrep --color=auto";
      frg = "rg -f";
      last = "cd \${OLDPWD}";
      ls = "lsd";
      ll = "ls -l";
      ln = "ln -i";
      "l." = "ls -d .*";
      mv = "mv -i";
      now = ''date +"%T"'';
      rg = "rg -S";
      rgl = "rg -l";
      rm = "rm -i";
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-completions";
          rev = "0.35.0";
          sha256 = "sha256-GFHlZjIHUWwyeVoCpszgn4AmLPSSE8UVNfRmisnhkpg=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "sha256-gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
        };
      }
    ];
  };
}
