# Xiaomi / Redmi / Poco HyperOS 3 (Android 16) Ad Removal via ADB

> **This guide is intended for Xiaomi / Redmi / Poco devices running HyperOS 3 + Android 16.**
>
> The procedures described here **do not require root access** and do not permanently delete system applications. Apps are only removed for the current user (user 0).

---

# Warning

This guide is intended exclusively for removing ads, recommendation systems, and unwanted Xiaomi services.

**Do not remove system-critical packages**, such as:

- Launcher (`com.miui.home`)
- Security Center (`com.miui.securitycenter`)
- Security Core (`com.miui.securitycore`)
- Xiaomi Account (`com.xiaomi.account`)
- Google Play Services (`com.google.android.gms`)
- System UI components

---

# 1. Enable Developer Mode

On your phone:

1. Open **Settings**
2. Go to **About phone**
3. Tap the **HyperOS version** repeatedly
4. After several taps, you will see:

   ```text
   You are now a developer.
   ```

---

# 2. Enable USB Debugging

On your phone:

1. Settings
2. Additional settings
3. Developer options
4. Enable:

   - USB debugging
   - USB debugging (Security settings) *(if available)*

---

# 3. Connect the Phone

1. Connect your phone via USB cable
2. Authorize USB debugging on the phone
3. Open Command Prompt or run the batch file

Verification:

```cmd
platform-tools\adb.exe devices
```

If successful:

```text
List of devices attached
XXXXXXXXXXXX    device
```

---

# 4. Remove Ad Components

Running the `clearAds.bat` file included in the project will remove Xiaomi ad and recommendation systems.

The script typically removes the following packages:

| Package | Function |
|----------|----------|
| com.miui.analytics | Telemetry |
| com.miui.android.fashiongallery | Wallpaper Carousel ads |
| com.miui.bugreport | Bug reporting |
| com.miui.daemon | Daemon |
| com.miui.msa.global | Xiaomi ad platform |
| com.xiaomi.discover | Discover recommendations |
| com.xiaomi.mipicks | GetApps |
| com.xiaomi.ugd | Promotional service |

---

# 5. Useful ADB Commands

## List all packages

```cmd
platform-tools\adb.exe shell pm list packages
```

## List Xiaomi packages

```cmd
platform-tools\adb.exe shell pm list packages | findstr /i miui
```

## List Google packages

```cmd
platform-tools\adb.exe shell pm list packages | findstr /i google
```

---

# 6. Manually uninstall an app

Example:

```cmd
platform-tools\adb.exe shell pm uninstall --user 0 com.xiaomi.mipicks
```

Successful output:

```text
Success
```

---

# 7. Restore an application

If you later need a removed app again:

```cmd
platform-tools\adb.exe shell cmd package install-existing com.xiaomi.mipicks
```