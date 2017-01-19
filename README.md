## Remove Spaces From Copied URL Automatically (Neovim)

There are some unfortunate situations where you might have whitespace in
your copied URL. For example:

* You are in a `:term` split and have a long, wrapped URL. You copy it.
  However, the URL now has newline characters in it and might not work
  when pasted into a browser.
* You might miss your selection, accidentally copying some whitespace

This plugin only works in neovim because it provides the TextYankPost
event. Without this event, you have to change your yank bindings. That
quickly gets unpleasant when you have several plugins that do yank
related stuff.

Requires `+ruby` because regex is hard.

### MIT LICENSE

Copyright (c) 2017 Andrei Thorp

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
