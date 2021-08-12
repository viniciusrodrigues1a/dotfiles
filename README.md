# How to set it up

Run [setup.sh](setup.sh) to manage the dotfiles under the $HOME directory.

```sh
./setup.sh
```

...or you can stow them manually:

```sh
ls -F | grep / | xargs stow --verbose --stow --target $HOME
```
