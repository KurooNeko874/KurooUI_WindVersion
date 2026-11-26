# KurooUI — WindVersion (Modified)

Custom modified Roblox UI Library built on top of **WindUI v1.6.65**, redesigned with Kuroo's signature aesthetic, custom background support (GitHub Raw / `rbxassetid://` / local asset), dark scrim overlay, and UI enhancements.

---

## Struktur Repository

```text
KurooUI_WindVersionModified/
├── dist/
│   └── KurooUI.lua                # File rilis siap pakai (loadstring)
├── src/
│   └── KurooUI_WindVersion.lua    # File pengembangan / modifikasi utama
├── assets/
│   ├── backgrounds/               # Wallpaper & background kustom (.png / .jpg)
│   ├── icons/                     # Logo & icon kustom KurooUI (.png)
│   └── previews/                  # Screenshot preview UI
├── examples/
│   └── demo.lua                   # Contoh script penggunaan
├── docs/
│   └── CHANGELOG.md               # Riwayat perubahan tiap versi
├── .gitignore
├── LICENSE
└── README.md
```

---

## Cara Menggunakan (Loadstring)

Ganti `<USERNAME>` dengan username GitHub kamu setelah repo ini di-upload:

```lua
local KurooUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/<USERNAME>/KurooUI_WindVersionModified/main/dist/KurooUI.lua"
))()

local Window = KurooUI:CreateWindow({
    Title = "KurooUI",
    Author = "by Kuroo",
    Folder = "KurooUI",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    -- Contoh memakai gambar background dari repo GitHub ini sendiri:
    Background = "https://raw.githubusercontent.com/<USERNAME>/KurooUI_WindVersionModified/main/assets/backgrounds/bg.png",
    BackgroundImageTransparency = 0.25,
})
```

---

## Cara Pakai Gambar dari Folder `assets/`

1. Taruh gambar kamu (rekomendasi `1024x768` atau `1024x812`, format `.png` / `.jpg`) ke dalam `assets/backgrounds/`.
2. Commit & push ke GitHub.
3. Gunakan link **GitHub Raw**:
   ```text
   https://raw.githubusercontent.com/<USERNAME>/KurooUI_WindVersionModified/main/assets/backgrounds/<nama-file>.png
   ```

---

## Credits

- **Original Library**: [WindUI](https://github.com/Footagesus/WindUI) by Footagesus (MIT License)
- **Modified & Customized by**: Kuroo
