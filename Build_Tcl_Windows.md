Build Tcl on Windows Platform
=====

這份文件收集了 MinGW 與 MSYS2 的部份。


Building Tcl/Tk with Mingw
=====

* [Building Tcl/Tk with Mingw](http://wiki.tcl.tk/14828)
 
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

下載並且安裝 [MSYS2](https://sourceforge.net/projects/msys2/) 以後，首先先更新 MSYS2 的核心套件：

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
