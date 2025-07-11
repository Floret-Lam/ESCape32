SECTIONS {
	/* 引导版本号存储在单独的页 */
	.boot_version : {
		_boot_version = .;
		KEEP(*(.boot_version)) /* 确保不会被优化掉 */
		. = ALIGN(PAGE_SIZE);  /* 独占一个完整页 */
	} >cfg

	.cfg : {
		_cfg_start = .;
		*(.cfg)
		. = ALIGN(8);
		_cfg_end = .;
	} >ram AT >cfg
}

_boot = ORIGIN(boot);
_cfg = ORIGIN(cfg);
_rom = ORIGIN(rom);
_ram = ORIGIN(ram);

INCLUDE cortex-m-generic.ld
