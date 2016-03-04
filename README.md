Tcl-Related-Link
=====

這是一個我個人收集的 [Tcl] (http://www.tcl.tk/) 相關連結網頁。目的是我需要某個連結的時候，可以很快的找到。


官網與文件
=====

* [Tcl Developer Site] (http://www.tcl.tk/)
* [Tcler's Wiki] (http://wiki.tcl.tk/)
* [Tcl TIP Collection] (http://www.tcl.tk/cgi-bin/tct/tip)
* [comp.lang.tcl] (https://groups.google.com/forum/#!forum/comp.lang.tcl)
* [Tcl Source Code (core package)] (http://core.tcl.tk/)
* [Tcl on Windows FAQ] (http://www.tcl.tk/faq/tclwin.htm)
* [Tcl Programming for Windows] (http://www.magicsplat.com/book/)
* [Tcl for Web Nerds] (http://philip.greenspun.com/tcl/)
* [TCLWISE] (http://www.invece.org/tclwise/)
* [Tcl Wikibook] (https://en.wikibooks.org/wiki/Tcl_Programming)
* [Tcl/Tk Programming Idioms] (http://www.doc.ic.ac.uk/~np2/patterns/scripting/tcl/index.html)
* [Object Oriented Programming in Tcl] (http://www.magicsplat.com/articles/oo.html)
* [The Tcl Database Connectivity interface] (http://www.magicsplat.com/articles/tdbc.html)
* [Tcl Threading Model] (http://www.tcl.tk/doc/howto/thread_model.html)
* [TkDocs] (http://www.tkdocs.com/)
* [Great Unified Tcl/Tk Extension Repository] (http://core.tcl.tk/jenglish/gutter/)

ActiveTcl
=====

[ActiveTcl] (http://www.activestate.com/activetcl) 是一個廣為人所知，提供了 [Batteries Included] (http://wiki.tcl.tk/2352) 的 Binary Distribution。

Building Tcl/Tk with Mingw
=====

* [Building Tcl/Tk with Mingw] (http://wiki.tcl.tk/14828)
 
在 Windows 平台上使用 Mingw/MSYS 自己編譯 Tcl/Tk 可以參考 Tcler's wiki 上的文章。

我主要使用下面來自於 Tcler's wiki 的 script：

    #!/bin/sh
    mkdir -p /src
    mkdir -p /opt/tcl
    mkdir -p /build/tcl
    mkdir -p /build/tk
    [ -e /src/tcl ] && {
        cd /build/tcl
        /src/tcl/win/configure --prefix=/opt/tcl --enable-threads && make && make install && {
            [ -e /src/tk ] && {
            cd /build/tk
            /src/tk/win/configure --prefix=/opt/tcl --enable-threads --with-tcl=/build/tcl \
                && make && make install
            }
        }
    }

Tcl 的 source code 放在 /src/tcl 目錄下，而 Tk 的 source code 放在 /src/tk 的目錄下。

Building Tcl/Tk with MSYS2 (for x86_64)
=====

下載並且安裝 [MSYS2] (https://sourceforge.net/projects/msys2/) 以後，首先先更新 MSYS2 的核心套件：

    pacman -Sy
    pacman --needed -S bash pacman pacman-mirrors msys2-runtime

然後離開 MSYS2-shell 再重啟，並且在安裝其它的套件之前使用下面的命令：

    pacman -Su

離開 MSYS2-shell 再重啟，就有一個基本可用的 MSYS2-shell。再來是安裝編譯時需要的套件。

    pacman -S base-devel mingw-w64-x86_64-toolchain

如果要一起裝 (i686 and x86_64)，使用下面的：

    pacman -S base-devel mingw-w64-i686-toolchain mingw-w64-x86_64-toolchain

到這裡就安裝完需要的檔案。然後把 Tcl 8.6.4 的 source code 放在 /src/tcl，Tk 8.6.4 的 source code 放在 /src/tk，使用下面的 script 來編譯：

    #!/bin/sh
    mkdir -p /src
    mkdir -p /opt/tcl
    mkdir -p /build/tcl
    mkdir -p /build/tk
    [ -e /src/tcl ] && {
        cd /build/tcl
        /src/tcl/win/configure --prefix=/opt/tcl --enable-64bit --enable-threads && make && make install && {
            [ -e /src/tk ] && {
            cd /build/tk
            /src/tk/win/configure --prefix=/opt/tcl --enable-threads --with-tcl=/build/tcl \
                && make && make install
            }
        }
    }

如果是使用 MSYS2 在 Windows 平台上編譯 64 位元的 Tcl/Tk，要加 --enable-64bit，不然會在 zlib 連結的時候失敗。如果一切順利的話，就可以編譯出 64 位元的 Tcl/Tk。

Tcllib and Tklib
=====

* [Tcllib] (https://core.tcl.tk/tcllib/doc/trunk/embedded/index.html)
* [Tklib] (https://core.tcl.tk/tklib/home)

Extensions
=====

* [incr Tcl] (http://incrtcl.sourceforge.net/)
* [TDBC] (http://tdbc.tcl.tk/index.cgi/index)
* [Expect] (http://www.nist.gov/el/msid/expect.cfm)
* [Tcl UDP extension] (https://sourceforge.net/projects/tcludp/)
* [Extended Tcl (TclX)] (http://tclx.sourceforge.net/)
* [Tcl Windows API extension (TWAPI)] (http://twapi.magicsplat.com/)
* [tDOM] (http://tdom.github.io/)
* [Web Services for Tcl] (http://core.tcl.tk/tclws/index)
* [TLS - OpenSSL extension to Tcl] (http://tls.sourceforge.net/)
* [TclVfs] (https://sourceforge.net/projects/tclvfs/)
* [Enhanced Tk Console: tkcon] (http://tkcon.sourceforge.net/)
* [BWidget] (https://core.tcl.tk/bwidget/home)
* [TkHTML] (http://tkhtml.tcl.tk/)
* [3-D Canvas Widget] (http://3dcanvas.tcl.tk/index.html/doc/tip/doc/index.wiki)
* [Tkpath] (https://bitbucket.org/andrew_shadura/tkpath)


Tools
=====

* [freeWrap] (http://freewrap.sourceforge.net/): FreeWrap distributions are freely available for Linux and Windows operating systems.


Android and Tcl
=====

* [AndroWish] (http://www.androwish.org/index.html/home): AndroWish allows to run desktop Tcl and Tk programs almost unaltered on the Android Platform while it opens the door to script a rich set of features on a mobile platform.


Java and Tcl
=====

* [JTcl] (https://jtcl-project.github.io/jtcl/): JTcl is an implementation of Tool Command Language written in Java. JTcl implements a large extent of Tcl 8.4 syntax and commands, limited only by API restrictions of the Java Virtual Machine.


.NET and Tcl
=====

* [Eagle] (http://eagle.to/): Eagle (Extensible Adaptable Generalized Logic Engine) is an implementation of the Tcl scripting language for the Common Language Runtime (CLR).


Write a Tcl extension
=====

目前就我所知，Tcl extension 可以大致上分為二種形式，一種是使用 C/C++ 與 [TEA] (http://wiki.tcl.tk/327) 架構撰寫的 extension。
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

一種是使用 pure Tcl 所撰寫的 exetnsion，以 Tcl 檔案的形式或者是 [Tcl Modules] (http://wiki.tcl.tk/12999) 的方式發佈。

Tcl Modules（.tm 檔案）在 Tcl/Tk 8.5 被 Tcl core team 所接受，所有的 code 都要放在同一個檔案裡，
這個機制並不是要取代之前的套件機制（使用 pkgIndex.tcl 這個 index script 來提供套件的資訊），
而是在減少彃性， 不用提供 pkgIndex.tcl 的情況下，實作提供 Tcl core 資訊並且減少存取檔案系統次數的套件機制。


Misc
=====
* [Cameron Laird's personal notes on commercial aspects of Tcl] (http://phaseit.net/claird/comp.lang.tcl/commercial-tcl.html)
