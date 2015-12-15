---
layout: post
title:  "Keep Yourself Sane, Tweek your MOTD"
date:   2015-12-04 21:10:00
categories: linux motd
author: admbradford
---

While doing server administration 3 AM I've made my fair share of mistakes. Most were a result of being on the wrong server. Several years ago, fed up and full of 4 AM fury, I placed Angry Axe Homer into a MOTD file.

A few days later my passion for logging into the wrong server was greeted by:

<pre style="font-family:'Lucida Console', 'Courier New', 'Courier', monospace; font-size:9px; background-color:#000; color:#fff; line-height:1;">
                                                     ___,------, 
             _,--.---.                         __,--'         / 
           ,' _,'_`._ \                    _,-'           ___,| 
          ;--'       `^-.                ,'        __,---'   || 
        ,'               \             ,'      _,-'          || 
       /                  \         _,'     ,-'              || 
      :                    .      ,'     _,'                 |: 
      |                    :     `.    ,'                    |: 
      |           _,-      |       `-,'                      :: 
     ,'____ ,  ,-'  `.   , |,         `.                     : \ 
     ,'    `-,'       ) / \/ \          \                     : : 
     |      _\   o _,-'    '-.           `.                    \ \ 
      `o_,-'  `-,-' ____   ,` )-.______,'  `.                   : : 
       \-\    _,---'    `-. -'.\  `.  /     `.                  \  \ 
        / `--'             `.   \   \:        \                  \,.\ 
       (              ____,  \  |    \\        \                 :\ \\ 
        )         _,-'    `   | |    | \        \                 \\_\\ 
       /      _,-'            | |   ,'-`._      _\                 \,' 
       `-----' |`-.           ;/   (__ ,' `-. _;-'`\           _,--' 
     ,'        |   `._     _,' \-._/  Y    ,-'      \      _,-' 
    /        _ |      `---'    :,-|   |    `     _,-'\_,--'   \ 
   :          `|       \`-._   /  |   '     `.,-' `._`         \ 
   |           _\_    _,\/ _,-'|                     `-._       \ 
   :   ,-         `.-'_,--'    \                         `       \ 
   | ,'           ,--'      _,--\           _,                    : 
    )         .    \___,---'   ) `-.____,--'                      | 
   _\    .     `    ||        :            \                      ; 
 ,'  \    `.    )--' ;        |             `-.                  / 
|     \     ;--^._,-'         |                `-._            _/_\ 
\    ,'`---'                  |                    `--._____,-'_'  \ 
 \_,'                         `._                          _,-'     ` 
                            ,-'  `---.___           __,---' 
                          ,'             `---------' 
                        ,' 
</pre> 

<blockquote>
"This is not the server I'm looking for. Thanks Homer"
</blockquote>

Updating the MOTD file to include a visual queue has been part of my server setups ever since. It's small tweak, but has prevented serious mistakes. (That and better sleeping habits)

<h2>How to Customize MOTD (message of the day)</h2>
Editing your MOTD file will largely depend on which Linux distribution you're using. /etc/motd is where you'll typically find the MOTD file, but each distrubution has it's own quirks. I primarily use Debian &amp; Ubuntu but will briefly cover a few others.

<h3>Debian</h3>
In Debian /etc/motd is a symlink to /var/run/motd. At every reboot this file is overwritten, so editing it just wont do. Instead place edits inside of /etc/motd.tail. Reboot and the boot script (/etc/init.d/bootmisc.sh &lt;=lenny, /etc/init.d/bootlogs &gt;= squeeze) will handle the rest. 

If rebooting isn't a option, copy the contents of the motd.tail to motd (cat /etc/motd.tail >> /var/run/motd)

<h3>Ubuntu</h3>
Ubuntu has a directory /etc/update-motd.d/ that holds a number of scripts which
create the /etc/motd file

Each file follows a standard naming convention NN-xxxxx. NN is a two digit number defining that scripts order (00 first - 99 last). xxxxx is a relevant name to the output of that script.

You can either add a numbered script to the /etc/update-motd.d/ directory or add to the /etc/motd.tail file

<h3>Gentoo</h3>
By default Gentoo does not display the motd file, but can be enabled inside login.defs. See Gentoo's <a href="http://www.gentoo-wiki.info/Motd" target="_blank">wiki page</a> for more information.


