# Dot Files

My dot files and associated installation script. Dotfiles are split up into
modules using folders, then specific modules can be installed/ignored.

## Installation

Run `bootstrap.sh` and select all the specific modules you want to install. It
will create a config named install.conf to save this preference locally.

## Updating

As dotfiles are symlinked most changes to these require no other actions to be
reflected in your home directory. If changes have been made to a modules install
script you can re-run the installation script  `bootstrap.sh`.

To add or remove modules you can either edit the config manually and re-run the
bootstrap or re-create the config interactively with `bootstrap.sh --makeconf`.

## Structure

Dotfiles are grouped into separate modules that should be thematically linked.
They may contain an installation script named install.sh to run each time the
bootstrap script installs this module. All files ending in .symlink will be
symbolically linked relative to the home directory in the same way the
file/folder relates to the module directory. e.g. in the case of a structure
like this:
```
module_directory:
├── install.sh
├── plugin.cfg.symlink
├── plugin2
│   └── file.cfg.symlink
└── plugin3.symlink
    └── file2.symlink
```
All the files (bar install.sh) would keep the same directory structure with
module_directory being the home directory. The difference between plugin2 and
plugin3 being that all the files in the plugin3 folder are in the dotfiles repo
and symlinked whereas there could be files in the plugin2 folder that are not in
the dotfiles repo.
