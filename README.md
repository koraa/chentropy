Chentropy
=========

*CharEntropy*

This is a simple programm that outputs lines between 5-40 chars
and normalizes the input chars to be one of *[a-zA-Z0-9]*.

STDIN is expected to be a source of randomness. 
Meaningfull content from STDIN will be ignored.

Examples
========

Print chars using /dev/urandom as rnd source

    $ chentropy </dev/urandom

Limit to 20 lines

    $ chentropy </dev/urandom | head -n 20

Create 30 random empty files

    $ chentropy </dev/urandom | head -n 30 | xargs touch

Create 200 random files with 20 lines of random content
    
    $ chentropy </dev/urandom| head -n 200 | while read f; do chentropy </dev/urandom|head -n 20 > "$f"; done

See
===

* *strings* - Remove special chars from stream
* *awk*     - Text processing language
* *sed*     - Text processing language

TODO
====

*Bugs*

* Fix GDB target

*Features*

* Use some arg engine?

* Add args for minl/maxl
* Add args for linereak-char
* Add args for charlib
    * Support character classes


