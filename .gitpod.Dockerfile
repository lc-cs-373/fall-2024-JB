FROM gitpod/workspace-full

# Install custom tools, runtime, etc.

RUN sudo apt-get update -q && \
    sudo apt-get install -yq redis-server neovim stow ripgrep && \

# Install lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
    sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit && \
    rm lazygit.tar.gz

# Clone dotfiles repository and use stow to set up symlinks
RUN git clone https://github.com/Jefferson-Butler1/dotfiles.git $HOME/dotfiles && \
    cd $HOME/dotfiles && \
    stow */