<h3>FreeBSD, CentOS, Arch and Many More</h3>
I'm not familiar with any of these linux distros, so please drop a comment below to help fill in this information.

<h2>What Else Can MOTD Do?</h2>
Quite a bit acutally, it can tell you the weather <a href="http://theurbanpenguin.com/wp/index.php/weather-reports-when-logging-into-ubuntu-server/" target="_blank">(link)</a>, hard drive tempatures <a href="http://mewbies.com/how_to_customize_your_console_login_message_tutorial.htm#motdhddtemp" target="_blank">(link)</a>, get a daily foturne <a href="https://www.linux.com/learn/tutorials/741573-put-a-talking-cow-in-your-linux-message-of-the-day/" target="_blank">(link)</a> and much more.

The possiblities are endless, but really the purpose is to display important
information to a user when they first login. So what's most important to you, and your team? Normally, when I login to one of my servers I'm doing one of a few things:

<ul>
  <li>Running Updates<br><em>A bash script that display's avalible updates (Default in Ubuntu)</em></li>
  <li>Adding / Update a Website<br><em>A bash script that display's how the server is organized and what sites are already on there</em></li>
  <li>Checking rkhunter &amp; tripwire logs<br><em>A bash script that alerts us to danger</em></li>
</ul>

If you have any other amazing scripts, drop a comment and let the world know!

<h2>Finding Ascii Art</h2>
There are plenty of sites out there that have Ascii Art, one of my favorite libraries to pick new art from is <a href="http://www.chris.com/ascii/" target="_blank">http://www.chris.com/ascii/</a>. When looking for Ascii Art, to put into your MOTD file, it's best to find one's that have less than 80 chars per line. <em>because <a href="https://en.wikipedia.org/wiki/Characters_per_line" target="_blank">IBM</a></em>

And if you can't find something you like, make your own with <a href="http://sourceforge.net/projects/ascgen2/" target="_blank">Ascii Generator 2</a>. I've found it best to use a flat image with no more that 3 colors.

<h2>Bonus! OrlandoDevs Ascii Art</h2>

