# !N0rmie FiveM trigger executor detector
<br />
<p align="center">
  <p align="center">
    A basic system that is prepared to detect FiveM Trigger executors and protect your servers!
    <br />
    If you need help or something you can open a issue.
    <img src="https://github.com/N0rmie/Fivem-Trigger-Protector/blob/main/image.png?raw=true">
  </p>
</p>

## Usage

* Add this on the top of the fxmanifest.lua/__resource.lua in resource that you want to protect:
    shared_scripts {'atrigger.lua'}
* Inside the resource folder put the file that can be found in this repo
* To protect a trigger:
 Original | Protected
--- | ---
TriggerServerEvent("test") | secured_TriggerServerEvent("test")
AddEventHandler("test") | secured_AddEventHandler("test")
RegisterServerEvent("test") | secured_RegisterServerEvent("test")
Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3
    
*Example: [Example](https://streamable.com/cb49wm)

## License

Distributed under the MIT License. See `LICENSE` for more information.
