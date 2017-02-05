# Improved(?) Pathfinder character sheet for PCGen

This contains xslt for a [Pathfinder](http://paizo.com/pathfinder)
character sheet that is an improvement (at least in my eyes) over the
defaults that come with [PCGen](http://pcgen.org). It is based on
one of the default sheets.

It includes some changes that are controlled by system properties, so
provides a ruby script that hides some of that from you, and runs
pcgen in batch mode to generate a pdf.

## Usage

```
run.rb --character some_character.pcg --weapons-first-page 3 --complex-melee --unchained-monk --simple-descriptions  --pcgen path/to/pcgen/dir/ --output some_character.pdf
```

or with shorthand options:

```
run.rb -c some_character.pcg -w 3 -C -u -s -p path/to/pcgen/dir/ -o some_character.pdf
```

The options are:

* `-c`, `--character`: path to the pcg file for the character (required)
* `-o`, `--output`: path to pdf output file (default: `./out.pdf`)
* `-p`, `--pcgen`: path to pcgen installation (default: `../pcgen/`)
* `-w`, `--weapons-first-page`: number of weapons to show on first page (default: 5)
* `-C`, `--complex-melee`: show two-weapon fighting tables for each melee weapon? (default: off)
* `-u`, `--unchained-monk`: use Unchained Monk flurry/BAB rules? (default: off)
* `-s`, `--simple-descriptions`: don't show descriptions for Traits/Feats/Special Attacks/Special Abilities (default: off)

# License

Licensed under the GNU Lesser General Public License, v2.1. See LICENSE.txt for details.
