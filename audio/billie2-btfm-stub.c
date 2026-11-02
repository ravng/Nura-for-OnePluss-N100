// SPDX-License-Identifier: GPL-2.0-only
/*
 * Register the Bengal machine driver's unused Bluetooth backend DAIs without
 * powering WCN3990. This lets the wired/internal audio card bind while native
 * Bluetooth support is unavailable. No PCM operation should be routed here.
 */
#include <linux/device.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/of_platform.h>
#include <linux/platform_device.h>
#include <sound/pcm.h>
#include <sound/soc.h>

static struct snd_soc_dai_driver billie2_btfm_dais[] = {
	{
		.name = "btfm_fm_slim_tx",
		.capture = {
			.stream_name = "FM TX Capture",
			.rates = SNDRV_PCM_RATE_48000,
			.formats = SNDRV_PCM_FMTBIT_S16_LE,
			.rate_min = 48000,
			.rate_max = 48000,
			.channels_min = 1,
			.channels_max = 2,
		},
	},
	{
		.name = "btfm_bt_sco_slim_tx",
		.capture = {
			.stream_name = "SCO TX Capture",
			.rates = SNDRV_PCM_RATE_8000_96000,
			.formats = SNDRV_PCM_FMTBIT_S16_LE,
			.rate_min = 8000,
			.rate_max = 96000,
			.channels_min = 1,
			.channels_max = 1,
		},
	},
	{
		.name = "btfm_bt_sco_a2dp_slim_rx",
		.playback = {
			.stream_name = "SCO A2DP RX Playback",
			.rates = SNDRV_PCM_RATE_8000_96000,
			.formats = SNDRV_PCM_FMTBIT_S16_LE,
			.rate_min = 8000,
			.rate_max = 96000,
			.channels_min = 1,
			.channels_max = 1,
		},
	},
	{
		.name = "btfm_bt_split_a2dp_slim_rx",
		.playback = {
			.stream_name = "SPLIT A2DP Playback",
			.rates = SNDRV_PCM_RATE_48000,
			.formats = SNDRV_PCM_FMTBIT_S16_LE,
			.rate_min = 48000,
			.rate_max = 48000,
			.channels_min = 1,
			.channels_max = 1,
		},
	},
};

static const struct snd_soc_component_driver billie2_btfm_component = {
	.name = "btfmslim_slave",
};


static struct platform_device *billie2_btfm_device;
static struct platform_device *billie2_q6core_device;

static int billie2_btfm_probe(struct platform_device *pdev)
{
	return snd_soc_register_component(&pdev->dev, &billie2_btfm_component,
		billie2_btfm_dais, ARRAY_SIZE(billie2_btfm_dais));
}

static int billie2_btfm_remove(struct platform_device *pdev)
{
	snd_soc_unregister_component(&pdev->dev);
	return 0;
}

static struct platform_driver billie2_btfm_driver = {
	.probe = billie2_btfm_probe,
	.remove = billie2_btfm_remove,
	.driver = {
		.name = "btfmslim_slave",
	},
};


static int __init billie2_btfm_stub_init(void)
{
	struct device_node *q6core;
	int ret;

	q6core = of_find_compatible_node(NULL, NULL, "qcom,q6core-audio");
	if (!q6core)
		return -ENODEV;

	billie2_q6core_device = of_platform_device_create(q6core, NULL, NULL);
	of_node_put(q6core);
	if (!billie2_q6core_device)
		return -ENODEV;

	ret = platform_driver_register(&billie2_btfm_driver);
	if (ret)
		goto unregister_q6core_device;

	billie2_btfm_device = platform_device_register_simple(
		"btfmslim_slave", PLATFORM_DEVID_NONE, NULL, 0);
	if (IS_ERR(billie2_btfm_device)) {
		ret = PTR_ERR(billie2_btfm_device);
		goto unregister_btfm_driver;
	}

	return 0;

unregister_btfm_driver:
	platform_driver_unregister(&billie2_btfm_driver);
unregister_q6core_device:
	platform_device_unregister(billie2_q6core_device);
	return ret;
}

static void __exit billie2_btfm_stub_exit(void)
{
	platform_device_unregister(billie2_btfm_device);
	platform_driver_unregister(&billie2_btfm_driver);
	platform_device_unregister(billie2_q6core_device);
}

module_init(billie2_btfm_stub_init);
module_exit(billie2_btfm_stub_exit);

MODULE_DESCRIPTION("OnePlus billie2 unavailable-BTFM ASoC stub");
MODULE_LICENSE("GPL v2");
