SECTIONS {
	.boot_version : {
		_boot_version = .;
		. = . + 4;  // 为引导程序版本号保留4字节
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
