eduke-game ACME convenience commands :P

// Make commands
◊make◊
◊make mapster◊

◊eduke32 -usecwd -j gamearchive -e1 -l3◊
◊mapster32 -usecwd -j ./gamearchive/ -m gamearchive/maps/flr2.map◊

◊nix run nixpkgs#sladeUnstable◊

// Open the wiki
https://wiki.eduke32.com/wiki/Main_Page

// eduke32 source
https://voidpoint.io/terminx/eduke32

// Git
◊git status◊
◊git diff◊
◊git pull◊
◊git commit -am "Art update"◊
◊git push◊

// Some plans
- Main menu
- Cutscene
- Enter building
- Tutorial floor
- Another cutscene
- Introduce fire
- Floor 2
- Another cutscene
- Introduce enemies (allow stealing them)
- Floor 3
- Another cutscene
- Boss fight

// Additional mechanics needed
- Cutscenes
- Picking up and throwing??? (SCOPE CREEP)
- Enemies
- Something to spend money on other than elevators
- Split mechanics into files
