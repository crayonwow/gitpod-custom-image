FROM mcr.microsoft.com/devcontainers/base:ubuntu
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install -y \
  python3 \
  python3-pip \
  python3-venv \
  python3-setuptools \
  build-essential \
  libssl-dev \
  libffi-dev \
  curl \
  gpg 

RUN curl -fsSL https://apt.cli.rs/pubkey.asc | sudo tee -a /usr/share/keyrings/rust-tools.asc && \
  curl -fsSL https://apt.cli.rs/rust-tools.list | sudo tee /etc/apt/sources.list.d/rust-tools.list && \
  apt update 

RUN apt install -y \ 
  bat \
  zoxide \
  neovim \
  ripgrep \
  eza \
  && rm -rf /var/lib/apt/lists/*


RUN curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v0.55.1/lazygit_0.55.1_linux_arm64.tar.gz" 
RUN tar xf lazygit.tar.gz lazygit 
RUN install lazygit -D -t /usr/local/bin/ 

# RUN chsh -s $(which zsh)


# RUN curl -L https://go.dev/dl/go1.24.0.linux-amd64.tar.gz >> go.tar.gz && \
#   tar -C /usr/local -xzf go.tar.gz && \
#   rm go.tar.gz

# RUN git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim && \
#   git clone https://github.com/crayonwow/astrovim_user_config.git ~/.config/nvim/lua/user

#
# ENV PATH=$PATH:/usr/local/nvim-linux64/bin
# ENV PATH=$PATH:/usr/local/go/bin