<pre style="font-family:'Lucida Console', 'Courier New', 'Courier', monospace; font-size:9px; background-color:#000; color:#fff; line-height:1;">

                                                                            
                              1100000000011                                 
                         1100000000000000000001                             
                      100000011          1100000001                         
                   1000001                    1000000                       
                 100001                           00000                     
                00001          1111111111           10001                   
              10001       100000000000000000011       0000                  
             0000     1000000000000000000000000001     10001                
            0000    000000000000000000000000000000001    0001               
           0001   100000000000000000000000000000000000    000               
          1000   000000000000000000000000000000000000000   000              
          000   00000000000000000000000000000000000000000  1001             
         1001   00000000000000000000000000000000000000000   000             
        0000    0001  10000000000000000000000000000000000   10001           
        0001    000001   10000000000000000000000000000000    0001           
        000     000000    0000000000000000000000000000000     001           
        000     0001   1000000000000000000000000000000000     001           
        000     00001000000000000000000000000000000000000     001           
        000     00000000000111111111100000000000000000000     001           
        000     0000000000           00000000000000000000     001           
        000     0000000000000000000000000000000000000000      001           
        00000001  0000000000000000000000000000000000000  00000001           
        111110001  10000000000000000000000000000000001  000011101           
             10000   100000000000000000000000000000   10000                 
             1000001    100000000000000000000001     000000                 
             100 10000       110000000000011      10000 100                 
             1001  100001                       00000   000                 
              0000   100000011             11000001   10001                 
                00001    00000000000000000000001    00000                   
                 1000001     110000000000011     000001                     
                    10000001                110000001                       
                       10000000000000000000000001                           
                            11000000000000011                               
                                                                            
                                                                            
          _ \       |                 |       __ \                          
         |   |  __| |  _` | __ \   _` |  _ \  |   |  _ \\ \   / __|         
         |   | |    | (   | |   | (   | (   | |   |  __/ \ \ /\__ \         
        \___/ _|   _|\__,_|_|  _|\__,_|\___/ ____/ \___|  \_/ ____/         
                                                                            
                                                                            

</pre>

<pre style="font-family:'Lucida Console', 'Courier New', 'Courier', monospace; font-size:9px; background-color:#000; color:#fff; line-height:1;">

                                                                            
                                                                            
                              ############                                  
                          #####################                             
                      #########           ########                          
                    #####                      ######                       
                  #####                           #####                     
                ####              ####              #####                   
              #####       ####################        ####                  
             ####      ###########################      ###                 
            ####    ################################     ###                
           ####    ###################################    ###               
           ###   #######################################   ###              
          ####  #########################################  ####             
          ###   #########################################   ###             
        #####   ####   ##################################   #####           
        ###     #####   #################################     ###           
        ###     ######   ################################     ###           
        ###     ####    #################################     ###           
        ###     ####  ###################################     ###           
        ###     #########################################     ###           
        ###     ##########           ####################     ###           
        ###     ########################################      ###           
        #######   #####################################  ########           
         ########  ##################################   ########            
              ####    #############################    ####                 
             #######     #######################     ######                 
             ### #####       ##############        #### ###                 
             ####  ######                       #####   ###                 
              ####    #######               #######   #####                 
                ####     #######################    #####                   
                  #####       ############       ######                     
                    ########                 #######                        
                        #########################                           
                             ##############                                 
                                                                            
                                                                            
                                                                            
          _ \       |                 |       __ \                          
         |   |  __| |  _` | __ \   _` |  _ \  |   |  _ \\ \   / __|         
         |   | |    | (   | |   | (   | (   | |   |  __/ \ \ /\__ \         
        \___/ _|   _|\__,_|_|  _|\__,_|\___/ ____/ \___|  \_/ ____/         
                                                                            
                                                                            

</pre>
<pre style="font-family:'Lucida Console', 'Courier New', 'Courier', monospace; font-size:9px; background-color:#000; color:#fff; line-height:1;">

                                                                
                           2O@@@B@B@E;                          
                       7@B@B@MPkPXP@@B@BO:                      
                    u@B@BL            .5@@@@i                   
                  1@@B:                   7B@@r                 
                i@B@      :LSZG@B@0GUv.     .@B@                
               5@B,   i8@B@B@B@B@B@B@B@B@S.   YB@,              
              E@B   F@B@B@@@B@@@@@B@@@B@B@B@7  .B@:             
             u@B  7B@B@B@B@B@B@@@B@B@@@B@B@B@B. .B@             
             @@  N@@B@B@B@B@B@B@B@B@B@B@B@B@@@BL vB@            
            NBF  @@BJB@B@@@B@B@B@B@@@B@B@@@@@@@B  @B:           
           @@@   BB@. .LM@@@B@B@B@@@B@B@B@B@@@BB  7@@           
           B@7   M@B@L  uB@@@@@B@B@B@B@B@@@B@B@M   8@           
           @@7   BB@ .F@B@B@@@B@B@@@@@B@B@B@B@BB   O@           
           B@7   B@B@@@B@M@B@B@MBB@@@B@B@B@B@B@B   O@           
           @Bi   @B@B@@@@        @@@B@B@@@@@B@BB   EB           
           @@8ri  @@@B@B@B@B@B@@@B@B@B@B@@@B@B0 ,i;B@           
           @B@B@B  uB@B@B@B@B@B@B@B@B@B@B@B@B: Y@@B@B           
               5@B2  r@B@B@B@B@B@B@@@B@B@BM.  @B@,              
               XBMB@r   :FB@B@B@B@@@B@Mj.   P@@@B:              
               M@7 u@@M                  :@@@: 8@r              
               .B@B  iB@B@F:         rG@B@Z. .@@8               
                 r@@@:  .J@B@B@B@B@B@BM7   L@@@.                
                   :B@B@U,             :N@B@S                   
                       ;0B@B@M8ZOGOB@B@BF:                      
                                                                
                                                                
    _ \       |                 |       __ \                    
   |   |  __| |  _` | __ \   _` |  _ \  |   |  _ \\ \   / __|   
   |   | |    | (   | |   | (   | (   | |   |  __/ \ \ /\__ \   
  \___/ _|   _|\__,_|_|  _|\__,_|\___/ ____/ \___|  \_/ ____/   
                                                                
</pre>