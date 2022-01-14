```
+-----------------------------------------------------------------+
|  ______ _     _ _______ _       _        ______ _______ _______ |
| / _____) |   | |  _____) |     | |      / _____)  _____|  _____)|
|( (____ | |___| | |___  | |     | |     ( (____ | |___  | |      |
| \____ \|  ___  |  ___) | |     | |      \____ \|  ___) | |      |
| _____) ) |   | | |_____| |_____| |_____ _____) ) |_____| |_____ |
|(______/|_|   |_|_______)_______)_______)______/|_______)_______)|
+-----------------------------------------------------------------+
|        Bash tool to generate and manage secure passwords        | 
|                                                                 |
|                  https://github.com/Costinteo                   |
|                           GNU GPL v3                            |
+-----------------------------------------------------------------+
```

# shellsec

Simple security tool to generate and manage secure passwords. Can be used a simplistic CLI-based local password manager.

## Requirements

```
bash
tr
grep # hopefully will replace with pure bash alternative
openssl
```

## Usage

```
Usage: shellsec [OPTIONS]...
Bash tool to generate and manage secure passwords.
Run without arguments for interactive mode.
Options:
    -h, --help                print this text and exit
        --license             print license and exit
        --no-color            suppress colored output
    -p, --pass  <LEN>         generate random pass with <LEN> chars
    -s, --store <PLATFORM>    store pass for <PLATFORM>
    -l, --load  <PLATFORM>    load pass for <PLATFORM>
    -a, --all-platforms       decrypt and print all platforms
    -c, --copy                copy to clipboard generated / requested pass
        --print               print pass after generated
The script is written by Costinteo. <https://github.com/Costinteo>
Licensed under GNU GPL v3. <https://www.gnu.org/licenses/gpl-3.0.txt>
```

Work in progress...
