awfulapp.com
============

Stuff hosted at http://awfulapp.com.

[Awful.app][] uses this to download updated thread tags without requiring a full update through the App Store. Other apps, services, etc. are welcome to do the same so long as they adhere to the [thread tag license][].

Thread Tags
-----------

Thread tags are stored in a [separate repository][Thread Tags.git] (so others can more easily use them if they want). After adding new thread tags, here's how to update the site:

```bash
cd path/to/awful/site
cd Thread\ Tags
git pull origin master
cd ..
git commit -am "Updated thread tags."
git push
```

tags.txt
--------

The tag downloading for Awful.app relies on a tag list downloaded from http://awfulapp.com/tags.txt (which is the [tags.txt][] file in this repository). This file follows a simple format:

    Line one is the path to the thread tags, relative to `http://awfulapp.com`.
    All following lines are the URL-encoded filename of an available thread tag.

The included script [gentags.sh][] will generate `tags.txt` in this format and add it to the git index. Consider setting this script as your pre-commit hook with:

    ln -s ../../gentags.sh .git/hooks/pre-commit

This ensures `tags.txt` is up-to-date whenever you update the Thread Tags submodule.


[Awful.app]: https://github.com/Awful/Awful.app
[gentags.sh]: gentags.sh
[tags.txt]: tags.txt
[thread tag license]: https://github.com/Awful/thread-tags/blob/master/LICENSE.txt
[Thread Tags.git]: https://github.com/Awful/thread-tags
