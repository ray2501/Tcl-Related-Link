Tcl-Related-Link
=====

這是一個我個人收集的 [Tcl](https://www.tcl.tk/) 相關連結網頁。目的是我需要某個連結的時候，可以很快的找到。


Tcl
=====

## [Summary of Tcl language syntax](https://www.tcl.tk/man/tcl8.6/TclCmd/Tcl.htm)

Tcl 說明文件中關於語法的說明，總共有 12 條規則。

## [Everything is a string](https://wiki.tcl.tk/3018)

The more precise meaning of Everything is a string is every value is a string.
This is one of the central features of Tcl.


官網與相關文件
=====

* [Tcl Developer Site](https://www.tcl.tk/)
* [Tcler's Wiki](https://wiki.tcl.tk/)
* [tcltk.free.fr](http://tcltk.free.fr/) - English language Tcl web site in France
* [Tcl TIP Collection](https://core.tcl.tk/tips/doc/trunk/index.md)
* [comp.lang.tcl](https://groups.google.com/forum/#!forum/comp.lang.tcl)
* [Tcl Source Code (core package)](http://core.tcl.tk/)
* [Tcl Style Guide](https://wiki.tcl.tk/708)
* [Tcl Threading Model](https://www.tcl.tk/doc/howto/thread_model.html)
* [TkDocs](https://tkdocs.com/index.html)
* [Official library of extensions](https://wiki.tcl.tk/30)
* [Great Unified Tcl/Tk Extension Repository](http://core.tcl.tk/jenglish/gutter/)
* [RosettaCode: Tcl](http://rosettacode.org/wiki/Category:Tcl)
* [Example Scripts Everybody Should Have](https://wiki.tcl.tk/460)
* [Tcl on Windows FAQ](https://www.tcl.tk/faq/tclwin.htm)
* [Expect FAQ](https://wiki.tcl.tk/11581)


Contents
=====

* [Books](#books)
* [Tcl distributions](#tcl-distributions)
  * [Source](#source)
  * [Binary for Windows](#binary-for-windows)
  * [TclKits](#tclkits)
* [Editor and IDE](#editor-and-ide)
* [Version control](#version-control)
* [Issue tracking](#issue-tracking)
* [Compiler](#compiler)
* [Debugger](#debugger)
* [Code Analysis](#code-analysis)
* [Build System](#build-system)
* [Package system](#package-system)
* [Wrap tool](#wrap-tool)
* [Tests](#tests)
* [Standard Libraries](#standard-libraries)
* [Collection and Tool box](#collection-and-tool-box)
* [Object-oriented](#object-oriented)
* [Functional Programming](#functional-programming)
* [CUI](#cui)
* [Tk](#tk)
* [GUI toolkit](#gui-toolkit)
* [Graphics and Images](#graphics-and-images)
* [Audio and Sound](#audio-and-sound)
* [Video](#video)
* [Channel and file system](#channel-and-file-system)
* [Command line](#command-line)
* [Compression](#compression)
* [Concurrency](#concurrency)
  * [Distributed computation](#distributed-computation)
  * [Parallel computing](#parallel-computing)
* [Cryptography](#cryptography)
* [CSV](#csv)
* [Database](#database)
* [Data type](#data-type)
* [Data struct](#data-struct)
* [Diff](#diff)
* [Documentation Tools](#documentation-tools)
* [Internationalization and localization](#internationalization-and-localization)
* [JSON](#json)
* [Fileutils](#fileutils)
* [Geography](#geography)
* [Networking](#networking)
* [Numeric processing](#numeric-processing)
* [PDF](#pdf)
* [Procedure Tools](#procedure-tools)
* [Text and string](#text-and-string)
* [Time](#time)
* [Web and Http](#web-and-http)
  * [CSS](#css)
  * [JSMIN](#jsmin)
* [Templating language](#templating-language)
  * [CommonMark and Markdown](#commonmark-and-markdown)
  * [Mustache](#mustache)
* [XML](#xml)
* [YAML](#yaml)
* [Container](#container)
  * [Docker](#docker)
* [Platform](#platform)
  * [Apple Macintosh](#apple-macintosh)
  * [Unix-specific](#unix-specific)
  * [Windows-specific](#windows-specific)
  * [Android](#android)
  * [Emscripten](#emscripten)
  * [Browser](#browser)
* [Language](#language)
  * [CSharp and dotNET](#csharp-and-dotnet)
  * [Java](#java)
  * [C](#c)
  * [CPP](#cpp)
  * [D](#d)
  * [Erlang](#erlang)
  * [Forth](#forth)
  * [Fortran](#fortran)
  * [JavaScript](#javascript)
  * [GO](#go)
  * [Python](#python)
  * [R](#r)
  * [Rust](#rust)
  * [Swift](#swift)
* [Hardware](#hardware)
  * [Arduino](#arduino)
  * [Raspberry Pi](#raspberry-pi)
* [Related Project](#related-project)
* [Write a Tcl extension](#write-a-tcl-extension)
* [Tools](#tools)
* [Misc](#misc)


## Books

* [TCLWISE](http://www.invece.org/tclwise/)
* [Tcl Wikibook](https://en.wikibooks.org/wiki/Tcl_Programming)
* [Object Oriented Programming in Tcl](http://www.magicsplat.com/articles/oo.html)
* [The Tcl Database Connectivity interface](http://www.magicsplat.com/articles/tdbc.html)
* [Tcl Programming for Windows](http://www.magicsplat.com/book/)
* [Tcl/Tk: A Developer's Guide](https://wiki.tcl.tk/9149)
* [Tcl for Web Nerds](http://philip.greenspun.com/tcl/)
* [Practical Programming in Tcl and Tk](http://www.beedub.com/book/)
* [Tcl and the Tk Toolkit (2nd Edition)](http://www.tcltk-book.com/): Updated for Tcl/Tk 8.5
* [Tcl/Tk 8.5 Programming Cookbook](https://wiki.tcl.tk/28075)
* [Tcl 8.5 Network Programming](https://wiki.tcl.tk/26647)
* [The Tcl Programming Language](https://wiki.tcl.tk/48868): Book for Tcl (8.6)

And check [Book](https://wiki.tcl.tk/3334).


## Tcl Distributions

### Source

* [Sources](https://www.tcl.tk/software/tcltk/download.html)

### Binary for Windows

* [ActiveTcl](http://www.activestate.com/activetcl): A [Batteries Included](https://wiki.tcl.tk/2352) binary Distribution
* [BAWT-Tcl](http://www.bawt.tcl3d.org/download.html#tclbi) - Batteries Included Setup Program
* [IronTcl](https://www.irontcl.com/) - is a binary distribution of Tcl and Tk.
* [Magicsplat Tcl/Tk for Windows](http://www.magicsplat.com/tcl-installer/index.html)
* [tombert's tcltk](https://bitbucket.org/tombert/tcltk) - Compiled under W7 using MinGW 64bit

### TclKits

* [TclKits](http://tclkits.rkeene.org/fossil/wiki/Downloads)
* [SDX](https://wiki.tcl.tk/3411)


## Editor and IDE

* [VIM](http://www.vim.org/)
* [Notepad++](https://notepad-plus-plus.org/zh/) - For Microsoft Windows environment, supports Tcl syntax highlighting
* [kate](https://kate-editor.org/) - Supports Tcl syntax highlighting, Symbol Viewer Plugin
* [Komodo Edit](https://www.activestate.com/komodo-ide/downloads/edit)
* [Eclipse](http://www.eclipse.org/) and [Eclipse Dynamic Languages Toolkit](https://projects.eclipse.org/projects/technology.dltk). DLTK provides Tcl support.
* [Visual Studio Code](https://code.visualstudio.com/) and [TCL Language Support for Visual Studio Code](https://github.com/rashwell/tcl), [Tcl for Visual Studio Code](https://github.com/sleutho/tcl)
* [Tloona](https://github.com/ecky-l/tloona) - A Tcl/Tk IDE
* [RamDebugger](http://www.compassis.com/ramdebugger/) - a debugger and IDE for TCL-TK (require tcllib, tklib, TkImg and TkTreeCtrl)

Useful info:

* [Tcl Editors](https://wiki.tcl.tk/1184)
* [IDE](https://wiki.tcl.tk/998)

And TDK (Tcl Dev Kit) is open sourced by ActiveState, check

* [Tcl Dev Kit](https://github.com/ActiveState/tdk) and [Tcl Dev Kit](https://wiki.tcl.tk/3960)


## Version control

* [Fossil SCM](https://www.fossil-scm.org/) - a distributed version control system,
bug tracking system and wiki software server
* [Git](https://git-scm.com/) and the Git repository browser [gitk](https://git-scm.com/docs/gitk)
* [TkCVS](http://www.twobarleycorns.net/tkcvs.html)


## Issue tracking

* [tcl-fogbugz-api](https://github.com/flightaware/tcl-fogbugz-api) - Tcl package for using the FogBugz API
* [tcl-jira-api](https://github.com/flightaware/tcl-jira-api) - Tcl package to interface with the JIRA REST API


## Compiler

* [Tcl extension for the LLVM C API](https://github.com/jdc8/llvmtcl)
* [tclquadcode](https://wiki.tcl.tk/40985) - Experimental Tcl Compiler, requires Tcl 8.6 and llvmtcl.
And [Godzilla Guides to tclquadcode](https://wiki.tcl.tk/54793).


## Debugger

* [TclProDebug](https://github.com/flightaware/TclProDebug) - Upgrade of debugger from classic [TclPro](https://wiki.tcl.tk/365) to Tcl 8.5+
* [Tclgdb](https://github.com/flightaware/tclgdb) - Use gdb breakpoints for Tcl source with Tcl_CreateTrace
* [lttngtcl](https://github.com/flightaware/lttngtcl) - LTTng trace provider which connects to Tcl_CreateTrace
* [ddt](https://github.com/Drolla/ddt) - Dynamic Debugging for Tcl


## Code Analysis

[info](https://www.tcl.tk/man/tcl/TclCmd/info.htm) is a built-in command,
provides information about the state of a Tcl interpreter. With info,
you can find out about your Tcl environment.

* TclParser - You can get it from [TclProDebug](https://github.com/flightaware/TclProDebug),
at lib/tclparser folder
* [Nagelfar](http://nagelfar.sourceforge.net/) - to read a Tcl program and provide static syntax analysis,
and [Nagelfar-Vim](https://wiki.tcl.tk/28746)
* [tclchecker](https://wiki.tcl.tk/11245) - a component of Tcl Dev Kit,
is a fork of [procheck](https://wiki.tcl.tk/3163), the static analysis tool.

And check [Scripted Parsing](https://wiki.tcl.tk/4359).


## Build System

* [BAWT](http://www.bawt.tcl3d.org/) - Tcl based configurable framework for automatically
building C/C++ based software libraries from source code
* [kitgen build system](https://sourceforge.net/projects/kbskit/) - Framework to generate
TclkitLite executables, compile Tcl packages and build kit files for different operating systems
* [KitCreator](http://kitcreator.rkeene.org/fossil/home) - a simple build system for creating a Tclkit


## Package system

* [teapot](https://github.com/ActiveState/teapot) - TEA Package Management system built by ActiveState
* [teaget](https://wiki.tcl.tk/24765) - is a tcl only script that can be used as a command line utility to retrieve packages

However, ActiveTcl 8.6.6 does not include teaget this tool (when I test last time).

And you can check [Debian packages for Tcl/Tk](https://wiki.tcl.tk/11333).
I think most Linux distributions include some Tcl/Tk packages.


## Wrap tool

* [freeWrap](http://freewrap.sourceforge.net/): FreeWrap distributions are freely available
for Linux and Windows operating systems.
* [tclexecomp](https://sourceforge.net/projects/tclexecomp/)


## Tests

* [tcltest](https://wiki.tcl.tk/1502) - a package distributed with Tcl, provides a framework
for writing and executing program tests.


## Standard Libraries

Tcllib is a distribution of several packages for Tcl, all written entirely in Tcl, useful in a broad variety of areas.
A tklib module also exists under the tcllib project, which contains modules that depend on Tk.

* [Tcllib](https://core.tcl.tk/tcllib/doc/trunk/embedded/index.html)
* [Tklib](https://core.tcl.tk/tklib/home)

[tcllibc](https://wiki.tcl.tk/18382)  is a term used to refer to the parts of Tcllib written in C.
Some packages in Tcllib provide two implementations, one written in pure Tcl for compatibility and
low installation overhead and one written in C for speed.
You need [Critcl](http://andreas-kupries.github.io/critcl/) if you want to build tclllibc.


## Collection and Tool box

* [ToclBox](https://github.com/efrecon/toclbox) -  A ToolBox for Tcl
* [chiark-tcl](https://wiki.tcl.tk/48610) - a collection of tcl extensions and bindings to useful libraries,
include adns, tinycdb, parts of the nettle crypto library and more)
* [tcl-modules](https://github.com/Dash-OS/tcl-modules) - A collection of Pure-Tcl Packages & Utilities
* [ycl](http://www.chiselapp.com/user/pooryorick/repository/ycl/) - short for Yorick's Computing tooLkit,
is PYK's collection of miscellaneous procedures and programs.
* [til](https://github.com/efrecon/til) - The Tcl ICE Library
* [tcl-hacks](https://chiselapp.com/user/aspect/repository/tcl-hacks/index) - A repository of useful
and/or interesting hacks in Tcl
* [tclapps](https://github.com/tcltk/tclapps): a suite of small applications for Tcl useful as
examples and in regular use to a large collection of Tcl programmers
* [Sugar](https://wiki.tcl.tk/11155) - a macro system for the Tcl programming language,
and [Sugar macros collection](https://wiki.tcl.tk/11168)
* [tcl-gen](https://github.com/rbrogan/tcl-gen) - General Utilities for Tcl


## Object-oriented

TclOO is both a toolkit for creating object systems, and an object system in its own right.
As of Tcl 8.6, is part of the core distribution.

* [TclOO @ TIP #257](https://core.tcl.tk/tips/doc/trunk/tip/257.md) and [TclOO Tricks](https://wiki.tcl.tk/21595)
* [incr Tcl](http://incrtcl.sourceforge.net/)
* [Next Scripting Framework](https://next-scripting.org/xowiki/): A descendant of XOTcl
* [snit](http://core.tcl.tk/jenglish/gutter/packages/snit.html) - Snit is a pure-Tcl object and megawidget framework
* [self](https://github.com/mpcjanssen/self) - [SELF extension](https://wiki.tcl.tk/17100),
a Tcl package by the same name that was inspired by Self


## Functional Programming

* [tcllib lambda](https://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/lambda/lambda.html) - Utility commands for anonymous procedures
* [control::functional](http://dev.crypt.co.za/incubator/doc/tcltm/control/functional.wiki) - Enhanced
support for functional programming in Tcl, with implementations of some common higher-order functions
* [fptools](https://wiki.tcl.tk/41349) - A grab bag of functions that can be useful for FP
* [tcl-f](https://github.com/nektomk/tcl-f) - Provides loadable Tcl extension for programming
in functional manner
* [underscore-tcl](https://github.com/arthurschreiber/underscore-tcl) - Functional programming utilities
for Tcl

As with many things, Tcl is rather unique in this area.
Commands themselves can not be passed as arguments to other commands,
but their names can, which provides something very similar to first-class functions.
Additionally, [apply](https://www.tcl.tk/man/tcl/TclCmd/apply.htm) can be used to
interpret a value as a function and evaluate it,
providing the equivalent of lambda functions.


## CUI

A Character-based User Interface is a user interface that features full-screen
cursor manipulations to emulate forms, etc.

The abbreviation TUI (text-based user interface) is sometimes used to describe
the same thing.

[curses](https://wiki.tcl.tk/9690) is perhaps the most widely-known CUI.

* [Minimalist Curses](https://wiki.tcl.tk/10877) - A "minimalist" tcl package for interfacing to curses.
And [my test](https://github.com/ray2501/tcl-curses).


## Tk

Tk is a graphical toolkit for Tcl.
It allows you to develop graphical applications that run on Windows, Linux,
MacOS X and many other platforms.

Tk is equally available as a windowing toolkit for Tcl, Ruby, Perl, Python.
[TkDocs](http://www.tkdocs.com/) has the best overview of how this compares.

* [Tk](https://wiki.tcl.tk/477)
* [Ttk](https://wiki.tcl.tk/14796) - Implementation of the Tk theming engine to provide
native look and feel widgets, now included in Tk 8.5

and check:

* [Tk widget and extension](https://github.com/ray2501/Tcl-Related-Link/blob/master/Tk.md)


## GUI toolkit

* [Gnocl](https://sites.google.com/site/gnocltclgtk/): Tcl binding to GTK
* [TclFltk](https://sourceforge.net/projects/tclfltk/): a Tcl binding for the Fast Light Tool Kit portable GUI development environment


## Graphics and Images

* [tkImg](https://sourceforge.net/projects/tkimg/) - Additional image formats
* [tksvg](https://github.com/auriocus/tksvg) - An extension for Tk to read SVG images based on nanosvg
* [Imgtools](http://tkimgtools.sourceforge.net/index.html) - manipulate Tk photo images
* [CRIMP](https://core.tcl.tk/akupries/crimp/home) - C Raster Image Manipulation Package
* [PhotoResize](https://github.com/auriocus/PhotoResize) - A single-purpose extension for Tcl to resize/resample photo images 
* [tcl.gd](https://github.com/flightaware/tcl.gd) - Feature-complete Tcl interface to
GD graphics drawing library
* [tclepeg](https://github.com/dzach/tclepeg) - provide a tcl extension to the epeg thumbnailing library
* [tclimage](https://sourceforge.net/projects/tclimage/) - A Tcl library extension for managing virtually
any kind of images
* [tclmagick](http://tclmagick.sourceforge.net/) - Tcl and Tk Interfaces to
GraphicsMagick and ImageMagick
* [pure-tcl BMP reader/writer](https://bitbucket.org/smh377/bmp)
* [Pure Tcl JPEG decoder](https://github.com/dbohdan/ptjd) - A single-file pure Tcl baseline JPEG
decoder library
* [tcllib exif](https://wiki.tcl.tk/3055) - to extract and parse EXIF fields from digital images
* [tklib plotchart](https://wiki.tcl.tk/11265)
* [ukaz](https://github.com/auriocus/ukaz) - Graph widget in pure Tcl/Tk

For handle image formats, you can check [tkImg](https://sourceforge.net/projects/tkimg/).
PNG is also built-in support in Tcl/Tk 8.6.0 (and above version).

Useful info:

* [3D animation on canvas with Gnuplot](https://wiki.tcl.tk/13555)
* [Canvas Object Movement Example](https://wiki.tcl.tk/26978)
* [Graphics with Tcl](https://wiki.tcl.tk/2389)
* [Webcams / Digital Cameras](https://wiki.tcl.tk/14314)

For barcode:

* [tzint](https://sourceforge.net/projects/tclsnippets/files/tzint/) - tcl package for libzint barcode encoding library (no Tk needed)

And [Barcode FAQs](http://www.azalea.com/FAQ/) has valuable information.

And my project:

* [tclqrencode](https://sites.google.com/site/ray2501/tclqrencode) - Tcl interface for libqrencode
* [tcl-cairo](https://github.com/ray2501/tcl-cairo) - Tcl bindings for Cairo library,
learn from [tclcairo](https://wiki.tcl.tk/29305)


## Audio and Sound

* [Snack](http://www.speech.kth.se/snack/) and check [Here](https://wiki.tcl.tk/2647)
* [SDL_mixer bindings for Tcl](http://sqlitestudio.pl/tclmixer/) - TclMixer
* [TclJACK](https://github.com/screwtop/TclJACK) - A Tcl extension for interacting with
the JACK Audio Connection Kit library (jacklib)
* [tclmidi](https://github.com/jdc8/tclmidi) - a package to work with Midi files

And volume control:

* [Linux: volume control](https://wiki.tcl.tk/48348)
* [Mac OS X: volume control](https://wiki.tcl.tk/48551)
* [Windows: volume control](https://wiki.tcl.tk/48338)
* [Windows XP: volume control](https://wiki.tcl.tk/48350)

Now available on [SourceForge](https://sourceforge.net/projects/volume-controls-cmdline/files/).

Useful info:

* [Audio Edit Utility](https://wiki.tcl.tk/40321) - a front-end for the 'ffmpeg' command
* [VLC Tcl Extension](https://wiki.tcl.tk/48382)
* [MPV Tcl Extension](https://wiki.tcl.tk/55174) - a Tcl interface to the MPV audio player, using libmpv

And my projects:

* [tcllibao](https://github.com/ray2501/tcllibao) - Tcl bindings for libao
* [tpulsesimple](https://github.com/ray2501/tpulsesimple) - Tcl bindings for PulseAudio simple API
* [tclopenal](https://github.com/ray2501/tclopenal) - Tcl bindings for OpenAL (open audio library)
* [tclsndfile](https://github.com/ray2501/tclsndfile) - Tcl bindings for libsndfile
* [tclopusfile](https://github.com/ray2501/tclopusfile) - Tcl bindings for Opusfile library
* [tclmpg123](https://github.com/ray2501/tclmpg123) - Tcl bindings for libmpg123 
* [tcltaglib](https://sites.google.com/site/ray2501/tcltaglib) - Tcl interface
for taglib (Abstract API only)
* [tclmixer](https://github.com/ray2501/tclmixer) - source code is from SDL_mixer bindings for Tcl, try to link SDL2


## Video

* [tkvideo](http://www.patthoyts.tk/tkvideo/) - A video widget for use with Windows
* [tkmpeg](https://github.com/wjoye/tkmpeg) - TK MPEG 1 encoder, Tcl/Tk 8.5/8.6 TEA compatible

Useful info:

* [Using Tcl/Tk in Multimedia Applications](https://wiki.tcl.tk/864)
* [Movie Edit Utility](https://wiki.tcl.tk/40305) - a front-end for the 'ffmpeg' command
* [SnitMPlayer](https://wiki.tcl.tk/48588) - Widget wrapper for the mplayer media application

And my project:

* [tkvlc](https://github.com/ray2501/tkvlc) - A demo to embed libVLC to Tk toolkit widget


## Channel and file system

* [chan](https://www.tcl.tk/man/tcl/TclCmd/chan.htm) - a built-in Tcl command, manipulates channels
* [TclVfs](https://core.tcl.tk/tclvfs/index)
* [tcl-fuse](https://sourceforge.net/projects/tcl-fuse/) - A Tcl interface to the linux kernel's FUSE subsystem
* [di Tcl extension](https://wiki.tcl.tk/42227) - Filesystem Usage/Information.
The di program now provides a Tcl extension starting with version 4.39
* [Memchan](http://memchan.sourceforge.net/) - In-memory channels for Tcl,
and deprecated by tcllib's tcl::chan::memchan, which is available for Tcl >= 8.5.
* [Trf](http://tcltrf.sourceforge.net/) - is a Tcl extension based upon the principle of stacked channels.
Stacked channels is available at the Tcl-script level (after 8.5).
See the [chan](https://wiki.tcl.tk/15111) command for details.
* [trofs](http://math.nist.gov/~DPorter/tcltk/trofs/) - Tcl Read-Only Filesystem
* [tserialport](https://sourceforge.net/projects/tclsnippets/files/tserialport/) - tcl package for library libserialport


## Command line

* [Tcllib cmdline](http://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/cmdline/cmdline.html) 
Procedures to process command lines and options
* [getopt.tcl](https://github.com/tcler/getopt.tcl) - A getopt implementation of tcl
that compat with GNU getopt
* [tabulate](https://wiki.tcl.tk/41682) - a command line utility that converts standard input
into pretty-printed tables

And useful info:

* [command options](https://wiki.tcl.tk/1730) - Tcler's Wiki info


## Compression

* [zlib](https://core.tcl.tk/tips/doc/trunk/tip/234.md) - Core support for zlib compression
* [bztcl](http://download.gna.org/bztcl/) and [wiki page](https://wiki.tcl.tk/9661) - wrapper for the
BZip2 compression library
* [bz2:compress and bz2:decompress](https://wiki.tcl.tk/4218)
* [tclzvfs](https://github.com/wjoye/tclzvfs) - TCL Zip Virtual File System, Tcl 8.5/8.6 TEA compatible
* [tcllib tar](http://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/tar/tar.html) - Tar file creation, extraction & manipulation
* [tcllib zipfile::decode](http://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/zip/decode.html), 
[tcllib zipfile::encode](http://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/zip/encode.html),
[tcllib zipfile::mkzip](http://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/zip/mkzip.html): Access to zip archives, generation of zip archives and build a zip archive
* [LZ4](https://wiki.tcl.tk/48789)
* [Zstandard](https://wiki.tcl.tk/48788) - libzstd bindings for Tcl through Critcl
* [Brotli compression format](https://wiki.tcl.tk/48939) - Uses Critcl

And my project:

* [tcl.snappy](https://github.com/ray2501/tcl.snappy) - Tcl wrapper for snappy library
* [Tcl-lzf](https://sites.google.com/site/ray2501/tcl-lzf) - Tcl interface to the LibLZF Library
* [tcl-archive](https://github.com/ray2501/tcl-archive) - A Tcl wrapper for LibArchive


## Concurrency

* [Thread](http://core.tcl.tk/thread) - brings native thread capabilities to Tcl
* [tcllib Coroutine utilities](http://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/coroutine/tcllib_coroutine.html)
* [csp - Golang inspired concurrency library for Tcl](https://securitykiss.com/resources/tutorials/csp_project/index.php)
* [tcl-promise](http://sourceforge.net/projects/tcl-promise/) - Promises are concurrency primitives that
simplify asynchronous programming by allowing you to write the code in a sequential style
* [tclfiber](https://sourceforge.net/projects/tclfiber/) - Co-routine based multitasking package for Tcl

And useful info:

* [Threads & callbacks](https://wiki.tcl.tk/15342)

### Distributed computation

Distributed Computation is a form of concurrent computing in
which multiple programs, perhaps running on different processors,
which may be remote, communicate to accomplish tasks.

* [TclMPI: Tcl bindings for MPI](https://sites.google.com/site/akohlmey/software/tclmpi)
* [gearman-tcl](https://github.com/noyesno/gearman-tcl)

And check [Distributed computation](https://wiki.tcl.tk/16662).

### Parallel computing

* [TclOpenCL](https://github.com/alpha123/TclOpenCL) - VERY WIP [OpenCL](https://www.khronos.org/opencl/)
extension for Tcl


## Cryptography

* [Cryptkit](https://wiki.tcl.tk/13191) - a Tcl binding to the Cryptlib security toolkit
* [NaCl: Networking and Cryptography library](https://wiki.tcl.tk/47681)
* [TclTLS](https://core.tcl.tk/tcltls/index) - OpenSSL extension to Tcl


## CSV

* [tcllib csv](http://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/csv/csv.html) - a Tcllib
package, provides facilities for working with csv files
* [tclcsv](http://tclcsv.sourceforge.net/) - for reading and writing CSV format files


## Database

Tcl Database Connectivity (TDBC), part of Tcl 8.6,
is a common database access interface for Tcl scripts.

* [TDBC](http://tdbc.tcl.tk/index.cgi/index)

and check:

* [Tcl extension and Database](https://github.com/ray2501/Tcl-Related-Link/blob/master/database.md)


## Data type

* [Tarray](https://wiki.tcl.tk/37462) - implements a new Tcl collection data type - typed array
* [TclRal](http://chiselapp.com/user/mangoa01/repository/tclral/index) - Tcl Relational Algebra Library.
It introduces tuple and relation data types and a set of commands that operate on them.
* [tclvalue](https://github.com/auriocus/tclvalue) - An extension for Tcl 8.6+ to reflect the
Tcl_Obj API into the script level
* [AitCS](https://chiselapp.com/user/stwo/repository/AitCS/index) - Array in the Command's Shadow
* [Persistent arrays](https://wiki.tcl.tk/3469)

And check:

* [Abstract Data Types](https://wiki.tcl.tk/11450)


## Data struct

[struct](https://wiki.tcl.tk/783) - Documentation can be found for
various (tcllib) data structures.Provided structures, so far:
* graph
* list
* matrix
* pool
* prioqueue
* queue
* record
* set
* skiplist
* stack
* tree
* disjointset


## Diff

* [DiffUtilTcl](https://github.com/pspjuth/DiffUtilTcl) - A Tcl extension for diff utility functions,
like Longest Common Substring
* [Eskil](http://eskil.tcl.tk/index.html/doc/trunk/htdocs/index.html): A graphical view of file and
directory differences
* [tkdiff](https://sourceforge.net/projects/tkdiff/) - a graphical front end to the diff program

And check

* [diff in Tcl](https://wiki.tcl.tk/3108)


## Documentation Tools

* [doctools](https://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/doctools/doctools_lang_intro.html) - a set of tools is included so that
the tcllib author can write the documentation for his/her module in a format
agnostic manner, and then convert the documentation into Unix man pages, HTML,
and other formats.
* [Ruff!](http://woof.sourceforge.net/ruff.html) - generates reference documentation
for Tcl programs using runtime introspection.


## Fileutils

* [file](https://www.tcl.tk/man/tcl/TclCmd/file.htm) - Manipulate file names and attributes
* [glob](https://www.tcl.tk/man/tcl/TclCmd/glob.htm) - Return names of files that match patterns
* [tcllib fileutils](http://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/fileutil/fileutil.html) - Procedures implementing some file utilities


## Geography

* [tcllib nmea](http://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/nmea/nmea.html) - provides a standard
interface for writing software which recieves NMEA standard input data
* [proj4tcl](https://wiki.tcl.tk/41270) - a binding to the [proj4](http://proj4.org/) projection library,
requires critcl
* [Shapetcl](https://github.com/anoved/Shapetcl): Simple shapefile access for Tcl.

And useful info:

* [Category Geography](https://wiki.tcl.tk/16300)
* [GIS](https://wiki.tcl.tk/2459)


## Internationalization and localization

* [msgcat](https://www.tcl.tk/man/tcl/TclCmd/msgcat.htm) - a built-in manages Tcl message catalogs
for localising text


## JSON

* [Tcllib JSON](https://wiki.tcl.tk/40053)
* [yajl-tcl](https://wiki.tcl.tk/28240) - a Tcl binding for yajl (yet another json library)
* [tcl-json](https://github.com/bef/tcl-json)
* [rl_json](https://github.com/RubyLane/rl_json) - Extends Tcl with a json value type
and a command to manipulate json values directly, and [rl_json Extensions](https://wiki.tcl.tk/48276)
* [tcl-duktape](https://github.com/dbohdan/tcl-duktape) - Tcl bindings for Duktape, an embedded
JavaScript interpreter. It has JSON objects support.
* [tDOM](http://tdom.github.io/) adds a JSON parser after v0.9
* [tcljsonnet](https://github.com/ray2501/tcljsonnet)
* [JQ](https://wiki.tcl.tk/11630) - Wrapper for command-line tool, [JQ](https://stedolan.github.io/jq/manual/)
* [Playing XPath with JSON](https://wiki.tcl.tk/40865)


## Networking

* [socket](https://www.tcl.tk/man/tcl/TclCmd/socket.htm) - a built-in Tcl command,
opens a TCP network connection
* [Tcl UDP extension](https://core.tcl.tk/tcludp/index)
* [tcl-pcap](https://bitbucket.org/andrew_shadura/tcl-pcap) - Tcl extension that allows access
to the libpcap library
* [scotty](https://github.com/flightaware/scotty) - A Tcl extension for building network management (SNMP, ICMP, UDP, DNS) applications
* [tclnetsnmp](http://tcl.uk.to/) - netsnmp package for TCL 8.6
* [ecap-tcl](https://github.com/petasis/ecap-tcl) - An eCAP adapter for Tcl
* [Netinfo](https://wiki.tcl.tk/17493) - Protocol, service, network, host and ether info
* [Tcllib ldap](https://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/ldap/ldap.html) - LDAP client
* [Sensus ldap](https://web.archive.org/web/20130730202916/www.sensus.org/tcl/)
* [Tcllib ftp](https://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/ftp/ftp.html) - Client-side tcl implementation of the ftp protocol
* [socketservertcl](https://github.com/flightaware/socketservertcl) - Basic socketserver support in 
Tcl inspired by libancillary
* [tclcan](https://wiki.tcl.tk/55310) - Tcl interface to Linux SocketCAN

And useful info:

* [Modbus](https://wiki.tcl.tk/40888) - a de facto standard communication protocol and is now
a commonly available means of connecting industrial electronic devices


## Numeric processing

* [expr](https://www.tcl.tk/man/tcl/TclCmd/expr.htm) is a built-in Tcl command, evaluates an expression.
* [tcl::mathfunc](https://wiki.tcl.tk/20279) - The ::tcl::mathfunc namespace provides commands for
all the functions available in expr command.
* [Tcllib math](http://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/math/math.html) -
Tcl Math Library
* [LA](http://www.hume.com/la/) - The Hume Linear Algebra Tcl Package
* [mathemaTcl](https://wiki.tcl.tk/48535) - MathemaTcl is a collection of compiled extensions for Tcl,
each intended to solve a particular numerical problem
* [Mpexpr](http://mpexpr.sourceforge.net/) - Mpexpr is a multiple precision math package for Tcl
* [tensor](http://www.eecs.umich.edu/~mckay/computer/)
* [VecTcl](http://auriocus.github.io/VecTcl/)
* [Tcl-FFTW](https://github.com/mbarriault/Tcl-FFTW) - Tcl wrapper around FFTW

And useful info:

* [Additional math functions](https://wiki.tcl.tk/819)
* [Numerical Analysis in Tcl](https://wiki.tcl.tk/1272)


## PDF

* [Pdf4Tcl](https://sourceforge.net/projects/pdf4tcl/)
* [tclMuPdf](https://wiki.tcl.tk/48296) - a porting of the [MuPdf](http://mupdf.com/) framework


## Procedure Tools

* [parse_args](https://github.com/RubyLane/parse_args) - A fast argument parser
based on the patterns established by core Tcl commands like [lsort], [lsearch], [glob], [regex], etc.


## Text and string

* [encoding](https://www.tcl.tk/man/tcl8.6/TclCmd/encoding.htm) - a built-in command,
manages the conversion of text to and from particular encodings
* [regexp](https://www.tcl.tk/man/tcl/TclCmd/regexp.htm) - a built-in Tcl command,
matches a regular expression in a string
* [regsub](https://www.tcl.tk/man/tcl/TclCmd/regsub.htm) - a built-in Tcl command,
performs substitutions based on regular expression pattern matching
* [tcllib textutil](http://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/textutil/textutil.html)

And useful info:

* [Additional string functions](https://wiki.tcl.tk/44)
* [Regular Expressions](https://wiki.tcl.tk/396)

And my project:

* [regex_rez](https://github.com/ray2501/regex_rez) - Tcl bindings for RE2,
implement basic function - fullmatch, partialmatch, replace and globalrelpace
* [tcl-opencc](https://github.com/ray2501/tcl-opencc) - Tcl bindings for 
[OpenCC](https://github.com/BYVoid/OpenCC) (libopencc)

## Time

The [clock](https://www.tcl.tk/man/tcl8.6/TclCmd/clock.htm) command performs several operations
that obtain and manipulate values that represent times.

This command [time](https://www.tcl.tk/man/tcl8.6/TclCmd/time.htm) will call
the Tcl interpreter count times to evaluate script (or once if count is not specified).
It will then return a string of the form.

* [tclclockmod](https://github.com/sebres/tclclockmod) - Tcl clock extension: 
faster Tcl-module for the replacement of the standard "clock" ensemble of tcl


## Web and Http

* [http](https://www.tcl.tk/man/tcl/TclCmd/http.htm) - Client-side implementation of the HTTP/1.1 protocol
* [tclcurl](https://bitbucket.org/smh377/tclcurl) - Tcl wrapper for Curl. Curl got
HTTP/2 support when it's linked with the [nghttp2](https://nghttp2.org/) library in version 7.43.0.

And for html and CGI

* [Tcllib html](https://wiki.tcl.tk/38727) - provides tools to generate HTML programmatically (tcllib module)
* [htmlparse](https://wiki.tcl.tk/2204) - tcllib module
* [ncgi](https://wiki.tcl.tk/780) - provides commands that manipulate CGI values (tcllib module)
* [Tclgumbo](https://sites.google.com/site/ray2501/tclgumbo) - Tcl interface for gumbo library
* tDOM 9.0 as build option an interface to the gumbo HTML5 parser, which also digests almost
any other HTML. (--enable-html5)

And please check
[Web server and framework](https://github.com/ray2501/Tcl-Related-Link/blob/master/Web.md).

### CSS

* [tclsass](https://github.com/flightaware/tclsass) - Tcl interface to the libsass library

### JSMIN

* [JSMin-Tcl](https://github.com/flightaware/jsmin-tcl) - A Tcl JavaScript minifier


## Templating language

### CommonMark and Markdown

* [tcllib markdown](https://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/markdown/markdown.html)
* [caius markdown](https://github.com/tobijk/caius/tree/master/lib/markdown)
* [tcl-markdown](https://github.com/wduquette/tcl-markdown)
* [tcl-cmark](https://github.com/apnadkarni/tcl-cmark) - Tcl bindings to the cmark-gfm

And you can check [Markdown2Go](https://wiki.tcl.tk/48198).

### Mustache

* [mustache.tcl](https://github.com/ianka/mustache.tcl) - A Tcl implementation of the mustache templating language


## XML

* [tDOM](http://tdom.github.io/)
* [TclXML](http://tclxml.sourceforge.net/) and
you can check [here](https://github.com/wjoye/tclxml)
* [TclSOAP](http://tclsoap.sourceforge.net/) and [Wiki page](https://wiki.tcl.tk/1753) - supports
SOAP and XML-RPC, based on TclDOM (TclDOM is the DOM part of TclXML project).
[SCM Repositories](http://tclsoap.cvs.sourceforge.net/viewvc/tclsoap/tclsoap/) version (1.6.8)
switched TclDOM over to tDOM and add JSON-RPC support, changed by ActiveState.
* [Web Services for Tcl](http://core.tcl.tk/tclws/index)

And my project:

* [tclxqilla](https://github.com/ray2501/tclxqilla) - Tcl extension for XQilla library


## YAML

* [Tcllib YAML module](https://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/yaml/yaml.html)
* [TclYAML](http://chiselapp.com/user/andreas_kupries/repository/tclyaml/index) - provides a Tcl Binding to the [libyaml](http://pyyaml.org/wiki/LibYAML) library


## Container

Containers are a method of operating system virtualization that
allow you to run an application and its dependencies in
resource-isolated processes.

Study:
* [Open source Java projects: Docker](https://www.javaworld.com/article/3000781/development-tools/open-source-java-projects-docker.html)
* [docker-cheat-sheet](https://github.com/wsargent/docker-cheat-sheet)

### Docker

* [Ubuntu-based image](https://hub.docker.com/r/efrecon/tcl/)
* [mini-tcl](https://hub.docker.com/r/efrecon/mini-tcl/)
* [docker-alpine-tcl](https://github.com/GJRTimmer/docker-alpine-tcl)
* [docker-client](https://github.com/efrecon/docker-client)


## Platform

[exec](https://www.tcl.tk/man/tcl/TclCmd/exec.htm) is a built-in Tcl command, executes other programs.

The [::tcl_platform](https://wiki.tcl.tk/1649) is a global array holds useful data
concerning the platform on which a specific Tcl interpreter is running.


### Apple Macintosh

* [MacPorts](https://www.macports.org/) - Package management system for Mac OS X
* [Apple Macintosh and Tcl/Tk](https://wiki.tcl.tk/1013)
* [Tk differences on Mac OS X](https://wiki.tcl.tk/44444)


### Unix-specific

* [Expect](https://core.tcl.tk/expect/index)
* [Extended Tcl (TclX)](http://tclx.sourceforge.net/), and [here](https://github.com/flightaware/tclx)
* [DBus binding for Tcl](https://chiselapp.com/user/schelte/repository/dbus/home)
* [Signal Extension](http://www.nyx.net/~mschwart/signal_ext.html) - Unix/POSIX Signal handling for Tcl
* [tcl-mq](https://sourceforge.net/projects/tcl-mq/) - Tcl POSIX Message Queues
* [Tulsa](http://chiselapp.com/user/stwo/repository/tulsa/index) - Tcl Unix Local Sockets,
provides server, client, and pair UNIX socket(2)s.
* [tclreadline](https://github.com/flightaware/tclreadline) - GNU readline for interactive tcl shells
* [eltclsh](http://homepages.laas.fr/mallet/soft/shell/eltclsh) - an interactive shell for the TCL programming language
* [tclbsd](https://github.com/flightaware/tclbsd) - A Tcl package for interfacing to
various BSD UNIX system calls and library routines
* [tcl-augeas](https://github.com/dbohdan/tcl-augeas) - Tcl bindings for [Augeas](http://augeas.net/)
* [tcl-inotify](https://sourceforge.net/projects/tcl-inotify/)

The proc filesystem ([procfs](https://en.wikipedia.org/wiki/procfs)) 
is a special filesystem in Unix-like operating systems that presents 
information about processes and other system information in a hierarchical 
file-like structure, providing a more convenient and standardized method for 
dynamically accessing process data held in the kernel than traditional 
tracing methods or direct access to kernel memory.
You can check [my test](https://github.com/ray2501/meminfo).

And useful info:

* [Get Random Bytes on *NIX](https://wiki.tcl.tk/55351)


### Windows-specific

* [tcom](https://github.com/pukkaone/tcom)
* [Tcl Windows API extension (TWAPI)](http://twapi.magicsplat.com/)
* [CAWT](http://www.posoft.de/html/extCawt.html) - Com Automation With Tcl,
based on Twapi to script Microsoft Windows® applications with Tcl
* iocpsock: [Winsock2 IOCP channel driver for Tcl](https://sourceforge.net/projects/iocpsock/)
* [tcl-vix](http://tcl-vix.magicsplat.com/) - provides an interface to the VIX library for manipulating VMware virtual machines
* [Windows Inspection Tool Set](http://windowstoolset.magicsplat.com/)


### Android

* [AndroWish](http://www.androwish.org/index.html/home): AndroWish allows to
run desktop Tcl and Tk programs almost unaltered on the Android Platform while
it opens the door to script a rich set of features on a mobile platform.


### Emscripten

* [EmTcl](https://aidanhs.github.io/emtcl/): Tcl 8.6 and Jim Tcl in the browser through emscripten
* [Wacl](https://fossil.e-lehmann.de/wacl/index) - This is a Tcl distribution for [WebAssembly](http://webassembly.org/).
It enables Web developers to embed a Tcl interpreter in the browser and integrate Tcl with JavaScript.

### Browser

* [FireTcl](https://sourceforge.net/projects/firetcl/) - It's a framework for developing desktop apps using web technology and Tcl, embeds Tcl inside a browser with websocket support
* [Tcl/Tk plugin](https://wiki.tcl.tk/25865)
* [Wtk](https://core.tcl.tk/wtk/index) - A variant of the Tk toolkit for GUI development in JS,
for use in Browsers


## Language

### CSharp and dotNET

* [Tcl Interpreter in C# Application](https://wiki.tcl.tk/9563)
* [Eagle](http://eagle.to/): Eagle (Extensible Adaptable Generalized Logic Engine) is
an implementation of the Tcl scripting language for the Common Language Runtime (CLR).
Beta 42 release support for building against and running on the .NET Core 2.x runtime
(which conforms to the .NET Standard 2.0) has been added.
* [Eagle Integration Tutorial](http://eagle.to/tutorial/01/index.html)
* [Garuda](http://eagle.to/): is part of the Eagle project.
It is a stubs-enabled native package for Tcl that allows the CLR and Eagle to
be loaded and used by Tcl 8.4 or higher on Windows.

And my test for [TickleSharp](https://wiki.tcl.tk/10849):

* [TickleSharp](https://github.com/ray2501/ticklesharp) - Binding to the Tcl/Tk scripting language for the .NET platform


### Java

* [JTcl](https://jtcl-project.github.io/jtcl/): JTcl is an implementation of
Tool Command Language written in Java. JTcl implements a large extent of Tcl 8.4
syntax and commands, limited only by API restrictions of the Java Virtual
Machine.
* [tclJBlend](https://wiki.tcl.tk/47668) - a fork of TclBlend
* [Tcl/Java](http://tcljava.sourceforge.net/docs/website/index.html)

and my [TclBlend](https://github.com/ray2501/tclBlend) backup


### C

* [ffidl](http://elf.org/ffidl/) and [git repository](https://github.com/prs-de/ffidl) - Foreign
Function Interface
* [critcl](http://andreas-kupries.github.io/critcl/) - Critcl lets you easily embed C code in Tcl
* [SWIG](https://github.com/swig/swig) - SWIG is a compiler that integrates C and C++ with languages
including Perl, Python, Tcl, Ruby, PHP, Java, C#, D, Go, Lua, Octave, R,
Scheme (Guile, MzScheme/Racket, CHICKEN), Scilab, Ocaml, Modula-3,
Common Lisp (CLISP, Allegro CL, CFFI, UFFI) and Pike.

Useful info:
* [Accessing C library functions using Critcl](https://wiki.tcl.tk/11227)


### CPP

* [cpptcl](https://github.com/flightaware/cpptcl)


### D

* [Example of a Tcl extension in D](https://wiki.tcl.tk/48795)


### Erlang

* [etclface](https://github.com/fredyouhanaie/etclface) - An Erlang/Tcl Interface


### Forth

* [TclForth](https://github.com/wejgaard/TclForth) - A multi-platform desktop Forth system based on Tcl/Tk


### Fortran

* [Ftcl](http://ftcl.sourceforge.net/) - Using Tcl in Fortran programs and vice versa
* [Example of a Tcl extension in Fortran](https://wiki.tcl.tk/48061)


### JavaScript

* [tcljs (SpiderMonkey)](https://github.com/flightaware/tcljs) - Tcl extension to execute JavaScript using the SpiderMonkey Javascript interpreter
* [tcl-duktape](https://github.com/dbohdan/tcl-duktape) - Tcl bindings for [Duktape](http://duktape.org/),
an embedded JavaScript interpreter

### GO

* [gothic](https://github.com/nsf/gothic) - Tcl/Tk Go bindings.
* [Example of a Tcl extension in Go](https://wiki.tcl.tk/48054)


### Python

* [libtclpy](https://github.com/aidanhs/libtclpy) - targeting Tcl >= 8.5 and Python 2.6 - 2.7
* [tclpython](https://github.com/amykyta3/tclpython/)


### R

* [Tcl'er Wiki info](https://wiki.tcl.tk/6125) - R

R has bindings to Tcl/Tk (part of R, [document](https://www.rdocumentation.org/packages/tcltk/versions/3.4.0)).


### Rust

* [rust-tcl](https://github.com/AngryLawyer/rust-tcl) - Currently targets Tcl 8.5


### Swift

* [tcl-swift-bridge](https://github.com/flightaware/tcl-swift-bridge): Swift class library that bridges between Swift and Tcl
* [Example of a Tcl extension in Swift](https://wiki.tcl.tk/48057)


## Hardware

* [I2cTcl](http://i2ctcl.sourceforge.net/) - I2cTcl for Tcl/Tk on LINUX
* [KineTcl](https://wiki.tcl.tk/37926), a binding of the OpenNI framework (version 1),
providing Tcl with access to MS Kinect (tm), and related sensor systems


### Arduino

* [tfirmata](http://pdt.github.io/tfirmata) - a Tcl implementation of Arduino Firmata 2.3

Useful info:

* [Arduino on Tcler's wiki](https://wiki.tcl.tk/37203)


### Raspberry Pi

* [piio](http://chiselapp.com/user/schelte/repository/piio/index) - supports both gpio and i2c

Useful info:

* [Raspberry Pi on Tcler's wiki](https://wiki.tcl.tk/29308)


## Related Project

* [The Jim Interpreter](http://jim.tcl.tk/index.html/doc/www/www/index.html): A small footprint implementation of the Tcl programming language
* [ParTcl](https://github.com/zserge/partcl) - a micro Tcl implementation
* [Picol](https://chiselapp.com/user/dbohdan/repository/picol/index) - A tiny Tcl interpreter


## Write a Tcl extension

* [Tclconfig](https://core.tcl.tk/tclconfig)
* [Sampleextension](https://core.tcl.tk/sampleextension)

目前就我所知，Tcl extension 可以大致上分為二種形式，
一種是使用 C/C++ 與 [TEA](https://wiki.tcl.tk/327) 架構撰寫的 extension。
可以從 Tcl 社群提供的 Sample extension 開始。

    # Replace sample with the name of your extension
    wget -qO- http://core.tcl.tk/sampleextension/tarball/sample.tar.gz | tar xzv
    cd sample
    wget -qO- http://core.tcl.tk/tclconfig/tarball/tclconfig.tar.gz | tar xzv

    # Write your source files
    # Edit configure.in
    autoconf

    # And then the usual:
    ./configure
    make

另外一個使用 C/C++ 開發 Tcl 套件的方式是使用
Critcl (provides on-the-fly compilation and execution of C code).

還有的方式是使用 [SWIG](https://github.com/swig/swig) 來撰寫。
可以參考相關的文章 [Tcl and SWIG as a C/C++ Development Tool](http://swig.org/papers/Tcl98/TclChap.html).

一種是使用 pure Tcl 所撰寫的 exetnsion，
以 Tcl 檔案的形式或者是 [Tcl Modules](https://wiki.tcl.tk/12999) 的方式發佈。

Tcl Modules（.tm 檔案）在 Tcl/Tk 8.5 被 Tcl core team 所接受，所有的 code 都要放在同一個檔案裡，
這個機制並不是要取代之前的套件機制（使用 pkgIndex.tcl 這個 index script 來提供套件的資訊），
而是在減少彃性， 不用提供 pkgIndex.tcl 的情況下，實作提供 Tcl core 資訊並且減少存取檔案系統次數的套件機制。


## Tools

* [Enhanced Tk Console: tkcon](http://tkcon.sourceforge.net/)
* [ASED](https://sourceforge.net/projects/ased/), [Wiki page](https://wiki.tcl.tk/1278) - BWidget IDE allowing editing of multiple Tcl files
* [BallroomDJ](https://ballroomdj.org/) - a ballroom music player
* [DRAKON Editor](https://github.com/stepan-mitkin/drakon_editor) - a free open source tool for authoring DRAKON diagrams
* [Tcl for Creo](https://wiki.tcl.tk/48597) - Scripting, Customization and Automation with Tcl scripts in Creo
* [tcled](https://github.com/slebetman/tcled) - Pure Tcl Console Text Editor
* [Chimera Grid Tools](https://www.nas.nasa.gov/publications/software/docs/chimera/index.html)
* [ezdit](https://github.com/jianiau/ezdit): A cross-platform editor written in Tcl/Tk
* [GraphViz](https://www.graphviz.org/) - Set of graph drawing tools and libraries,
supporting hierarchical and mass-spring drawings
* [IPAT-S Software Suite](https://sourceforge.net/projects/ipat-s/) - IPAT-S Software Suite is a collection of supporting tools for the IPAT-S modeling language
* [MTE](https://wiki.tcl.tk/15025) - A customizable editor for (X)HTML written in Tcl/Tk
* [minitree note taking app](https://wiki.tcl.tk/48369)
* [Notebook](https://github.com/wduquette/notebook) - Notebook Personal Wiki
* [poApps - Paul's Portable Applications](http://www.posoft.de/html/poTools.html)
* [rlwrap](https://github.com/hanslub42/rlwrap) - a wrapper for GNU readline.
It can be used with an interactive Tcl to provide readline editing
and command history functionality.
* [SAOImage DS9](http://ds9.si.edu/site/Home.html) - a Tcl/Tk program that uses the SAOTk widget set,
is an astronomical imaging and data visualization application
* [snackamp](	http://sourceforge.net/projects/snackamp/)
* [starDOM](https://wiki.tcl.tk/3895) - a little XML browser
* [Sqawk](https://github.com/dbohdan/sqawk) - An SQL Awk with table joins
* [tclsh-wrapper](https://github.com/suewonjp/tclsh-wrapper) - A tiny wrapper for Tcl/Tk's tclsh and wish
* [Tcl Task Manager](https://github.com/Dash-OS/tcl-task-manager)
* [tedit](https://github.com/thanoulis/tedit) - a simple text editor written in Tcl/Tk
* [tkchat](http://tkchat.tcl.tk/) - an instant messaging application
* [TkMC](https://wiki.tcl.tk/7772) - MC like file manager with basic functionality
* [TkSQLite](http://reddog.s35.xrea.com/wiki/TkSQLite.html) - GUI frontend to sqlite3
* [wiki-reaper](https://wiki.tcl.tk/4718) - An HTTP robot in Tcl that will fetch page(s) from Tcler's Wiki
* [binaryscanr](https://github.com/shuntksh/binaryscanr) - A Tcl binary scan frontend app
* [XilinxTclStore](https://github.com/Xilinx/XilinxTclStore) - Xilinx Tcl Store


## Misc

* [Cameron Laird's personal notes on commercial aspects of Tcl](http://phaseit.net/claird/comp.lang.tcl/commercial-tcl.html)
* [Andreas' ComputerLab BLOG](https://core.tcl.tk/akupries/blog/)
* [Dai's Blog](http://blog.got7.org/)
* [dbohdan blog](http://dbohdan.com/blog/)
* [magicsplat.com](http://www.magicsplat.com/) - Software, articles and blog
* [The "Clone Don Porter" Project](https://wiki.tcl.tk/55306)
* [Tcl-bounties](https://github.com/flightaware/Tcl-bounties) - Bounty program for improvements to Tcl and certain Tcl packages
