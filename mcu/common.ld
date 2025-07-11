SECTIONS {
	.cfg : {
		_cfg_start = .;
		*(.cfg)
		. = ALIGN(8);
		_cfg_end = .;
	} >ram AT >cfg

	.boot_version : {
        	_boot_version_start = .;
        	KEEP(*(.boot_version)) /* 强制保留该段，防止被优化 */
        	. = ALIGN(4);          /* 4字节对齐 */
        	_boot_version_end = .;
    	} >ram AT >cfg  /* >ram: 运行地址，>cfg: 加载地址（紧接.cfg段后） */
}

_boot = ORIGIN(boot);
_cfg = ORIGIN(cfg);
_boot_version_flash_addr = ORIGIN(cfg) + SIZEOF(.cfg); /* 版本号在Flash中的绝对地址 */
_rom = ORIGIN(rom);
_ram = ORIGIN(ram);

INCLUDE cortex-m-generic.ld
