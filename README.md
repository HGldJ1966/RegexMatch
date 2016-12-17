#RegexMatch.hs

Haskell port of Rob Pike's ~30 line recursive regular expression parser from [*The Practice of Programming*](https://www.amazon.com/Practice-Programming-Addison-Wesley-Professional-Computing/dp/020161586X) as well as Brian Kernighan's contribution to the anthology [*Beautiful Code*](http://www.cs.princeton.edu/courses/archive/spr09/cos333/beautiful.html).

This made for a great exercise as I was learning Haskell since the the original version relied entirely on idiosyncracies in C: pointer arithmetic and booleans returning ints. Rather than using conditionals, the recursion seemed ideal to replicate through pattern matching: resulting in code that was even terser, while handling the same set of expressions. Whether I'll revisit in the future to extend to a fuller subset of POSIX regex stands to be seen; Haskell has such strong parsing libraries, it likely may make more sense to go that route.

Currently this supports the following expressions, as does Pike's original version:

*  c    matches any literal character c
*  .    matches any single character
*  ^    matches the beginning of the input string
*  $    matches the end of the input string
*  *    matches zero or more occurrences of the previous character

It runs simply as a command line tool, returning `True` or `False` depending on whether a single match is found:

```
> ./Regex "x.z$" "lmnopxyz"
True
```