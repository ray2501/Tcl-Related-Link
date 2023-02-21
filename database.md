Tcl extension and Database
=====

Tcl database client 端的相關連結。


TDBC
=====

[TDBC](http://tdbc.tcl.tk/index.cgi/index) is an interface standard
for databases and connectivity that aims to make it easy to write portable
and secure Tcl scripts that access SQL databases.

The TDBC library provides several C procedures that simplify writing a TDBC
driver. They include a procedure that tokenizes a SQL statement, locating
variables to be substituted, and a procedure that accepts a SQL state and
returns an error class for the interpreter error information.

Tcl 8.6 shipped with four drivers for TDBC:
* MySQL (tdbc::mysql)
* ODBC (tdbc::odbc)
* PostgreSQL (tdbc::postgres)
* SQLite (tdbc::sqlite)

ORM
=====

* [ORM](https://wiki.tcl.tk/26254) - Object Relational Model over TDBC


RDBMS
=====

A relational database management system (RDBMS) is a database management 
system (DBMS) based on the relational model invented by Edgar F. Codd at 
IBM's San Jose Research Laboratory.

You can check [Open source SQL engines](http://www.martinbroadhurst.com/sql-engines.html).

* [mysqltcl](http://www.xdobry.de/mysqltcl/) - Tcl interface to MySQL database
* [TclODBC](https://sourceforge.net/projects/tclodbc/)
* [Pgtcl](http://flightaware.github.io/Pgtcl/) - Tcl client side interface to PostgreSQL (libpgtcl)
* [pgintcl](https://sourceforge.net/projects/pgintcl/): Pure-Tcl Interface to PostgreSQL
* [pgwire](https://github.com/cyanogilvie/pgwire) - Pure Tcl script implementation of
the PostgreSQL version 3.0 protocol
* [The Tcl interface to the SQLite library](http://www.sqlite.org/tclsqlite.html), and 
[SpatiaLite](https://wiki.tcl.tk/23457)
* [Oratcl](http://oratcl.sourceforge.net/) - Tcl interface to Oracle database, versions 8i, 9i, 10g, and 11g
* [tcltds](https://github.com/cloudsidekick/tcltds) - A tcl extension for the FreeTDS libraries
* [hdbtcl](https://github.com/quietboil/hdbtcl) - An extension to the Tcl language that 
provides access to SAP HANA database server 
* [db2tcl](https://github.com/memmertoIBM/db2tcl) - TCL language interface to Db2 databases

And

* [TDBC Driver for Oratcl 4.5 Database Connector](https://fossil.sowaswie.de/tdbc_oratcl/index)


NoSQL
=====

A NoSQL (originally referring to "non SQL" or "non relational") database 
provides a mechanism for storage and retrieval of data that is modeled in 
means other than the tabular relations used in relational databases.

What follows is a basic classification by data model,
* Key-value
* Wide-column
* Document
* Graph

Below is some Tcl NoSQL clients:

* [tgdbm](http://www.vogel-nest.de/tgdbmqgdbm-library-for-tcl-version-0-5/) - Store key/value pairs
in portable files using GDBM
* [Berkeley DB Extensions: Tcl](https://docs.oracle.com/cd/E17276_01/html/programmer_reference/tcl.html)
* [metakit](https://github.com/pooryorick/metakit/)
* [casstcl](https://github.com/flightaware/casstcl) - Tcl language interface to the Cassandra database,
based on [Cassandra cpp driver](https://github.com/datastax/cpp-driver)
* [tclcb](https://sourceforge.net/projects/tclfltk/files/Linux/Couchbase/) - for CouchBase SDK 2.1.3
* [memcached-for-Tcl](https://github.com/bovine/memcached-for-Tcl) - based on
[libmemcached](http://libmemcached.org/libMemcached.html)
* [mongotcl](https://github.com/flightaware/mongotcl)
* [retcl](https://github.com/gahr/retcl) - Tcl client library for Redis
* [redis-tcl](https://github.com/bradvoth/redis-tcl)
* [neo4j-tcl](https://icube-forge.unistra.fr/akress/neo4j-tcl/) - Tcl extension for Neo4j wrapping the C driver
* [TSDB](https://wiki.tcl.tk/41240) - A straightforward implementation of a time-series database, written by Tcl

And

* [memoize](https://wiki.tcl.tk/10981) - A package that can be used to cache, 
load and save the values of expensive pure function calls
* [Arrays as cached functions](https://wiki.tcl.tk/4495)


Other
=====

* [Tcl8 bindings for Xapian](https://xapian.org/docs/bindings/tcl8/)
* [zookeepertcl](https://github.com/flightaware/zookeepertcl) - Tcl interface to Apache zookeeper 
distributed coordination system
* [etcd-tcl](https://github.com/efrecon/etcd-tcl) - an implementation of the etcd API v. 2 in Tcl
* [kafkatcl](https://github.com/flightaware/kafkatcl) - Tcl interface to the Apache Kafka
* [zeromq - Tcl](http://zeromq.org/bindings:tcl)
* [rabbitmq-tcl](https://github.com/dereckson/rabbitmq-tcl) - TCL extension to provide an AMQP client. Wrapper around librabbitmq
* [tclrmq](https://github.com/flightaware/tclrmq) - Pure Tcl Library for RabbitMQ
* [nats-tcl](https://github.com/Kazmirchuk/nats-tcl) - NATS client library for Tcl applications
* [tstomp](https://github.com/siemens/tstomp) - a Stomp Implementation for Tcl coded in pure Tcl
* [Tcl MQTT client](https://chiselapp.com/user/schelte/repository/mqtt/home)
* [mqtt](https://github.com/efrecon/mqtt) - MQTT client implementation in modern Tcl
* [mqtt2any](https://github.com/efrecon/mqtt2any) - Route MQTT subscriptions into generic implementations (program)
* [disque](https://github.com/efrecon/disque) - An implementation of the DISQUE API in Tcl
* [Round Robin Database Tool (RRDtool)](http://oss.oetiker.ch/rrdtool/)
* [Speedtables](http://flightaware.github.io/speedtables/) - High-performance, memory-resident database
* [SQL Relay](http://wiki.tcl.tk/9242)
* [MrPersister](http://wiki.tcl.tk/21669) - a database access library for Jacl
* [HammerDB](http://www.hammerdb.com/) - multi-platform software for load testing databases


我的作品集
=====

下面是我在進行資料庫研究時所寫的 Tcl extension 列表。

* [tcl-lmdb](https://github.com/ray2501/tcl-lmdb)
* [tcl-leveldb](https://github.com/ray2501/tcl-leveldb)
* [tcl-rocksdb](https://github.com/ray2501/tcl-rocksdb)
* [tclunqlite](https://github.com/ray2501/tclunqlite)
* [tclcubrid](https://github.com/ray2501/tclcubrid)
* [tclmonetdb](https://github.com/ray2501/tclmonetdb)
* [TDBCJDBC](https://github.com/ray2501/TDBCJDBC) and [TclBlend](https://github.com/ray2501/tclBlend) backup
* [tdbchikaricp](https://github.com/ray2501/tdbchikaricp) - Tcl DataBase Connectivity Driver for
[HikariCP](http://brettwooldridge.github.io/HikariCP/) library
* [cratedb-tcl](https://github.com/ray2501/cratedb-tcl)
* [couchdbtcl](https://github.com/ray2501/couchdbtcl)
* [BaseXClient-Tcl](https://github.com/ray2501/BaseXClient-Tcl)
* [DrillREST](https://github.com/ray2501/DrillREST)
* [GeodeREST](https://github.com/ray2501/GeodeREST)
* [HBaseClient-Tcl](https://github.com/ray2501/HBaseClient-Tcl)
* [solr4tcl](https://github.com/ray2501/solr4tcl)
* [thiredis](https://github.com/ray2501/thiredis) - Wrapper Redis client hiredis for Tcl
* [tcl-gremlin](https://github.com/ray2501/tcl-gremlin) - Gremlin Server driver for Tcl
* [tclxqilla](https://github.com/ray2501/tclxqilla)
* [tcl.mqttc](https://github.com/ray2501/tcl.mqttc) - MQTT Client for Tcl
* [CurlYQL](https://github.com/ray2501/CurlYQL) - Using TclCurl to send YQL query


