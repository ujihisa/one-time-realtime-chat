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


### References

* https://www.youtube.com/watch?v=n0WUjGkDFS0&feature=youtu.be
* http://qiita.com/jnchito/items/aec75fab42804287d71b
    * Japanese version of the DHH video
    * Also a tip for heroku (but this time I didn't use.)
