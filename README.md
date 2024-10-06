# My Nix Develop Templates

Personal templates for develop environments I use - most are very basic.

Usage:

```sh
nix flake new --template <git:repo/local-directory>#<template-name> <project-directory>
```

E.g:

```sh
nix flake new --template github:adamsurge/flake-templates#rust ./rust-project
# or
nix flake new --template ~/Projects/flake-templates#rust ./rust-project
```

## Templates

| Name   | Description                                            |
| ------ | ------------------------------------------------------ |
| `rust` | Simple rust template using the rust-overlay            |
| `bevy` | Bevy template for building games using the Bevy Engine |
