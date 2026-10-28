-- hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("PATH", os.getenv("HOME") .. "/.local/bin:" .. (os.getenv("PATH") or ""))
