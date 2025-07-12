_rom = ORIGIN(rom);
_rom_end = ORIGIN(rom) + LENGTH(rom);
_boot_version_start = ORIGIN(rom) + LENGTH(rom) + 2K;
_ram_end = ORIGIN(ram) + LENGTH(ram);

INCLUDE cortex-m-generic.ld
