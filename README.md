# KurooUI — WindVersion (Persona 5 Edition)

[![Version](https://img.shields.io/badge/version-1.1.0--p5-E60012?style=for-the-badge)](docs/CHANGELOG.md)
[![Theme](https://img.shields.io/badge/theme-Persona%205-09090B?style=for-the-badge&labelColor=E60012)](#fitur-unggulan)
[![License](https://img.shields.io/badge/license-MIT-FFFFFF?style=for-the-badge&labelColor=09090B)](LICENSE)

Roblox UI Library berbasis **WindUI v1.6.65** yang dirombak total dengan estetika **Persona 5 (Hitam, Merah `#E60012`, Putih)**, lengkap dengan background & ikon bulat bawaan, halaman **UI Settings** terintegrasi, **Single-Instance Auto-Cleanup Engine**, serta dukungan penuh untuk **PC & Mobile**.

---

## Fitur Unggulan

- **Persona 5 Signature Theme (Default)** — Latar hitam pekat (`#09090B`), outer border merah 2px, garis aksen merah di bawah Topbar, kartu elemen hitam matte ber-trim merah, teks putih tajam, serta Slider & Toggle berwarna **Merah–Putih**.
- **Built-in Custom Background & Smart Dark Scrim** — Background kustom aktif otomatis dengan lapisan *dark overlay* (`BackgroundOverlayTransparency = 0.55`) agar teks tetap kontras dan nyaman dibaca.
- **Circular Floating Open Icon (50×50)** — Ikon bulat murni ber-border merah yang bisa di-drag & diklik untuk membuka UI kembali (khusus HP selalu aktif; khusus PC bisa di-hide/unhide lewat UI Settings).
- **Default Sidebar Profile Card + UI Settings Page (PC)** — Avatar (ring merah), DisplayName di atas, `@username` di bawah, dan tombol **`⚙`** di kanan (otomatis tersembunyi di HP) yang membuka halaman **UI SETTINGS** langsung di panel kanan:
  - Ganti **Toggle UI Keybind** (default **`K`**) — tersimpan otomatis di `KurooUI/settings.json`.
  - Toggle **Show/Hide Floating Open Icon (PC)** — tersimpan otomatis untuk eksekusi berikutnya.
- **Topbar Modern**:
  - **Unload (`power`)** — Dialog konfirmasi lalu matikan semua fitur aktif & hapus UI.
  - **Fullscreen (`maximize`)** — Lebarkan / kembalikan ukuran Window.
  - **Hide (`x`)** — Menyembunyikan UI tanpa destroy (di PC muncul notif singkat pengingat tombol buka; di HP langsung hide tanpa notif).
- **Single-Instance Auto-Cleanup Engine** — Jika script di-execute 2 kali, UI lama otomatis dihancurkan, semua **Toggle aktif** dimatikan (`Set(false)`), semua `Window:AddConnection(...)` diputus, dan semua `Window:OnUnload(...)` dijalankan.

---

## Quick Start (`loadstring`)

```lua
local KurooUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/KurooNeko874/KurooUI_WindVersion/main/dist/KurooUI.lua"
))()

local Window = KurooUI:CreateWindow({
    Title = "KurooUI",
    Author = "by Kuroo",
    Folder = "KurooUI",
    Size = UDim2.fromOffset(580, 460),
    -- Theme = "Persona5",             -- Default otomatis Persona5
    -- Background = false,             -- Set false jika ingin mematikan wallpaper bawaan
    -- BackgroundOverlayTransparency = 0.55,
})

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "flame",
})

MainTab:Section({ Title = "Controls" })

MainTab:Toggle({
    Title = "Auto Farm",
    Desc = "Otomatis dimatikan saat UI di-Unload atau di-execute ulang",
    Value = false,
    Callback = function(state)
        print("Auto Farm:", state)
    end,
})

MainTab:Slider({
    Title = "WalkSpeed",
    Step = 1,
    Value = { Min = 16, Max = 120, Default = 50 },
    Callback = function(val)
        print("WalkSpeed:", val)
    end,
})

MainTab:Button({
    Title = "Send Calling Card",
    Desc = "Menampilkan notifikasi tes",
    Callback = function()
        KurooUI:Notify({
            Title = "TAKE YOUR HEART",
            Content = "KurooUI Persona 5 Edition aktif!",
            Duration = 3,
        })
    end,
})
```

Lihat contoh lengkap seluruh komponen di [`examples/demo.lua`](examples/demo.lua).

---

## Cleanup Engine (Anti-Dobel saat Re-Execute)

Daftarkan connection atau fungsi pembersihan agar otomatis berhenti saat UI di-**Unload** atau saat user **execute script 2 kali**:

```lua
local RunService = game:GetService("RunService")

-- Daftarkan RBXScriptConnection (otomatis di-Disconnect)
Window:AddConnection(RunService.RenderStepped:Connect(function()
    -- loop ESP / visual kamu
end))

-- Daftarkan callback custom saat Unload
Window:OnUnload(function()
    print("Semua fitur lama sudah dibersihkan!")
end)
```

---

## Kustomisasi Background & Floating Icon

Secara default, `KurooUI` sudah menggunakan aset bawaan dari repository ini:
- **Background**: `assets/backgrounds/KurooBijiluGwPelintir.jpg`
- **Floating Open Icon**: `assets/icons/BijiLuGwPelintir-Photoroom.png`

Untuk mengganti atau mematikan di script tertentu:
```lua
local Window = KurooUI:CreateWindow({
    Title = "My Hub",
    Background = "https://raw.githubusercontent.com/<USER>/<REPO>/main/assets/backgrounds/custom.png",
    BackgroundOverlayTransparency = 0.5, -- 0 = gelap penuh, 1 = tanpa overlay
    OpenButton = {
        Icon = "https://raw.githubusercontent.com/<USER>/<REPO>/main/assets/icons/custom_icon.png",
    },
})
```

---

## Struktur Repository

```text
KurooUI_WindVersion/
├── dist/
│   └── KurooUI.lua                            # File rilis tunggal siap loadstring
├── src/
│   └── KurooUI_WindVersion.lua                # Source pengembangan utama
├── assets/
│   ├── backgrounds/
│   │   └── KurooBijiluGwPelintir.jpg          # Default wallpaper Persona 5 x Kuroo
│   ├── icons/
│   │   └── BijiLuGwPelintir-Photoroom.png     # Default circular floating icon
│   └── previews/                              # Screenshot UI
├── examples/
│   └── demo.lua                               # Full demo semua komponen UI
├── docs/
│   └── CHANGELOG.md                           # Catatan rilis tiap versi
├── .gitignore
├── LICENSE
└── README.md
```

---

## Credits

- **Original Library**: [WindUI](https://github.com/Footagesus/WindUI) by Footagesus (MIT License)
- **Modified & Designed by**: **Kuroo** ([`KurooNeko874`](https://github.com/KurooNeko874))
