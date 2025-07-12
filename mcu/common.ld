SECTIONS {
	.cfg : {
		_cfg_start = .;
		*(.cfg)
		. = ALIGN(8);
		_cfg_end = .;
	} >ram AT >cfg

	.boot_version : {
		_boot_version_start = .;
		KEEP(*(.boot_version))  /* 强制保留该段 */
		. = ALIGN(4);           /* 对齐到4字节 */
		_boot_version_end = .;
		. = ORIGIN(boot_version) + LENGTH(boot_version) - 16;	/* 添加大小限制（示例为16字节） */
	} >boot_version
}

_boot = ORIGIN(boot);
_cfg = ORIGIN(cfg);
_boot_version = ORIGIN(boot_version);
_rom = ORIGIN(rom);
_ram = ORIGIN(ram);

INCLUDE cortex-m-generic.ld
