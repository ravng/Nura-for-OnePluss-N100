#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>

static unsigned long quirks_addr;
module_param(quirks_addr, ulong, 0400);
static unsigned long quirks_value;
module_param(quirks_value, ulong, 0400);
MODULE_PARM_DESC(quirks_value, "Replacement value for the downstream ICNSS quirks variable");

MODULE_PARM_DESC(quirks_addr, "Runtime address of the downstream ICNSS quirks variable");

static unsigned long *icnss_quirks;
static unsigned long saved_quirks;

static int __init icnss_quirk_override_init(void)
{
	if (!quirks_addr)
		return -EINVAL;

	icnss_quirks = (unsigned long *)quirks_addr;
	saved_quirks = READ_ONCE(*icnss_quirks);
	WRITE_ONCE(*icnss_quirks, quirks_value);
	pr_info("icnss_quirk_override: quirks %#lx -> %#lx\n",
		saved_quirks, quirks_value);
	return 0;
}

static void __exit icnss_quirk_override_exit(void)
{
	if (icnss_quirks)
		WRITE_ONCE(*icnss_quirks, saved_quirks);
}

module_init(icnss_quirk_override_init);
module_exit(icnss_quirk_override_exit);
MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("Disable downstream ICNSS firmware rejuvenation at runtime");
