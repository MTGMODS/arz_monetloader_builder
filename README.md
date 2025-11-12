# 🎮 Arizona Online Launcher — MonetLoader Edition

## 🧩 About this project

Modified **Arizona Online Launcher** with **Lua script** support using **MonetLoader**.  

This version integrates the external **MonetLoader** libnary — a Lua script loader for **GTA: San Andreas 2.00**  
(and **Arizona Mobile** client in particular) — available at [t.me/monetloader](https://t.me/monetloader).  

The launcher also includes **MTG Tools**, a custom module developed specifically for this modified launcher.  
It is responsible for:
- 🧩 Automatically unpacking MonetLoader resource files
- 🗒️ Automatically installing default lua scripts 
- 🔄 Managing launcher updates
- 💰 Controlling Unity Ads behavior

> Ads are included only as a way to support the project.  

> They appear **once at startup**, and **do not interrupt gameplay**.

> Ads can be **disabled** in the launcher (available for VIP users).

---

## ⚙️ Features

### 🧠 Launcher Modifications
- 🔧 Automated decompile/recompile of APK via `apktool.jar`
- 🚫 Disables the auto-update check
- 🏷️ Renames package to `com.arizona.game`
- 🪪 Changes app name to **Arizona RPG**
- 🧩 Injects **MonetLoader** support into the launcher
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
├── java_source/AssetExtractor.java     # Extracts required resource files
├── java_source/MtgTools.java           # Core MTG integration logic
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
[INFO] ✅ Successfully renamed!
[INFO] ✅ Client updates disabled!
[INFO] ✅ Successful connected MonetLoader!
[INFO] ✅ Successful connected MtgTools!
[INFO] ⌚ Recompiling APK...
[INFO] ✅ Recompiling succces!
[INFO] ⌚ Signing APK...
[INFO] ✅ Signed successfully!
[INFO] ℹ️ Your signed launcher: MonetLoader v16.5.1.apk
```

---

# 📜 License
- This project is released under the MIT License.
- You are free to modify, distribute, and build upon it, provided proper attribution is given.