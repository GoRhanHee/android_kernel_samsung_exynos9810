# SPDX-License-Identifier: GPL-2.0

# Galaxy Note9
dtb-y += exynos/exynos9810-crownlte_kor_21.dtb
dtb-y += exynos/exynos9810-crownlte_kor_19.dtb
dtb-y += exynos/exynos9810-crownlte_kor_26.dtb
dtb-y += exynos/exynos9810-crownlte_kor_18.dtb
dtb-y += exynos/exynos9810-crownlte_kor_23.dtb
dtb-y += exynos/exynos9810-crownlte_kor_25.dtb
dtb-y += exynos/exynos9810-crownlte_kor_24.dtb
dtb-y += exynos/exynos9810-crownlte_kor_17.dtb

# Galaxy S9
dtb-y += exynos/exynos9810-starlte_kor_17.dtb
dtb-y += exynos/exynos9810-starlte_kor_18.dtb
dtb-y += exynos/exynos9810-starlte_kor_23.dtb
dtb-y += exynos/exynos9810-starlte_kor_16.dtb
dtb-y += exynos/exynos9810-starlte_kor_26.dtb
dtb-y += exynos/exynos9810-starlte_kor_20.dtb

targets += dtbs
DTB_LIST  := $(dtb-y) $(dtbo-y)
always    := $(DTB_LIST)

dtbs: $(addprefix $(obj)/, $(DTB_LIST))

clean-files := *.dtb*
