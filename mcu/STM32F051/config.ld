MEMORY {
	boot (rx) : ORIGIN = 0x8000000, LENGTH = 4K
	cfg (rx) : ORIGIN = ORIGIN(boot) + LENGTH(boot), LENGTH = 1K
	boot_version (rx) : ORIGIN = ORIGIN(cfg) + LENGTH(cfg), LENGTH = 1K
	rom (rx) : ORIGIN = ORIGIN(boot_version) + LENGTH(boot_version), LENGTH = 32K - LENGTH(boot) - LENGTH(cfg) - LENGTH(boot_version)
	vec (rx) : ORIGIN = 0x20000000, LENGTH = 192
	ram (rwx) : ORIGIN = ORIGIN(vec) + LENGTH(vec), LENGTH = 8K - LENGTH(vec)
}

_vec = ORIGIN(vec);
