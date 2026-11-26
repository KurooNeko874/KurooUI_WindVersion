-- Contoh penggunaan KurooUI_WindVersionModified
-- Ganti <USERNAME> dengan username GitHub kamu setelah repo di-upload

local GITHUB_RAW = "https://raw.githubusercontent.com/<USERNAME>/KurooUI_WindVersionModified/main"

local KurooUI = loadstring(game:HttpGet(GITHUB_RAW .. "/dist/KurooUI.lua"))()

local Window = KurooUI:CreateWindow({
    Title = "KurooUI",
    Author = "Kuroo",
    Folder = "KurooUI",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    -- Ganti 'bg.png' sesuai nama file gambar di assets/backgrounds/
    Background = GITHUB_RAW .. "/assets/backgrounds/bg.png",
    BackgroundImageTransparency = 0.25,
})

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "home",
})

MainTab:Section({ Title = "Quick Controls" })

MainTab:Button({
    Title = "Test Notification",
    Desc = "Menampilkan notifikasi tes dari KurooUI",
    Callback = function()
        KurooUI:Notify({
            Title = "KurooUI",
            Content = "KurooUI_WindVersion berhasil berjalan!",
            Duration = 3,
        })
    end,
})

MainTab:Toggle({
    Title = "Auto Farm",
    Desc = "Contoh toggle element",
    Value = false,
    Callback = function(state)
        print("Auto Farm:", state)
    end,
})

MainTab:Slider({
    Title = "WalkSpeed",
    Step = 1,
    Value = {
        Min = 16,
        Max = 100,
        Default = 16,
    },
    Callback = function(value)
        print("WalkSpeed:", value)
    end,
})
