Organize your downloaded TV episodes. 美剧整理器
-----------------------------------------------

Move your downloaded TV episodes into your media library directory with a easy-understanding sub-directory structure.

For example, when you have downloaded a TV episode like this:

     Your.Donwload.Directory
     `----A.Si-Fi.Story.S02E04.720p.HDTV.GROUPNAME
          |---A.Si-Fi.Story.S02E04.720p.HDTV.GROUPNAME.mkv
          |---A.Si-Fi.Story.S02E04.720p.HDTV.GROUPNAME.srt
          `---story.nfo

this script will move this episode into your media library directory. (and make some neccessary directories.) Then it will be look like this:

     Your.Media.Library.Directory
     `----A.Si-Fi.Story
          `----Season.02
               `----A.Si-Fi.Story.S02E04.720p.HDTV.GROUPNAME
                    |---A.Si-Fi.Story.S02E04.720p.HDTV.GROUPNAME.mkv
                    |---A.Si-Fi.Story.S02E04.720p.HDTV.GROUPNAME.srt
                    `---story.nfo

And when you have downloaed many episodes after seasons, it will be look like this: (only shows directories)

     Your.Media.Library.Directory
     |----A.Si-Fi.Story
     |    |----Season.01
     |    |    |----A.Si-Fi.Story.S01E01.720p.HDTV.GROUPNAME
     |    |    |----A.Si-Fi.Story.S01E02.720p.HDTV.GROUPNAME
     |    |    |----A.Si-Fi.Story.S01E03.720p.HDTV.GROUPNAME
     |    |    `----A.Si-Fi.Story.S01E04.720p.HDTV.GROUPNAME
     |    `----Season.02
     |         |----A.Si-Fi.Story.S02E01.720p.HDTV.GROUPNAME
     |         |----A.Si-Fi.Story.S02E02.720p.HDTV.GROUPNAME
     |         |----A.Si-Fi.Story.S02E03.720p.HDTV.GROUPNAME
     |         `----A.Si-Fi.Story.S02E04.720p.HDTV.GROUPNAME
     `----A.Sit-Com.Story
          |----Season.01
          |    |----A.Sit-Com.Story.S01E01.720p.HDTV.GROUPNAME
          |    |----A.Sit-Com.Story.S01E02.720p.HDTV.GROUPNAME
          |    |----A.Sit-Com.Story.S01E03.720p.HDTV.GROUPNAME
          |    `----A.Sit-Com.Story.S01E04.720p.HDTV.GROUPNAME
          `----Season.02
               |----A.Sit-Com.Story.S02E01.720p.HDTV.GROUPNAME
               |----A.Sit-Com.Story.S02E02.720p.HDTV.GROUPNAME
               |----A.Sit-Com.Story.S02E03.720p.HDTV.GROUPNAME
               `----A.Sit-Com.Story.S02E04.720p.HDTV.GROUPNAME

You can hook this script into your transmission-daemon. Afterwards, when torrent downloaded, the script will automatically move the TV episodes into their proper directory.
(NOTICE: It will no longer work as an active seed after moving.)

How to use
----------

* Manually move a episode, or orginze an exist library directory

     run.sh tv_episode_directory_or_file library_directory

* Hook into current transmission-daemon

  run install.sh and follow the instructions.

Version history
---------------

v0.9 2015.08.21

* Initial release