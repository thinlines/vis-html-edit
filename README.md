Here's a basic, buggy HTML tag auto-completer for [vis][2]. It was inspired
by [this answer][1] on Stack Overflow. 

[1]: https://stackoverflow.com/a/134990 "How can one close HTML tags in Vim quickly?—Stack Overflow"

## Features

- Complete an arbitrary tag with `>` and replace the cursor in the middle
  of the tag
- with a second closing bracket (typing another `>`&mdash;"double-closing"),
  push the closing tag onto the next line and indent

## Bugs and issues

- [x] ~~The cursor isn't placed correctly if a tag is completed on the first
      line of a brand new file~~
- [x] ~~It doesn't know anything about self-closing tags~~
- [ ] If you add some properties to the tag before closing it, the properties
      will be included in the closing tag, too
- [x] ~~Double-closing tags only places the cursor correctly if the line isn't
      already indented~~
- [x] ~~It doesn't check the syntax of the file to see if it's an html
      file&mdash;it's just always on~~
- [ ] Hitting backspace doesn't delete the tag if it was just closed
- [ ] Using this in a macro may cause unexpected results
- [ ] And more, I'm sure

I created this because I really like the [vis editor][2] and I want to
contribute what I can to its development, however small that contribution
may be. I also write HTML most of the time, so I wanted to make something
that would save me a little typing. I plan to fix some of the bugs listed
above to make it better to use in real coding.

[2]: https://github.com/martanne/vis "Vis editor on Github"
