Here's a basic, buggy implementation of xmledit for vim. It was inspired
by [this answer][1] on Stack Overflow. Currently, The cursor isn't placed
right if the first thing you enter into the file is a tag which this
plugin completes.

[1]: https://stackoverflow.com/a/134990 "How can one close HTML tags in Vim quickly?—Stack Overflow"

## Features

- Complete an arbitrary tag with `>` and replace the cursor in the middle
  of the tag
- with a second closing bracket (typing another `>`---"double-closing"),
  push the closing tag onto the next line and indent

## Bugs and issues

- It doesn't know anything about self-closing tags
- If you add some properties to the tag before closing it, the properties
  will be included in the closing tag, too
- Double-closing tags only places the cursor correctly if the line isn't
  already indented

It's a nice start, though. It could already be useful to someone,
including me.
