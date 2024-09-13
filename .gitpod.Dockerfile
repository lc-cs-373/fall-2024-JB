FROM gitpod/workspace-full

USER gitpod

RUN sudo apt-get update -q && \
    sudo apt-get install -yq redis-server neovim stow && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

# Install lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
    sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit && \
    rm lazygit.tar.gz

# Clone dotfiles repository and use stow to set up symlinks
RUN git clone https://github.com/yourusername/dotfiles.git $HOME/dotfiles && \
    cd $HOME/dotfiles && \
    stow */
