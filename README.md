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

Simple security tool to generate and manage secure passwords. Can be used a simplistic CLI-based local password manager.

## Requirements

```
bash
tr
grep # might replace with pure bash alternative
sed  # might replace with pure bash alternative
openssl
```

## Usage
```
Usage: shellsec [OPTIONS]...
Bash tool to generate and manage secure passwords.
Run without arguments for interactive mode. [NOT IMPLEMENTED YET]

Options:
    -h, --help                print this text and exit
        --license             print license and exit
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
Licensed under GNU GPL v3. <$LICENSE_LINK>
```

Here's some usage examples:

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


To avoid having to write your master password all the time, I've provided a script that can be sourced in your current terminal session, that sets an environment variable SHELLSEC_MASTERPASS to the password you input when asked it. This is somewhat dangerous, however, because it can reveal your master password in cleartext to anyone trying to echo it on the same terminal. I think this could only happen if someone is PHYSICALLY at your computer, with it unlocked. Please message me if I'm wrong and send in a pull request or open an issue to fix it! :)

To use it simply ``$ source shellsec-setkey`` or ``$ . shellsec-setkey``
