FROM ubuntu:latest

RUN apt update && apt install -y \
  python3 \
  python3-pip \
  python3-dev \
  build-essential \
  libssl-dev \
  libffi-dev \
  python3-setuptools \
  python3-venv \
  git \
  curl \
  zsh \
  && rm -rf /var/lib/apt/lists/*

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

RUN curl -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz >> nvim.tar.gz && \
  tar -C /usr/local -xzf nvim.tar.gz && \
  rm nvim.tar.gz 

RUN curl -L https://go.dev/dl/go1.21.5.linux-amd64.tar.gz >> go.tar.gz && \
  tar -C /usr/local -xzf go.tar.gz && \
  rm go.tar.gz

RUN git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim && \
  git clone https://github.com/crayonwow/astrovim_user_config.git ~/.config/nvim/lua/user

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


ENV PATH=$PATH:/usr/local/nvim-linux64/bin
ENV PATH=$PATH:/usr/local/go/bin
ENV PATH="/root/.cargo/bin:${PATH}"
