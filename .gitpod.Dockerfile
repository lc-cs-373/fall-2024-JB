FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN brew install fzf

RUN sudo apt-get update -q && \
    sudo apt-get install -yq neovim stow ripgrep && \

# Install lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
    sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit && \
    rm lazygit.tar.gz
