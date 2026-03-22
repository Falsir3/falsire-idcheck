# ID Check Script (Standalone FiveM)

A lightweight, standalone FiveM script that lets players toggle nearby player IDs and triggers a randomized, immersive `/me` action each time the keybind is used. If there are any issues please open one, and I will look at fixing it. Though, it should be a straight forward drag and drop script with no issues. As it's been tested. 

---

## This Script Features: 

- Toggle nearby player IDs on/off
- Default keybind: **U**
- Fully **rebindable** in FiveM settings
- Randomized, immersive `/me` messages
- Clean 3D text display above players
- No framework required (Standalone)
- Minimal performance impact

---

## Installation - This is super simple lol 

1. Download this and put it in your resources folder. If you're using QBOX place it in [standalone] if you wish to.
2. Add the resource to your `server.cfg` -- Not needed if you put this in your [standalone] folder in QBOX. 
3. Restart your server and check your txadmin to see if the script has started. 

---

## Usage

- Press **U** to toggle nearby player IDs
- Each press:
- Toggles the ID display
- Sends a **random immersive `/me` action**

---

##  Keybind

- Default: **U**
- Can be changed in-game

---

## Immersive /me Messages

Each time the key is pressed, a random message is selected to keep things natural and fun, for example:

- adjusts their shirt collar for no apparent reason  
- stares off into the distance briefly  
- lets out a small sigh  
- checks their watch even though it’s probably broken  
- wipes imaginary dust off their clothes  
- blinks a few times like they forgot something  

You can easily customize these inside `client.lua`.

---

## Configuration

You can modify the script by editing `client.lua`:

### Change display distance
```lua
if distance < 15.0 then