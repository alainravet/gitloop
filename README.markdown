[gitloop](http://rubygems.org/gems/gitloop)
=======


<table>
  <tr style="line-height:5em">
    <td colspan="3" style="text-align:center;">
        <code style="font-size:1.6em;padding:20px 40px;background:lightyellow">
            git <b>loop</b>&nbsp;&nbsp;master~4&nbsp;&nbsp;master~2&nbsp;&nbsp;&nbsp;<b>-m</b> "let's group them"
        </code>
    </td>
  </tr>
  <tr>
    <td width="42%" style="text-align:center"> <img src="https://github.com/alainravet/gitloop/raw/master/doc/BEFORE.png"/></td>
    <td width="6%" style="text-align:center;font-size:4em;">&rarr;</td>
    <td width="42%" style="text-align:center"> <img src="https://github.com/alainravet/gitloop/raw/master/doc/AFTER.png" /></td>
  </tr>
</table>


The same results would be obtained by any of :

    $ git loop   7355c79    6ffd9        -m "let's group them"
    $ git loop   second     c4           -m "let's group them"
    $ git loop   "second commit" third   -m "let's group them"


Installation :
-------------
        $ gem install gitloop

#### Report bugs to <https://github.com/alainravet/gitloop/issues>

--------------------------------------------------------------------------------

== Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

== Copyright

Copyright (c) 2012 Alain Ravet. See LICENSE for details.
·