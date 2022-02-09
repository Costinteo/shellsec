```
+-----------------------------------------------------------------+
|  ______ _     _ _______ _       _        ______ _______ _______ |
| / _____) |   | |  _____) |     | |      / _____)  _____|  _____)|
|( (____ | |___| | |___  | |     | |     ( (____ | |___  | |      |
| \____ \|  ___  |  ___) | |     | |      \____ \|  ___) | |      |
| _____) ) |   | | |_____| |_____| |_____ _____) ) |_____| |_____ |
|(______/|_|   |_|_______)_______)_______)______/|_______)_______)|
+-----------------------------------------------------------------+
```

# shellsec

Simple security tool to generate and manage secure passwords. Can be used as a simplistic CLI-based local password manager.

## Requirements

```
bash
tr
openssl
# might replace the ones below with pure bash alternatives
grep
sed
head
cat
```

## Installation
To install, use the provided Makefile. \
Simply ``$ make install`` to install and ``$ make uninstall`` to remove shellsec. By default, shellsec will install in ``/usr/local/bin``. \ 
This can be changed by running ``$ make INSTALL_DIR=custom_dir install``, where ``custom_dir`` is the directory you want to install in. Uninstall has to be called with the same dir, if you want to uninstall! \
Also, root privileges might be needed if installing in privileged directories. Use ``sudo``.

```
$ git clone https://github.com/Costinteo/shellsec
$ cd shellsec
$ make install
```

Alternatively, copy the files directly to where you want after cloning:

```
$ cp shellsec* /usr/local/bin/
```

## Usage
```
Usage: shellsec [OPTIONS]...
Bash tool to generate and manage secure passwords.
Run without arguments for interactive mode. [NOT IMPLEMENTED YET]

Options:
    -h, --help                print this text and exit
        --license             print license and exit
        --version             print version and exit
        --no-color            suppress colored output
    -p, --pass <LEN>          generate random pass with <LEN> chars
    -s, --store <PLATFORM>    store pass for <PLATFORM> *
    -l, --load <PLATFORM>     load pass for <PLATFORM>
    -e, --edit <PLATFORM>     edit pass for <PLATFORM>  *
    -d, --delete <PLATFORM>   delete pass for <PLATFORM>
    -a, --all-platforms       print all platforms
        --print               print pass after generated

Options marked with "*" will use the generated pass if ran with "-p/--pass".
The script is written by Costinteo. <https://github.com/Costinteo>
Licensed under GNU GPL v3+. <https://www.gnu.org/licenses/gpl-3.0.txt>
```

## Examples

Generate a secure 20 character password using /dev/urandom and print to stdout
```
$ shellsec -p 20
Generated pass: LNa3bb]MDm!2#5_1^1;o
```

Generate a secure 25 character password and save it for platform "Github":
```
$ shellsec -p 25 -s Github
```
This will ask for your encryption key / master password, encrypt the password with it and then save it in ``~/.shellsec_secret``.

This doesn't print out anything, so let's add "--print":
```
$ shellsec -p 25 -s Github --print
Generated pass: 6lBbyb8/cQ2fO30D5y."B`}[2
```

To load a password:
```
$ shellsec -l Github
6lBbyb8/cQ2fO30D5y."B`}[2
```

Let's delete the Github password now:
```
$ shellsec -d Github
Password deleted for platform github.
```

Maybe I want to save an existing, non-random password
```
$ shellsec -s Hackerone
```
This will ask for the password to save and then it will ask for your encryption key / master password.

Let's re-generate a pass for a platform:
```
$ shellsec -p 25 -e Discord
```
The ``-e/--edit`` option will (currently) delete the old password and replace it with either an input from stdin, or a generated pass if used with ``-p/--pass``.

## Additional notes

To avoid having to write your master password all the time, I've provided a script that can be sourced in your current terminal session: ``shellsec-setkey``. It asks for your encryption password and sets an environment variable ``SHELLSEC_MASTERPASS`` to the value of your input. This is somewhat dangerous: it can reveal your master password in cleartext to anyone trying to echo it on the same terminal. I think this could only happen if someone is PHYSICALLY at your computer, with it unlocked. Please open an issue if I'm wrong, or even send in a pull request! :)

To use it simply ``$ source shellsec-setkey`` or ``$ . shellsec-setkey``

## Contributing

If you find bugs (especially security ones), or have any kind of suggestion, I'd love to hear them! Open issues or pull requests and I'll be sure to check them out!
