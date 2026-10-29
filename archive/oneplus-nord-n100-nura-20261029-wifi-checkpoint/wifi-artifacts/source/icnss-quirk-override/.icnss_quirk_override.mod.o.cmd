cmd_/tmp/icnss-quirk-override/icnss_quirk_override.mod.o := clang -Wp,-MD,/tmp/icnss-quirk-override/.icnss_quirk_override.mod.o.d -nostdinc -isystem /usr/lib/llvm-18/lib/clang/18/include -I/tmp/kernel-oneplus-sm4250/arch/arm64/include -I./arch/arm64/include/generated  -I/tmp/kernel-oneplus-sm4250/include -I./include -I/tmp/kernel-oneplus-sm4250/drivers/oneplus/include -I/tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I/tmp/kernel-oneplus-sm4250/include/uapi -I./include/generated/uapi -include /tmp/kernel-oneplus-sm4250/include/linux/kconfig.h -include /tmp/kernel-oneplus-sm4250/include/linux/compiler_types.h  -I/tmp/icnss-quirk-override -I/tmp/icnss-quirk-override -D__KERNEL__ -mlittle-endian -Qunused-arguments -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Wimplicit-function-declaration -Wno-format-security -std=gnu89 --target=aarch64-linux-gnu --prefix=/tmp/kernel-toolchain/usr/bin/ --gcc-toolchain=/tmp/kernel-toolchain/usr -no-integrated-as -Wunknown-warning-option -fno-PIE -mno-implicit-float -DCONFIG_AS_LSE=1 -fno-asynchronous-unwind-tables -Wno-psabi -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-int-in-bool-context -Wno-address-of-packed-member -O2 -Wframe-larger-than=2048 -fstack-protector-strong --target=aarch64-linux-gnu --gcc-toolchain=/tmp/kernel-toolchain/usr -meabi gnu -Wno-format-invalid-specifier -Wno-gnu -Wno-duplicate-decl-specifier -Wno-asm-operand-widths -Wno-initializer-overrides -fno-builtin -Wno-tautological-constant-out-of-range-compare -Wno-tautological-compare -mno-global-merge -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -Wvla -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-merge-all-constants -fno-stack-check -Wimplicit-int -Wstrict-prototypes -Wdate-time -Wincompatible-pointer-types -fmacro-prefix-map=/tmp/kernel-oneplus-sm4250/= -Wno-initializer-overrides -Wno-unused-value -Wno-format -Wno-sign-compare -Wno-format-zero-length -Wno-uninitialized  -DKBUILD_BASENAME='"icnss_quirk_override.mod"' -DKBUILD_MODNAME='"icnss_quirk_override"' -DMODULE  -c -o /tmp/icnss-quirk-override/icnss_quirk_override.mod.o /tmp/icnss-quirk-override/icnss_quirk_override.mod.c

source_/tmp/icnss-quirk-override/icnss_quirk_override.mod.o := /tmp/icnss-quirk-override/icnss_quirk_override.mod.c

