# .dotfiles

This is the basic setup for macOS that PrivacyCloud Engineering team uses.

It contains only the basics for day to day work. So please, feel free to install anything else you think convenient :relaxed:

## Usage

### Download

In case you cannot use `git` to download this repository, use the following `curl` command (which is generally available on a macOS fresh install) to download the project in the current directory:

```
curl -sL https://github.com/PrivacyCloud/.dotfiles/archive/master.tar.gz | tar xz
```

### Install

Use `make` to run some predefined tasks:

- `make all` installs the whole tooling suite as well as the dotfiles
- `make tools` installs only the tooling suite 
   - [Homebrew](https://brew.sh) and through  it:
      - Git
      - Zsh
      - Yarn
      - Docker
      - Google Chrome
      - Java
      - Postman
      - Slack
      - Visual Studio Code
   - [nvm](https://github.com/creationix/nvm)
   - [zsh]() and [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
   - [GCloud SDK](https://cloud.google.com/sdk/)
- `make dotfiles` installs only the dotfiles (by using symlinks)
   - `.gitignore` and `.gitconfig`
   - `.ssh` 
  

## Credits

This repo has been forked from **[@sergioalvz](https://github.com/sergioalvz)**, who was _heavily_ inspired one way or another by:

- **[@dgsuarez](https://github.com/dgsuarez/.dotfiles)**
- **[@jessfraz](https://github.com/jessfraz/dotfiles)**
- **[@sjl](https://bitbucket.org/sjl/dotfiles)**
- **[@holman](https://github.com/holman/dotfiles)**
