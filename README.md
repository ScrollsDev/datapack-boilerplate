# Minecraft Datapack Boilerplate

A minimal, ready-to-use Minecraft datapack template. Clone and start building custom mechanics immediately.

## What's Included

This boilerplate provides the essential structure every datapack needs:
- Proper folder hierarchy for latest Minecraft versions
- Pre-configured load and tick functions
- Function tags already set up
- Automated setup scripts for quick customization
- Ready to use out of the box

## Quick Start

### 1. Use This Template
Click the green **"Use this template"** button on GitHub to create your own copy. Name it whatever you'd like for your datapack project.


### 2. Clone to Your Minecraft World
```bash
# Navigate to your world's datapacks folder
cd .minecraft/saves/YourWorldName/datapacks/

# Clone your repository
git clone git@github.com:YourUsername/your-datapack-name.git
cd your-datapack-name
```

### 3. Run Setup Script
**Windows (PowerShell):**
```powershell
.\setup.ps1 your_datapack_name
```

**Mac/Linux:**
```bash
chmod +x setup.sh
./setup.sh your_datapack_name
```

The script will automatically:
- Rename the `namespace` folder to your datapack name
- Update all function tags to reference your datapack
- Prepare everything for immediate use

**Example:**
```powershell
.\setup.ps1 your_datapack_name
```

### 4. Start Building
Edit your functions and add commands in your datapack's function folder:
- `data/your_datapack_name/function/load.mcfunction`
- `data/your_datapack_name/function/tick.mcfunction`

### 5. Install to Minecraft

**Single Player:**
1. Copy your datapack folder to `.minecraft/saves/<world_name>/datapacks/`
2. Run `/reload` in-game or restart the world

**Server:**
1. Copy your datapack folder to `<server_directory>/<world_name>/datapacks/`
2. Run `/reload` or restart the server

## Manual Setup (Without Scripts)

If you prefer to set up manually:

1. Rename `data/namespace/` to `data/your_datapack_name/`
2. Edit `data/minecraft/tags/function/load.json`:
```json
   {
     "values": [
       "your_datapack_name:load"
     ]
   }
```
3. Edit `data/minecraft/tags/function/tick.json`:
```json
   {
     "values": [
       "your_datapack_name:tick"
     ]
   }
```

## File Structure
```
datapack-boilerplate/
├── setup.ps1                      # Windows setup script (optional - can delete after setup)
├── setup.sh                       # Mac/Linux setup script (optional - can delete after setup)
├── pack.mcmeta                    # Datapack metadata (version info)
├── README.md
├── .gitignore
└── data/
    ├── namespace/                 # Replace with your datapack name
    │   └── function/
    │       ├── load.mcfunction    # Runs once on /reload
    │       └── tick.mcfunction    # Runs 20 times per second
    └── minecraft/                 # Minecraft namespace (don't rename)
        └── tags/
            └── function/
                ├── load.json      # Tells MC to run your load function
                └── tick.json      # Tells MC to run your tick function
```

**Note:** The setup scripts are only needed once. After running them, you can safely delete `setup.ps1`, `setup.sh`, and `README.md` if you want a cleaner datapack folder. Only the `pack.mcmeta` and `data/` folder are required for Minecraft.

## Functions Explained

### load.mcfunction
Runs **once** when the datapack loads or `/reload` is executed.

**Common uses:**
- Initialize scoreboards
- Set up teams
- Display load confirmation messages
- One-time setup commands

**Example:**
```mcfunction
# Initialize scoreboard
scoreboard objectives add myScore dummy "My Score"

# Confirmation message
say Datapack loaded!
```

### tick.mcfunction
Runs **every game tick** (20 times per second, or every 0.05 seconds).

**Common uses:**
- Continuous detection
- Repeating effects
- Game loop mechanics
- Constant checks

**Example:**
```mcfunction
# Give players who are sneaking speed
execute as @a[predicate=minecraft:sneaking] run effect give @s minecraft:speed 1 0 true
```

**⚠️ Warning:** Keep tick.mcfunction efficient! Commands here run 20 times per second.

## Naming Rules

Your datapack name must follow Minecraft's naming conventions:
- **Lowercase only** (no uppercase letters)
- **Alphanumeric characters** (a-z, 0-9)
- **Underscores allowed** (_)
- **No spaces or special characters**

✅ **Good:** `my_datapack`, `cool_mechanics`, `game_v2`  
❌ **Bad:** `MyDatapack`, `my-datapack`, `Cool Mechanics`

## Minecraft Versions

This boilerplate uses `pack_format: 88` for **Minecraft 1.21.9+** (The Copper Age)

### Pack Format for Other Versions
Update `pack_format` in `pack.mcmeta` to match your Minecraft version:

[Full pack format list →](https://minecraft.wiki/w/Pack_format#List_of_data_pack_formats)

**Note:** Using the wrong pack format will show a warning in-game but may still work. Always use the correct format for your target version.

## Resources

- **[Datapack Wiki](https://datapack.wiki/)** - Comprehensive datapack documentation and tutorials
- **[ScrollsDev YouTube](https://youtube.com/@ScrollsDev)** - Datapack tutorials and coding guides
- **[Minecraft Commands](https://minecraft.wiki/w/Commands)** - Official command reference
- **[Misode's Generators](https://misode.github.io/)** - JSON generators for datapacks

## Learn More

Want to learn datapack development? Check out my YouTube channel **[ScrollsDev](https://youtube.com/@ScrollsDev)** for beginner-friendly tutorials, advanced techniques, and full project breakdowns.