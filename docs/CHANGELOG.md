# Changelog — KurooUI_WindVersion

## [v1.0.0-p5] - Persona 5 Edition Overhaul
- **Tema Default Baru: `Persona5`** — Palet hitam pekat (`#09090B`), merah Persona 5 (`#E60012`), dan putih tajam (`#FFFFFF`).
- **Border & Layout**:
  - Menambahkan **outer border merah 2px** (`WindowBorder`) di sekeliling Window utama.
  - Menambahkan **garis aksen merah 2px** (`TopbarAccentLine`) pemisah Topbar dan konten.
  - Menambahkan **border merah halus** pada Panel utama (`MainBar`) dan setiap kartu elemen (`CardBorder`), serta hover highlight merah.
  - Sudut lebih tajam & bergaya (`Radius = 10`, `ElementsRadius = 8`).
- **Komponen Slider & Kontrol**:
  - Slider menggunakan track putih transparan (6px), bar aktif **Merah Persona 5**, dan knob/thumb **Putih dengan ring Merah**.
  - Toggle & Checkbox menggunakan merah Persona 5 dengan indikator putih.
  - Tab aktif menyala merah dengan teks & ikon putih penuh.
- **Background Overlay**: Menambahkan `BackgroundOverlay` (dark scrim) otomatis saat memakai gambar latar agar teks tetap tajam dan terbaca (`BackgroundOverlayTransparency = 0.45`).
- **Rebranding**: Namespace `ScreenGui` (`KurooUI`, `KurooUI/Notifications`, `KurooUI/Dropdowns`, `KurooUI/Tooltips`) dan folder lokal (`KurooUI/`).

## [v1.1.0-p5] - Profile Card, Topbar Redesign, Persistent Settings & Cleanup Engine
- **Default ToggleKey = `K`** (tersimpan otomatis di `KurooUI/settings.json` dan `_G`/`getgenv`).
- **Sidebar Bottom Profile Card (Default Aktif)**: Menampilkan Avatar (ring merah), DisplayName di atas, `@username` di bawah, dan tombol **Settings Gear** khusus PC (otomatis tersembunyi di HP).
- **UI Settings Popup (PC)**:
  1. Atur **Toggle UI Keybind** secara live & tersimpan otomatis.
  2. **Toggle Hide/Unhide Floating Open Icon** khusus PC & tersimpan otomatis untuk eksekusi berikutnya.
- **Topbar Buttons Redesign**:
  - Tombol kiri (`power`) → **Unload UI** dengan dialog konfirmasi + Cleanup Engine.
  - Tombol tengah (`maximize`) → **Fullscreen / Melebarkan UI**.
  - Tombol kanan (`x`) → **Hide UI** (tidak destroy) + notifikasi singkat 2,5 detik.
- **Single-Instance Auto-Cleanup Engine**: Re-execute 2x otomatis mematikan semua Toggle aktif, memutus `Window:AddConnection(...)`, menjalankan `Window:OnUnload(...)`, dan menghapus UI lama tanpa menumpuk.
- **Default Open Icon Slot**: Menambahkan `KurooUI.DefaultOpenIcon` sebagai slot siap pakai untuk URL icon HP.
