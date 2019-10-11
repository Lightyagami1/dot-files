with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    # python
    python3
    neovim
    # fzf
    zsh
    # zsh-syntax-highlighting
    # zsh-completions
    # oh-my-zsh 
    # vimPlugins.fzf
    # vimPlugins.LanguageClient-neovim
    # python27Packages.virtualenv
    # python27Packages.pip
    python36Packages.pip
    python36Packages.ipython
    python36Packages.virtualenv
    # ghc
  ];
}
