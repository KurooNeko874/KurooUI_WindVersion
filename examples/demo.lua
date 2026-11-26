-- ============================================================================
-- KurooUI — WindVersion (Persona 5 Edition) — FULL SHOWCASE DEMO
-- Menampilkan seluruh komponen & fitur KurooUI v1.1.0-p5
-- ============================================================================

local RAW = "https://raw.githubusercontent.com/KurooNeko874/KurooUI_WindVersion/main"
local KurooUI = loadstring(game:HttpGet(RAW .. "/dist/KurooUI.lua"))()

local Window = KurooUI:CreateWindow({
    Title = "KurooUI",
    Author = "Persona 5 Edition",
    Folder = "KurooUI",
    Size = UDim2.fromOffset(580, 460),
    Theme = "Persona5",
    -- Default otomatis aktif:
    -- Background = wallpaper Persona 5 x Kuroo
    -- OpenButton.Icon = ikon bulat Persona 5 x Kuroo
    -- ToggleKey = K (bisa diubah lewat tombol Gear di kanan profil)
    -- User.Enabled = true (Avatar + DisplayName + @username)
})

-- Daftarkan Cleanup Engine (otomatis jalan saat Unload atau re-execute 2x)
Window:OnUnload(function()
    print("[KurooUI Demo] Unload & cleanup selesai!")
end)

-- ============================================================================
-- TAB 1: HOME / OVERVIEW
-- ============================================================================
local HomeTab = Window:Tab({
    Title = "Home",
    Icon = "home",
})

HomeTab:Paragraph({
    Title = "Selamat Datang di KurooUI — Persona 5 Edition",
    Desc = "UI Library berbasis WindUI dengan tema Hitam–Merah–Putih, Profile Card + UI Settings terintegrasi, Floating Icon bulat, dan Auto-Cleanup Engine saat re-execute.",
})

HomeTab:Section({ Title = "Quick Actions" })

HomeTab:Button({
    Title = "Send Calling Card (Test Notif)",
    Desc = "Menampilkan notifikasi gaya Persona 5",
    Callback = function()
        KurooUI:Notify({
            Title = "TAKE YOUR HEART",
            Content = "KurooUI Persona 5 Edition berjalan mulus!",
            Duration = 4,
        })
    end,
})

HomeTab:Button({
    Title = "Test Popup Dialog",
    Desc = "Membuka dialog konfirmasi bergaya Persona 5",
    Callback = function()
        Window:Dialog({
            Title = "Phantom Thieves Notice",
            Content = "Apakah kamu siap deploy KurooUI_WindVersion ke GitHub?",
            Buttons = {
                {
                    Title = "Batal",
                    Variant = "Secondary",
                    Callback = function()
                        print("[KurooUI] Dialog dibatalkan")
                    end,
                },
                {
                    Title = "Gas Deploy!",
                    Variant = "Primary",
                    Callback = function()
                        KurooUI:Notify({
                            Title = "Ready to Deploy",
                            Content = "Semua komponen terverifikasi!",
                            Duration = 3,
                        })
                    end,
                },
            },
        })
    end,
})

-- ============================================================================
-- TAB 2: COMBAT & MOVEMENT
-- ============================================================================
local CombatTab = Window:Tab({
    Title = "Combat",
    Icon = "flame",
})

CombatTab:Section({ Title = "Toggles" })

CombatTab:Toggle({
    Title = "Auto Dodge",
    Desc = "Menghindar otomatis dari serangan (mati otomatis saat Unload)",
    Value = true,
    Callback = function(state)
        print("[KurooUI] Auto Dodge:", state)
    end,
})

CombatTab:Toggle({
    Title = "Auto Parry",
    Desc = "Parry otomatis dengan timing presisi",
    Value = false,
    Callback = function(state)
        print("[KurooUI] Auto Parry:", state)
    end,
})

CombatTab:Section({ Title = "Sliders (Merah & Putih)" })

CombatTab:Slider({
    Title = "WalkSpeed",
    Desc = "Kecepatan lari karakter",
    Step = 1,
    Value = {
        Min = 16,
        Max = 150,
        Default = 55,
    },
    Callback = function(val)
        print("[KurooUI] WalkSpeed:", val)
    end,
})

CombatTab:Slider({
    Title = "JumpPower",
    Desc = "Tinggi lompatan karakter",
    Step = 5,
    Value = {
        Min = 50,
        Max = 200,
        Default = 75,
    },
    Callback = function(val)
        print("[KurooUI] JumpPower:", val)
    end,
})

-- ============================================================================
-- TAB 3: VISUALS & DROPDOWNS
-- ============================================================================
local VisualTab = Window:Tab({
    Title = "Visuals",
    Icon = "eye",
})

VisualTab:Section({ Title = "ESP & Target" })

VisualTab:Dropdown({
    Title = "Target Priority",
    Desc = "Pilih prioritas target (Single Select)",
    Values = { "Nearest", "Lowest HP", "Highest Threat", "Random" },
    Value = "Nearest",
    Callback = function(opt)
        print("[KurooUI] Target Priority:", opt)
    end,
})

VisualTab:Dropdown({
    Title = "ESP Elements",
    Desc = "Pilih beberapa elemen ESP sekaligus (Multi Select)",
    Values = { "Box", "Name", "Health Bar", "Distance", "Tracers" },
    Value = { "Box", "Name" },
    Multi = true,
    AllowNone = true,
    Callback = function(selected)
        print("[KurooUI] ESP Elements:", table.concat(selected, ", "))
    end,
})

VisualTab:Colorpicker({
    Title = "ESP Highlight Color",
    Desc = "Atur warna aksen ESP",
    Default = Color3.fromHex("#E60012"),
    Callback = function(color)
        print("[KurooUI] ESP Color:", color)
    end,
})

-- ============================================================================
-- TAB 4: MISC, INPUT, KEYBIND & CODE
-- ============================================================================
local MiscTab = Window:Tab({
    Title = "Misc",
    Icon = "sliders-horizontal",
})

MiscTab:Section({ Title = "Input & Keybind" })

MiscTab:Input({
    Title = "Custom Phantom Tag",
    Desc = "Masukkan nama tag kustom kamu",
    Placeholder = "Contoh: Joker / Kuroo...",
    Callback = function(text)
        print("[KurooUI] Custom Tag:", text)
    end,
})

MiscTab:Keybind({
    Title = "Quick Action Key",
    Desc = "Tombol shortcut fitur cepat",
    Value = "RightShift",
    Callback = function(key)
        print("[KurooUI] Quick Keybind:", key)
    end,
})

MiscTab:Section({ Title = "Script Snippet" })

MiscTab:Code({
    Title = "Loadstring KurooUI",
    Code = 'local KurooUI = loadstring(game:HttpGet("' .. RAW .. '/dist/KurooUI.lua"))()',
})
