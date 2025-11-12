# 🧩 About this project

An **external compatibility tool** that adds **Lua scripting support** to the **Arizona Mobile** client through the external **MonetLoader** library - a Lua script loader for **GTA: San Andreas 2.00**, available at [t.me/monetloader](https://t.me/monetloader).   

This launcher build also integrates the **MTG Tools** module.
It is responsible for:
- 🧩 Automatically unpacking MonetLoader resource files
- 🗒️ Automatically installing default lua scripts
- 🔄 Checking if your launcher version is up to date
- 💰 Controlling Unity Ads behavior

> Ads are included only as a way to support the project.  
> They appear **once at startup**, and **do not interrupt gameplay**.
> Ads can be **disabled** in the launcher (available for VIP users).

> This is an **independent third-party project**, created solely to extend  
> **Lua compatibility for Arizona Mobile**, and is **not affiliated with or endorsed by**  
> **Arizona Games**, **Rockstar Games**, or any of their partners.  
> All trademarks belong to their respective owners.
---

## ⚙️ Features

### 🧠 Launcher Modifications
- 🧩 Injects **MonetLoader** support into the game
- 🧩 Integrates **MTG Tools** & **Unity Ads**
- 📂 Includes default MonetLoader resource files
- 📂 Includes default lua scripts

### ⚙️ MonetLoader Integration
- Supports Lua-based scripts (x32 only)

### 🧰 MTG Tools
- Injects `MtgTools.initialize(Activity, Context)` into the main launcher entry
- Automatically installs MonetLoader resource files (Lua libraries, default helper scripts, and related assets)
- Displays custom toast with the build version
- Checks for updates of the modified MonetLoader launcher
- Provides hooks for **MTG MODS VIP** system

### 💰 Unity Ads
- Loads and displays ads using the Unity SDK
- Integrated via `Ads.java`
- Logs ad events (loaded, failed, closed, etc.)

---

## 📂 Project Structure

```bash
├── build_launcher.py                   # Main build automation script
├── apktool.jar                         # Decompiler/Recompiler
├── apksigner.jar                       # APK signing tool
├── key.jks                             # Keystore (replace with your own)
├── files/assets/                       # MonetLoader resource files
├── files/lib/                          # MonetLoader & LuaJIT libraries
├── files/smali_classes_*               # Injected custom smali code
├── java_source/MtgTools.java           # Core MTG integration logic
├── java_source/AssetExtractor.java     # Extracts required resource files
├── java_source/CheckUpdate.java        # Update check manager
└── java_source/Ads.java                # Unity Ads integration
```

# 🚀 Usage
### 1️⃣ Requirements
- **Python 3.10+**
- **Java 8+**
- **Keystore for signing final APK** *(if not provided — unsigned apk will be saved)*
---
### 2️⃣ Build Process
1. **Clone** this repository to your local machine  
2. **Edit** `build_launcher.py` — insert your keystore data for signing:
```bash
KEY_ALIAS = "key0"      # your key
KEY_PASS = "password"   # your key pass
```
3. Run the build script in terminal:
```bash
python build_launcher.py
```
The script will:
- 📥 Download or use the local Arizona launcher APK
- 🧩 Decompile it using apktool
- 🚫 Disable auto-updates in the client
- 🔗 Inject MonetLoader, MTG Tools, and Unity Ads
- 🏗️ Recompile and sign the final APK

### 🧪 Example build logs
```bash
[INFO] ⌚ Decompiling your apk...
[INFO] ✅ APK decompiled!
[INFO] ✅ Successful connected MonetLoader!
[INFO] ✅ Successful connected MtgTools!
[INFO] ⌚ Recompiling APK...
[INFO] ✅ Recompiling succces!
[INFO] ℹ️ Your launcher: MonetLoader v16.5.1.apk
```

---

# 📜 License
- This project is released under the MIT License.
- You are free to modify, distribute, and build upon it, provided proper attribution is given.
