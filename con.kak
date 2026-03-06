provide-module conscriptsyntax %&
    add-highlighter shared/conscript regions
    add-highlighter shared/conscript/ region '"' '"' fill string
    add-highlighter shared/conscript/ region '//' '\n' fill comment

    # Not-stuff
    add-highlighter shared/conscript/other default-region group
    add-highlighter shared/conscript/other/ regex (\s|^)0x[0-9A-F]+|[0-9]+\s 0:value
    # Keywords
    add-highlighter shared/conscript/other/ regex (^|\s)(scalevar|clamp|ife|ifn|ifg|ifge|ifa|ifae|ifl|ifle|ifb|ifbe|ifand|ifor|ifxor|ifboth|ifeither|set|or|and|xor|actor|sprite|actorvar|tspr|projectile|thisprojectile|sector|wall|player|playervar|input|userdef|tiledata|paldata|a|av|s|w|p|pv|i|uset|add|sub|var|mul|div|include|includedefault|define|dynamicremap|dynamicsoundremap|setcfgname|setdefname|setgamename|precache|scriptsize|cheatkeys|definecheat|definegamefuncname|definegametype|definevolumename|definevolumeflags|definelevelname|defineskillname|undefinevolume|undefinelevel|undefineskill|ifrespawn|ifmultiplayer|ifclient|ifserver|gamestartup|spritenopal|spritenoshade|spritenvg|spriteshadow|actor|useractor|enda|onevent|appendevent|endevent|state|defstate|ends|prependstate|appendstate|nullop|else|switch|endswitch|case|default|break|continue|exit|return|terminate|getcurraddress|jump|whilevarl|whilevarvarl|whilevare|whilevarn|whilevarvarn|gamevar|gamearray|setvar|setvarvar|setarray|addvar|addvarvar|subvar|subvarvar|mulvar|mulvarvar|divvar|divvarvar|modvar|modvarvar|andvar|andvarvar|orvar|orvarvar|xorvar|xorvarvar|randvar|randvarvar|ifvare|ifvarn|ifvarg|ifvarl|ifvarand|ifvaror|ifvarxor|ifvareither|ifvarvare|ifvarvarn|ifvarvarg|ifvarvarl|ifvarvarand|ifvarvaror|ifvarvarxor|ifvarvareither|sqrt|calchypotenuse|sin|cos|shiftvarl|shiftvarr|mulscale|getangle|getincangle|getarraysize|getarraysequence|resizearray|copy|setarray|setarraysequence|readgamevar|savegamevar|readarrayfromfile|writearraytofile|getthisprojectile|setthisprojectile|cactor|action|ai|move|count|resetactioncount|resetcount|cstat|cstator|clipdist|sizeat|sizeto|strength|addstrength|spritepal|getlastpal|sleeptime|spriteflags|angoff|angoffvar|changespritesect|changespritestat|setsprite|ifactor|ifaction|ifactioncount|ifai|ifcount|ifmove|ifspawnedby|ifspritepal|ifstrength|ifhitweapon|ifwasweapon|ifdead|ifactornotstayput|fall|insertspriteq|killit|movesprite|ssp|clipmove|clipmovenoslide|dist|ldist|cansee|canseespr|hitradius|hitradiusvar|flash|ifawayfromwall|ifbulletnear|ifceilingdistl|iffloordistl|ifgapzl|ifsquished|ifnotmoving|ifinwater|ifonwater|ifoutside|ifinspace|ifinouterspace|ifrnd|mikesnd|respawnhitag|ifangdiffl|ifcansee|ifcanseetarget|ifcanshoottarget|ifhitspace|getangletotarget|spawn|espawn|espawnvar|qspawn|qspawnvar|eqspawn|eqspawnvar|debris|guts|lotsofglass|mail|money|paper|defineprojectile|shoot|shootvar|eshoot|eshootvar|zshoot|zshootvar|ezshoot|ezshootvar|addammo|addinventory|addweapon|addweaponvar|addphealth|tossweapon|gmaxammo|smaxammo|checkavailinven|checkavailweapon|addkills|lockplayer|resetplayer|resetplayerflags|ifgotweaponce|ifp|ifpdistg|ifpdistl|ifphealthl|ifpinventory|ifplayersl|operate|operateactivators|operatemasterswitches|operaterespawns|operatesectors|activatebysector|activate|dragpoint|movesector|sectsetinterpolation|sectclearinterpolation|getceilzofslope|getflorzofslope|getzrange|updatesector|updatesectorz|checkactivatormotion|rotatepoint|lineintersect|rayintersect|sectorofwall|findnearactor|findnearactor3d|findnearactor3dvar|findnearactorvar|findnearactorz|findnearactorzvar|findnearsprite|findnearsprite3d|findnearsprite3dvar|findnearspritevar|findnearspritez|findnearspritezvar|findotherplayer|findplayer|neartag|hitscan|headspritesect|headspritestat|nextspritesect|nextspritestat|prevspritesect|prevspritestat|definesound|sound|soundvar|soundonce|soundoncevar|globalsound|globalsoundvar|screensound|stopsound|stopsoundvar|stopactorsound|stopallsounds|ifsound|ifactorsound|ifnosounds|setactorsoundpitch|music|starttrack|starttrackvar|getmusicposition|setmusicposition|definequote|redefinequote|quote|userquote|qsprintf|qstrcpy|qstrcat|qstrncat|qstrlen|qsubstr|qstrdim|qgetsysstr|getpname|getkeyname|startcutscene|ifcutscene|palfrom|guniqhudid|setgamepalette|setaspect|wackplayer|quake|pkick|pstomp|tip|rotatesprite|rotatesprite16|rotatespritea|screentext|gametext|gametextz|minitext|digitalnumber|digitalnumberz|showview|showviewunbiased|displayrand|displayrandvar|displayrandvarvar|getticks|gettimedate|activatecheat|startlevel|inittimer|endofgame|endoflevel|cmenu|save|savenn|loadmapstate|savemapstate|clearmapstate|debug|addlog|addlogvar|echo)\s 0:keyword
    # Structures
    add-highlighter shared/conscript/other/ regex (^|\s)(get|set)?(actor|sprite|actorvar|tspr|projectile|thisprojectile|sector|wall|player|playervar|input|userdef|tiledata|paldata|a|av|s|w|p|pv|i|u)(?=\[) 0:function
    # Attributes
    add-highlighter shared/conscript/other/ regex (?<=\.)\w+(\s|$) 0:attribute
&


hook global WinSetOption filetype=conscript %{
    require-module conscriptsyntax

    add-highlighter window/conscript ref conscript

    hook -once -always window WinSetOption filetype=.* %{
        remove-highlighter window/conscript
    }
}

hook global BufCreate .*\.(con|CON)$ %{
    set-option buffer filetype conscript
}
