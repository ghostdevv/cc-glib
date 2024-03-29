# CC GLib

A standard set of libraries/tools for CC Tweaked.

## Install

The following command will install the latest version of glib:

```bash
wget run https://raw.githubusercontent.com/ghostdevv/cc-glib/main/lib/glib.lua install
```

## Updating

You can simply run:

```bash
glib update
```

`update` and `install` are equivalent commands

## Core Commands

### `glib`

The primary glib command which allows you to interact/manage the library.

```bash
$ glib help
GLib v0.2.0

  Usage
    glib <command>

  Available Commands
    help               Show this help message
    version            Get the current version of GLib
    install, update    (re)install GLib
```

### `neofetch`

The `neofetch` command is inspired by the popular [bash based neofetch tool](https://github.com/dylanaraps/neofetch).

```bash
$ neofetch
```

![neofetch screenshot](./.github/neofetch.png)

### `cat`

The `cat` command can be used to read the contents of a file, it will also display some helpful information such as it's line count and size.

```bash
$ cat <file>
```

### `touch`

Create empty file(s) quickly with touch.

```bash
$ touch <file...>
```

## Turtle Commands

These commands are only installed on turtles.

### `fuel`

The `fuel` command simply lists out the current fuel and fuel limit.

```bash
$ fuel
Fuel Level: 11157/100000
```

### `mine`

The `mine` command ([`ghostdevv/mining-turtle`](https://github.com/ghostdevv/mining-turtle)) is used to mine an area the user defines.

The turtle must be placed in the bottom left corner facing the direction you want to mine.

```bash
$ mine <width> <height> <depth>
```
