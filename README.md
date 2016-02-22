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
* [TDBC] (http://tdbc.tcl.tk/index.cgi/index)
* [Tcl on Windows FAQ] (http://www.tcl.tk/faq/tclwin.htm)
* [Tcl Programming for Windows] (http://www.magicsplat.com/book/)
* [Tcl for Web Nerds] (http://philip.greenspun.com/tcl/)
* [TCLWISE] (http://www.invece.org/tclwise/)
* [Tcl Wikibook] (https://en.wikibooks.org/wiki/Tcl_Programming)
* [Tcl/Tk Programming Idioms] (http://www.doc.ic.ac.uk/~np2/patterns/scripting/tcl/index.html)
* [The Tcl Database Connectivity interface] (http://www.magicsplat.com/articles/tdbc.html)
* [Tcl Threading Model] (http://www.tcl.tk/doc/howto/thread_model.html)
* [TkDocs] (http://www.tkdocs.com/)
* [Great Unified Tcl/Tk Extension Repository] (http://core.tcl.tk/jenglish/gutter/)

Tcllib and Tklib
=====

* [Tcllib] (https://core.tcl.tk/tcllib/doc/trunk/embedded/index.html)
* [Tklib] (https://core.tcl.tk/tklib/home)

Extensions
=====

* [incr Tcl] (http://incrtcl.sourceforge.net/)
* [Expect] (http://www.nist.gov/el/msid/expect.cfm)
* [Tcl UDP extension] (https://sourceforge.net/projects/tcludp/)
* [Extended Tcl (TclX)] (http://tclx.sourceforge.net/)
* [Tcl Windows API extension (TWAPI)] (http://twapi.magicsplat.com/)
* [tDOM] (http://tdom.github.io/)
* [TLS - OpenSSL extension to Tcl] (http://tls.sourceforge.net/)
* [TclVfs] (https://sourceforge.net/projects/tclvfs/)
* [Enhanced Tk Console: tkcon] (http://tkcon.sourceforge.net/)


Android and Tcl
=====

* [AndroWish] (http://www.androwish.org/index.html/home): AndroWish allows to run desktop Tcl and Tk programs almost unaltered on the Android Platform while it opens the door to script a rich set of features on a mobile platform.


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