deps_/tmp/icnss-quirk-override/icnss_quirk_override.mod.o := \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/retpoline.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/kconfig.h \
    $(wildcard include/config/cpu/big/endian.h) \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/compiler-clang.h \
    $(wildcard include/config/cfi/clang.h) \
    $(wildcard include/config/lto/clang.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/build-salt.h \
    $(wildcard include/config/build/salt.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/elfnote.h \
  /tmp/kernel-oneplus-sm4250/include/linux/elf.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/elf.h \
    $(wildcard include/config/compat.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/hwcap.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi/asm/hwcap.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/ptrace.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi/asm/ptrace.h \
  /tmp/kernel-oneplus-sm4250/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/types.h \
  arch/arm64/include/generated/uapi/asm/types.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/types.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/int-ll64.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/int-ll64.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi/asm/bitsperlong.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitsperlong.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/bitsperlong.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/posix_types.h \
  /tmp/kernel-oneplus-sm4250/include/linux/stddef.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/stddef.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi/asm/posix_types.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/posix_types.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi/asm/sigcontext.h \
  /tmp/kernel-oneplus-sm4250/include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/bug/on/data/corruption.h) \
    $(wildcard include/config/panic/on/data/corruption.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/bug.h \
  /tmp/kernel-oneplus-sm4250/include/linux/stringify.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/asm-bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/brk-imm.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
    $(wildcard include/config/smp.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/barrier.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/barrier.h \
  /tmp/kernel-oneplus-sm4250/include/linux/kasan-checks.h \
  /tmp/kernel-oneplus-sm4250/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/tracing.h) \
  /usr/lib/llvm-18/lib/clang/18/include/stdarg.h \
  /usr/lib/llvm-18/lib/clang/18/include/__stdarg___gnuc_va_list.h \
  /usr/lib/llvm-18/lib/clang/18/include/__stdarg_va_list.h \
  /usr/lib/llvm-18/lib/clang/18/include/__stdarg_va_arg.h \
  /usr/lib/llvm-18/lib/clang/18/include/__stdarg___va_copy.h \
  /usr/lib/llvm-18/lib/clang/18/include/__stdarg_va_copy.h \
  /tmp/kernel-oneplus-sm4250/include/linux/linkage.h \
  /tmp/kernel-oneplus-sm4250/include/linux/export.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/have/arch/prel32/relocations.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/linkage.h \
  /tmp/kernel-oneplus-sm4250/include/linux/bitops.h \
  /tmp/kernel-oneplus-sm4250/include/linux/bits.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/bitops.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/builtin-__ffs.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/builtin-ffs.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/builtin-__fls.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/builtin-fls.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/ffz.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/fls64.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/sched.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/hweight.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/arch_hweight.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/const_hweight.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/atomic.h \
  /tmp/kernel-oneplus-sm4250/include/linux/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/atomic.h \
    $(wildcard include/config/arm64/lse/atomics.h) \
    $(wildcard include/config/as/lse.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/lse.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/atomic_ll_sc.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/cmpxchg.h \
  /tmp/kernel-oneplus-sm4250/include/linux/build_bug.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/atomic-long.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/lock.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/non-atomic.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/le.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi/asm/byteorder.h \
  /tmp/kernel-oneplus-sm4250/include/linux/byteorder/little_endian.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/byteorder/little_endian.h \
  /tmp/kernel-oneplus-sm4250/include/linux/swab.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/swab.h \
  arch/arm64/include/generated/uapi/asm/swab.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/swab.h \
  /tmp/kernel-oneplus-sm4250/include/linux/byteorder/generic.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /tmp/kernel-oneplus-sm4250/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/typecheck.h \
  /tmp/kernel-oneplus-sm4250/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/quiet.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
    $(wildcard include/config/strict/module/rwx.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/kern_levels.h \
  /tmp/kernel-oneplus-sm4250/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/kernel.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/sysinfo.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/cache.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/cputype.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/sysreg.h \
    $(wildcard include/config/broken/gas/inst.h) \
    $(wildcard include/config/arm64/pa/bits/52.h) \
    $(wildcard include/config/arm64/4k/pages.h) \
    $(wildcard include/config/arm64/16k/pages.h) \
    $(wildcard include/config/arm64/64k/pages.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/compiler.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/ptrace.h \
  arch/arm64/include/generated/asm/user.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/user.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/gcc/plugin/stackleak.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/string.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/string.h \
    $(wildcard include/config/arch/has/uaccess/flushcache.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/alternative.h \
    $(wildcard include/config/arm64/uao.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/cpucaps.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/insn.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/cpufeature.h \
    $(wildcard include/config/arm64/sw/ttbr0/pan.h) \
    $(wildcard include/config/arm64/sve.h) \
    $(wildcard include/config/arm64/ssbd.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/hw_breakpoint.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/virt.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/sections.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/sections.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/pgtable-hwdef.h \
    $(wildcard include/config/pgtable/levels.h) \
    $(wildcard include/config/arm64/pa/bits.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/memory.h \
    $(wildcard include/config/memplus.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/page/owner/enable/default.h) \
    $(wildcard include/config/arm64/va/bits.h) \
    $(wildcard include/config/kasan/extra.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/debug/align/rodata.h) \
    $(wildcard include/config/blk/dev/initrd.h) \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/const.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/const.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/page-def.h \
    $(wildcard include/config/arm64/page/shift.h) \
    $(wildcard include/config/arm64/cont/shift.h) \
  arch/arm64/include/generated/asm/sizes.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/sizes.h \
  /tmp/kernel-oneplus-sm4250/include/linux/sizes.h \
  /tmp/kernel-oneplus-sm4250/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/pfn.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/fpsimd.h \
  arch/arm64/include/generated/uapi/asm/errno.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/errno.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/errno-base.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/elf.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/elf-em.h \
  /tmp/kernel-oneplus-sm4250/include/linux/module.h \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/function/error/injection.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/stat.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/stat.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi/asm/stat.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/stat.h \
  /tmp/kernel-oneplus-sm4250/include/linux/compat_time.h \
  /tmp/kernel-oneplus-sm4250/include/linux/time64.h \
    $(wildcard include/config/64bit/time.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  arch/arm64/include/generated/asm/div64.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/div64.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/time.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/compat.h \
  /tmp/kernel-oneplus-sm4250/include/linux/sched.h \
    $(wildcard include/config/control/center.h) \
    $(wildcard include/config/uxchain.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/sched/walt.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/preempt/notifiers.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/psi.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/memcg/kmem.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/cpu/freq/times.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/posix/timers.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/intel/rdt.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/rseq.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/kcov.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/opchain.h) \
    $(wildcard include/config/im.h) \
    $(wildcard include/config/houston.h) \
    $(wildcard include/config/arch/task/struct/on/stack.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/rseq.h) \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/sched.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/current.h \
  /tmp/kernel-oneplus-sm4250/include/linux/pid.h \
  /tmp/kernel-oneplus-sm4250/include/linux/rculist.h \
  /tmp/kernel-oneplus-sm4250/include/linux/rcupdate.h \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/irqflags.h \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/irqflags.h \
  /tmp/kernel-oneplus-sm4250/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/trace/preempt/toggle.h) \
  arch/arm64/include/generated/asm/preempt.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/preempt.h \
  /tmp/kernel-oneplus-sm4250/include/linux/thread_info.h \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/restart_block.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/thread_info.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/stack_pointer.h \
  /tmp/kernel-oneplus-sm4250/include/linux/bottom_half.h \
  /tmp/kernel-oneplus-sm4250/include/linux/lockdep.h \
    $(wildcard include/config/lock/stat.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/bitmap.h \
  /tmp/kernel-oneplus-sm4250/include/linux/rcutree.h \
  /tmp/kernel-oneplus-sm4250/include/linux/sem.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/sem.h \
  /tmp/kernel-oneplus-sm4250/include/linux/ipc.h \
  /tmp/kernel-oneplus-sm4250/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/spinlock_types.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/spinlock_types.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/qspinlock_types.h \
    $(wildcard include/config/paravirt.h) \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/qrwlock_types.h \
  /tmp/kernel-oneplus-sm4250/include/linux/rwlock_types.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/spinlock.h \
  arch/arm64/include/generated/asm/qrwlock.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/qrwlock.h \
  arch/arm64/include/generated/asm/qspinlock.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/qspinlock.h \
  /tmp/kernel-oneplus-sm4250/include/linux/rwlock.h \
  /tmp/kernel-oneplus-sm4250/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/highuid.h \
  /tmp/kernel-oneplus-sm4250/include/linux/rhashtable-types.h \
  /tmp/kernel-oneplus-sm4250/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/osq_lock.h \
  /tmp/kernel-oneplus-sm4250/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/ktime.h \
  /tmp/kernel-oneplus-sm4250/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/seqlock.h \
  /tmp/kernel-oneplus-sm4250/include/linux/time32.h \
  /tmp/kernel-oneplus-sm4250/include/linux/jiffies.h \
  /tmp/kernel-oneplus-sm4250/include/linux/timex.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/timex.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/param.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi/asm/param.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/param.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/timex.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/arch_timer.h \
    $(wildcard include/config/arm/arch/timer/ool/workaround.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/errno.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/errno.h \
  /tmp/kernel-oneplus-sm4250/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/smp.h \
    $(wildcard include/config/arm64/acpi/parking/protocol.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/percpu.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
    $(wildcard include/config/virtualization.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /tmp/kernel-oneplus-sm4250/include/clocksource/arm_arch_timer.h \
    $(wildcard include/config/arm/arch/timer.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/timecounter.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/timex.h \
  include/generated/timeconst.h \
  /tmp/kernel-oneplus-sm4250/include/linux/timekeeping.h \
  /tmp/kernel-oneplus-sm4250/include/linux/timekeeping32.h \
  /tmp/kernel-oneplus-sm4250/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/ipc.h \
  arch/arm64/include/generated/uapi/asm/ipcbuf.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/ipcbuf.h \
  /tmp/kernel-oneplus-sm4250/include/linux/refcount.h \
    $(wildcard include/config/refcount/full.h) \
  arch/arm64/include/generated/uapi/asm/sembuf.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/sembuf.h \
  /tmp/kernel-oneplus-sm4250/include/linux/shm.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/page.h \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/personality.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/personality.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/pgtable-types.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/pgtable-nopud.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/pgtable-nop4d-hack.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/5level-fixup.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/getorder.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/shm.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm64/include/generated/uapi/asm/shmbuf.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/shmbuf.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/shmparam.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/shmparam.h \
  /tmp/kernel-oneplus-sm4250/include/linux/kcov.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/kcov.h \
  /tmp/kernel-oneplus-sm4250/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/rbtree.h \
  /tmp/kernel-oneplus-sm4250/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/timerqueue.h \
  /tmp/kernel-oneplus-sm4250/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/seccomp.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/seccomp.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/unistd.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi/asm/unistd.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/unistd.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/unistd.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/seccomp.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/unistd.h \
  /tmp/kernel-oneplus-sm4250/include/linux/nodemask.h \
    $(wildcard include/config/highmem.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/resource.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/resource.h \
  arch/arm64/include/generated/uapi/asm/resource.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/resource.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/resource.h \
  /tmp/kernel-oneplus-sm4250/include/linux/latencytop.h \
  /tmp/kernel-oneplus-sm4250/include/linux/sched/prio.h \
  /tmp/kernel-oneplus-sm4250/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/signal.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi/asm/signal.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/signal.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/signal.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/signal-defs.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/uapi/asm/siginfo.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/asm-generic/siginfo.h \
  /tmp/kernel-oneplus-sm4250/include/linux/mm_types_task.h \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/rseq.h \
  /tmp/kernel-oneplus-sm4250/include/oneplus/control_center/control_center_helper.h \
  /tmp/kernel-oneplus-sm4250/include/linux/sched/task_stack.h \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/magic.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/stat.h \
  /tmp/kernel-oneplus-sm4250/include/linux/kmod.h \
  /tmp/kernel-oneplus-sm4250/include/linux/umh.h \
  /tmp/kernel-oneplus-sm4250/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/cma.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/defrag.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/oneplus/healthinfo.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/wait.h \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/wait.h \
  /tmp/kernel-oneplus-sm4250/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/sparsemem.h \
    $(wildcard include/config/hotplug/size/bits.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/notifier.h \
    $(wildcard include/config/tree/srcu.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
    $(wildcard include/config/rwsem/prio/aware.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/err.h \
  arch/arm64/include/generated/asm/rwsem.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/rwsem.h \
  /tmp/kernel-oneplus-sm4250/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/srcu.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/rcu_segcblist.h \
  /tmp/kernel-oneplus-sm4250/include/linux/srcutree.h \
  /tmp/kernel-oneplus-sm4250/include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/completion.h \
  /tmp/kernel-oneplus-sm4250/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/topology.h \
  /tmp/kernel-oneplus-sm4250/include/linux/arch_topology.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/topology.h \
  /tmp/kernel-oneplus-sm4250/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /tmp/kernel-oneplus-sm4250/include/uapi/linux/sysctl.h \
  /tmp/kernel-oneplus-sm4250/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/sysfs.h \
  /tmp/kernel-oneplus-sm4250/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/idr.h \
  /tmp/kernel-oneplus-sm4250/include/linux/radix-tree.h \
    $(wildcard include/config/radix/tree/multiorder.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/kobject_ns.h \
  /tmp/kernel-oneplus-sm4250/include/linux/kref.h \
  /tmp/kernel-oneplus-sm4250/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/rbtree_latch.h \
  /tmp/kernel-oneplus-sm4250/include/linux/error-injection.h \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/error-injection.h \
  /tmp/kernel-oneplus-sm4250/include/linux/cfi.h \
    $(wildcard include/config/cfi/clang/shadow.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/tracepoint-defs.h \
  /tmp/kernel-oneplus-sm4250/include/linux/static_key.h \
  /tmp/kernel-oneplus-sm4250/arch/arm64/include/asm/module.h \
    $(wildcard include/config/arm64/module/plts.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/randomize/base.h) \
  /tmp/kernel-oneplus-sm4250/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /tmp/kernel-oneplus-sm4250/include/linux/vermagic.h \
  include/generated/utsrelease.h \

/tmp/icnss-quirk-override/icnss_quirk_override.mod.o: $(deps_/tmp/icnss-quirk-override/icnss_quirk_override.mod.o)

$(deps_/tmp/icnss-quirk-override/icnss_quirk_override.mod.o):
