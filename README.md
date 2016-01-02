## README


* Ruby version
    * 2.3.0
* System dependencies
    * PostgreSQL (but it should be easy to change)
* License
    * GPL version 3 or any later versions
* Author
    * Tatsuhiro Ujihisa

### How to run it

An example in vimshell

```sh
iexe redis-server
rake db:migrate
iexe rails server
```

If the rake/rails processes are hang, just `kill` the spring process automatically running background.
