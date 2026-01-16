# hx2go

Work in progress Go target for the Haxe programming language.
Written in Haxe, open to contributions, stay tuned!

## Setup
- Go 1.21.3+
- Haxe nightly
- Download the necessary Haxe libraries with the commands below:
```sh
haxelib git hxparse https://github.com/Simn/hxparse
haxelib git haxeparser https://github.com/HaxeCheckstyle/haxeparser
```

<img width="1309" height="824" alt="picture of raylib on the Haxe Go target hx2go!" src="https://github.com/user-attachments/assets/d172e3af-2a0c-4c93-aa16-ba89169f8b08" />


## Code base layout 
```haxe
Main -> new Context().run() -> {
    _parser.run();
    for (module in modules)
        module.run();
}

// Module.run
function run() -> 
preprocessor -> 
transform -> 
translator -> 
sys.io.File.saveContent(definition.name, translatedContentString);
```
