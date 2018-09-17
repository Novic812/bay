Syntax scheme
=============

`#` fail
--------

- ANSI Art
- Assembly Script
- AutoHotKey Script
- AutoIt3 Script
- Batch Files
- C# Source Code
- C/C++ Source Code
- CSS Style Sheets
- Default Text
- Inno Setup Script
- Java Source Code
- JavaScript
- LaTeX Files
- Lua Script
- Markdown
- Pascal Source Code
- Resource Script
- VBScript
- VHDL
- Web Source Code
- XML Document

`\"` fail
---------

- AviSynth Script
- Cmake Script
- NSIS Script
- PowerShell Script
- Visual Basic

`break` fail
------------

- Apache Config Files
- Coffeescript
- SQL Query

`"z"` fail
----------

- Configuration File
- Diff Files

`9` fail
--------

- Makefiles
- YAML

`*`, `/=` fail
--------------

Perl Script

`continue` fail
---------------

Ruby Script

Better
------

script | `$9` | `exit` | `function` | `in` | `print` | `printf`
-------|------|--------|------------|------|---------|---------
Python | no   | no     | no         | yes  | yes     | no
Shell  | yes  | yes    | yes        | no   | yes     | yes
Tcl    | yes  | yes    | no         | no   | no      | no
