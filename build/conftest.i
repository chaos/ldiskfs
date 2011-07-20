# 1 "/g/g0/bass6/ldiskfs/build/conftest.c"
# 1 "/usr/src/kernels/2.6.18-107chaos//"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "./include/linux/autoconf.h" 1
# 1 "<command line>" 2
# 1 "/g/g0/bass6/ldiskfs/build/conftest.c"
# 23 "/g/g0/bass6/ldiskfs/build/conftest.c"
# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h" 1
# 10 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h"
# 1 "/usr/lib/gcc/x86_64-redhat-linux/4.1.2/include/stdarg.h" 1 3 4
# 43 "/usr/lib/gcc/x86_64-redhat-linux/4.1.2/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 105 "/usr/lib/gcc/x86_64-redhat-linux/4.1.2/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 11 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h" 2
# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/linkage.h" 1



# 1 "/lib/modules/2.6.18-107chaos/build/include/asm/linkage.h" 1
# 5 "/lib/modules/2.6.18-107chaos/build/include/linux/linkage.h" 2
# 12 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h" 2
# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/stddef.h" 1



# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/compiler.h" 1
# 42 "/lib/modules/2.6.18-107chaos/build/include/linux/compiler.h"
# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/compiler-gcc4.h" 1



# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/compiler-gcc.h" 1
# 5 "/lib/modules/2.6.18-107chaos/build/include/linux/compiler-gcc4.h" 2
# 43 "/lib/modules/2.6.18-107chaos/build/include/linux/compiler.h" 2
# 5 "/lib/modules/2.6.18-107chaos/build/include/linux/stddef.h" 2
# 15 "/lib/modules/2.6.18-107chaos/build/include/linux/stddef.h"
enum {
 false = 0,
 true = 1
};
# 13 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h" 2
# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/types.h" 1
# 14 "/lib/modules/2.6.18-107chaos/build/include/linux/types.h"
# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/posix_types.h" 1
# 36 "/lib/modules/2.6.18-107chaos/build/include/linux/posix_types.h"
typedef struct {
 unsigned long fds_bits [(1024/(8 * sizeof(unsigned long)))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "/lib/modules/2.6.18-107chaos/build/include/asm/posix_types.h" 1
# 10 "/lib/modules/2.6.18-107chaos/build/include/asm/posix_types.h"
typedef unsigned long __kernel_ino_t;
typedef unsigned int __kernel_mode_t;
typedef unsigned long __kernel_nlink_t;
typedef long __kernel_off_t;
typedef int __kernel_pid_t;
typedef int __kernel_ipc_pid_t;
typedef unsigned int __kernel_uid_t;
typedef unsigned int __kernel_gid_t;
typedef unsigned long __kernel_size_t;
typedef long __kernel_ssize_t;
typedef long __kernel_ptrdiff_t;
typedef long __kernel_time_t;
typedef long __kernel_suseconds_t;
typedef long __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef int __kernel_daddr_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;


typedef long long __kernel_loff_t;


typedef struct {
 int val[2];
} __kernel_fsid_t;

typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;
typedef __kernel_uid_t __kernel_uid32_t;
typedef __kernel_gid_t __kernel_gid32_t;

typedef unsigned long __kernel_old_dev_t;




static __inline__ __attribute__((always_inline)) void __FD_SET(unsigned long fd, __kernel_fd_set *fdsetp)
{
 unsigned long _tmp = fd / (8 * sizeof(unsigned long));
 unsigned long _rem = fd % (8 * sizeof(unsigned long));
 fdsetp->fds_bits[_tmp] |= (1UL<<_rem);
}


static __inline__ __attribute__((always_inline)) void __FD_CLR(unsigned long fd, __kernel_fd_set *fdsetp)
{
 unsigned long _tmp = fd / (8 * sizeof(unsigned long));
 unsigned long _rem = fd % (8 * sizeof(unsigned long));
 fdsetp->fds_bits[_tmp] &= ~(1UL<<_rem);
}


static __inline__ __attribute__((always_inline)) int __FD_ISSET(unsigned long fd, __const__ __kernel_fd_set *p)
{
 unsigned long _tmp = fd / (8 * sizeof(unsigned long));
 unsigned long _rem = fd % (8 * sizeof(unsigned long));
 return (p->fds_bits[_tmp] & (1UL<<_rem)) != 0;
}






static __inline__ __attribute__((always_inline)) void __FD_ZERO(__kernel_fd_set *p)
{
 unsigned long *tmp = p->fds_bits;
 int i;

 if (__builtin_constant_p((1024/(8 * sizeof(unsigned long))))) {
  switch ((1024/(8 * sizeof(unsigned long)))) {
   case 32:
     tmp[ 0] = 0; tmp[ 1] = 0; tmp[ 2] = 0; tmp[ 3] = 0;
     tmp[ 4] = 0; tmp[ 5] = 0; tmp[ 6] = 0; tmp[ 7] = 0;
     tmp[ 8] = 0; tmp[ 9] = 0; tmp[10] = 0; tmp[11] = 0;
     tmp[12] = 0; tmp[13] = 0; tmp[14] = 0; tmp[15] = 0;
     tmp[16] = 0; tmp[17] = 0; tmp[18] = 0; tmp[19] = 0;
     tmp[20] = 0; tmp[21] = 0; tmp[22] = 0; tmp[23] = 0;
     tmp[24] = 0; tmp[25] = 0; tmp[26] = 0; tmp[27] = 0;
     tmp[28] = 0; tmp[29] = 0; tmp[30] = 0; tmp[31] = 0;
     return;
   case 16:
     tmp[ 0] = 0; tmp[ 1] = 0; tmp[ 2] = 0; tmp[ 3] = 0;
     tmp[ 4] = 0; tmp[ 5] = 0; tmp[ 6] = 0; tmp[ 7] = 0;
     tmp[ 8] = 0; tmp[ 9] = 0; tmp[10] = 0; tmp[11] = 0;
     tmp[12] = 0; tmp[13] = 0; tmp[14] = 0; tmp[15] = 0;
     return;
   case 8:
     tmp[ 0] = 0; tmp[ 1] = 0; tmp[ 2] = 0; tmp[ 3] = 0;
     tmp[ 4] = 0; tmp[ 5] = 0; tmp[ 6] = 0; tmp[ 7] = 0;
     return;
   case 4:
     tmp[ 0] = 0; tmp[ 1] = 0; tmp[ 2] = 0; tmp[ 3] = 0;
     return;
  }
 }
 i = (1024/(8 * sizeof(unsigned long)));
 while (i) {
  i--;
  *tmp = 0;
  tmp++;
 }
}
# 48 "/lib/modules/2.6.18-107chaos/build/include/linux/posix_types.h" 2
# 15 "/lib/modules/2.6.18-107chaos/build/include/linux/types.h" 2
# 1 "/lib/modules/2.6.18-107chaos/build/include/asm/types.h" 1





typedef unsigned short umode_t;






typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;

typedef __signed__ long long __s64;
typedef unsigned long long __u64;
# 36 "/lib/modules/2.6.18-107chaos/build/include/asm/types.h"
typedef signed char s8;
typedef unsigned char u8;

typedef signed short s16;
typedef unsigned short u16;

typedef signed int s32;
typedef unsigned int u32;

typedef signed long long s64;
typedef unsigned long long u64;

typedef u64 dma64_addr_t;
typedef u64 dma_addr_t;
typedef u64 phys_addr_t;

typedef u64 sector_t;
# 16 "/lib/modules/2.6.18-107chaos/build/include/linux/types.h" 2



typedef __u32 __kernel_dev_t;

typedef __kernel_fd_set fd_set;
typedef __kernel_dev_t dev_t;
typedef __kernel_ino_t ino_t;
typedef __kernel_mode_t mode_t;
typedef __kernel_nlink_t nlink_t;
typedef __kernel_off_t off_t;
typedef __kernel_pid_t pid_t;
typedef __kernel_daddr_t daddr_t;
typedef __kernel_key_t key_t;
typedef __kernel_suseconds_t suseconds_t;
typedef __kernel_timer_t timer_t;
typedef __kernel_clockid_t clockid_t;
typedef __kernel_mqd_t mqd_t;


typedef _Bool bool;

typedef __kernel_uid32_t uid_t;
typedef __kernel_gid32_t gid_t;
typedef __kernel_uid16_t uid16_t;
typedef __kernel_gid16_t gid16_t;



typedef __kernel_old_uid_t old_uid_t;
typedef __kernel_old_gid_t old_gid_t;
# 58 "/lib/modules/2.6.18-107chaos/build/include/linux/types.h"
typedef __kernel_loff_t loff_t;
# 67 "/lib/modules/2.6.18-107chaos/build/include/linux/types.h"
typedef __kernel_size_t size_t;




typedef __kernel_ssize_t ssize_t;




typedef __kernel_ptrdiff_t ptrdiff_t;




typedef __kernel_time_t time_t;




typedef __kernel_clock_t clock_t;




typedef __kernel_caddr_t caddr_t;



typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;


typedef unsigned char unchar;
typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;




typedef __u8 u_int8_t;
typedef __s8 int8_t;
typedef __u16 u_int16_t;
typedef __s16 int16_t;
typedef __u32 u_int32_t;
typedef __s32 int32_t;



typedef __u8 uint8_t;
typedef __u16 uint16_t;
typedef __u32 uint32_t;


typedef __u64 uint64_t;
typedef __u64 u_int64_t;
typedef __s64 int64_t;
# 142 "/lib/modules/2.6.18-107chaos/build/include/linux/types.h"
typedef unsigned long blkcnt_t;
# 171 "/lib/modules/2.6.18-107chaos/build/include/linux/types.h"
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;

typedef __u64 __le64;
typedef __u64 __be64;



typedef unsigned gfp_t;
typedef unsigned fmode_t;


typedef u64 resource_size_t;






struct ustat {
 __kernel_daddr_t f_tfree;
 __kernel_ino_t f_tinode;
 char f_fname[6];
 char f_fpack[6];
};
# 14 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h" 2

# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/bitops.h" 1
# 9 "/lib/modules/2.6.18-107chaos/build/include/linux/bitops.h"
# 1 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h" 1







# 1 "/lib/modules/2.6.18-107chaos/build/include/asm/alternative.h" 1






# 1 "/lib/modules/2.6.18-107chaos/build/include/asm/cpufeature.h" 1
# 8 "/lib/modules/2.6.18-107chaos/build/include/asm/alternative.h" 2

struct alt_instr {
 u8 *instr;
 u8 *replacement;
 u8 cpuid;
 u8 instrlen;
 u8 replacementlen;
 u8 pad[5];
};

extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);

struct module;


extern void alternatives_smp_module_add(struct module *mod, char *name,
     void *locks, void *locks_end,
     void *text, void *text_end);
extern void alternatives_smp_module_del(struct module *mod);
extern void alternatives_smp_switch(int smp);
# 9 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h" 2
# 22 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) void set_bit(int nr, volatile void * addr)
{
 __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 8\n" "  .quad 661f\n" ".previous\n" "661:\n\tlock; "
  "btsl %1,%0"
  :"+m" ((*(volatile long *) addr))
  :"dIr" (nr) : "memory");
}
# 39 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) void __set_bit(int nr, volatile void * addr)
{
 __asm__ volatile(
  "btsl %1,%0"
  :"+m" ((*(volatile long *) addr))
  :"dIr" (nr) : "memory");
}
# 57 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) void clear_bit(int nr, volatile void * addr)
{
 __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 8\n" "  .quad 661f\n" ".previous\n" "661:\n\tlock; "
  "btrl %1,%0"
  :"+m" ((*(volatile long *) addr))
  :"dIr" (nr));
}

static __inline__ __attribute__((always_inline)) void __clear_bit(int nr, volatile void * addr)
{
 __asm__ __volatile__(
  "btrl %1,%0"
  :"+m" ((*(volatile long *) addr))
  :"dIr" (nr));
}
# 85 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) void __change_bit(int nr, volatile void * addr)
{
 __asm__ __volatile__(
  "btcl %1,%0"
  :"+m" ((*(volatile long *) addr))
  :"dIr" (nr));
}
# 102 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) void change_bit(int nr, volatile void * addr)
{
 __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 8\n" "  .quad 661f\n" ".previous\n" "661:\n\tlock; "
  "btcl %1,%0"
  :"+m" ((*(volatile long *) addr))
  :"dIr" (nr));
}
# 118 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) int test_and_set_bit(int nr, volatile void * addr)
{
 int oldbit;

 __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 8\n" "  .quad 661f\n" ".previous\n" "661:\n\tlock; "
  "btsl %2,%1\n\tsbbl %0,%0"
  :"=r" (oldbit),"+m" ((*(volatile long *) addr))
  :"dIr" (nr) : "memory");
 return oldbit;
}
# 138 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) int __test_and_set_bit(int nr, volatile void * addr)
{
 int oldbit;

 __asm__(
  "btsl %2,%1\n\tsbbl %0,%0"
  :"=r" (oldbit),"+m" ((*(volatile long *) addr))
  :"dIr" (nr));
 return oldbit;
}
# 157 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) int test_and_clear_bit(int nr, volatile void * addr)
{
 int oldbit;

 __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 8\n" "  .quad 661f\n" ".previous\n" "661:\n\tlock; "
  "btrl %2,%1\n\tsbbl %0,%0"
  :"=r" (oldbit),"+m" ((*(volatile long *) addr))
  :"dIr" (nr) : "memory");
 return oldbit;
}
# 177 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) int __test_and_clear_bit(int nr, volatile void * addr)
{
 int oldbit;

 __asm__(
  "btrl %2,%1\n\tsbbl %0,%0"
  :"=r" (oldbit),"+m" ((*(volatile long *) addr))
  :"dIr" (nr));
 return oldbit;
}


static __inline__ __attribute__((always_inline)) int __test_and_change_bit(int nr, volatile void * addr)
{
 int oldbit;

 __asm__ __volatile__(
  "btcl %2,%1\n\tsbbl %0,%0"
  :"=r" (oldbit),"+m" ((*(volatile long *) addr))
  :"dIr" (nr) : "memory");
 return oldbit;
}
# 208 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) int test_and_change_bit(int nr, volatile void * addr)
{
 int oldbit;

 __asm__ __volatile__( ".section .smp_locks,\"a\"\n" "  .align 8\n" "  .quad 661f\n" ".previous\n" "661:\n\tlock; "
  "btcl %2,%1\n\tsbbl %0,%0"
  :"=r" (oldbit),"+m" ((*(volatile long *) addr))
  :"dIr" (nr) : "memory");
 return oldbit;
}
# 228 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) int constant_test_bit(int nr, const volatile void * addr)
{
 return ((1UL << (nr & 31)) & (((const volatile unsigned int *) addr)[nr >> 5])) != 0;
}

static __inline__ __attribute__((always_inline)) int variable_test_bit(int nr, volatile const void * addr)
{
 int oldbit;

 __asm__ __volatile__(
  "btl %2,%1\n\tsbbl %0,%0"
  :"=r" (oldbit)
  :"m" ((*(volatile long *) addr)),"dIr" (nr));
 return oldbit;
}
# 251 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
extern long find_first_zero_bit(const unsigned long * addr, unsigned long size);
extern long find_next_zero_bit (const unsigned long * addr, long size, long offset);
extern long find_first_bit(const unsigned long * addr, unsigned long size);
extern long find_next_bit(const unsigned long * addr, long size, long offset);


static inline __attribute__((always_inline)) unsigned long __scanbit(unsigned long val, unsigned long max)
{
 asm("bsfq %1,%0 ; cmovz %2,%0" : "=&r" (val) : "r" (val), "r" (max));
 return val;
}
# 286 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
extern unsigned long
find_next_zero_string(unsigned long *bitmap, long start, long nbits, int len);

static inline __attribute__((always_inline)) void set_bit_string(unsigned long *bitmap, unsigned long i,
      int len)
{
 unsigned long end = i + len;
 while (i < end) {
  __set_bit(i, bitmap);
  i++;
 }
}

static inline __attribute__((always_inline)) void __clear_bit_string(unsigned long *bitmap, unsigned long i,
        int len)
{
 unsigned long end = i + len;
 while (i < end) {
  __clear_bit(i, bitmap);
  i++;
 }
}







static __inline__ __attribute__((always_inline)) unsigned long ffz(unsigned long word)
{
 __asm__("bsfq %1,%0"
  :"=r" (word)
  :"r" (~word));
 return word;
}







static __inline__ __attribute__((always_inline)) unsigned long __ffs(unsigned long word)
{
 __asm__("bsfq %1,%0"
  :"=r" (word)
  :"rm" (word));
 return word;
}







static __inline__ __attribute__((always_inline)) unsigned long __fls(unsigned long word)
{
 __asm__("bsrq %1,%0"
  :"=r" (word)
  :"rm" (word));
 return word;
}



# 1 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/bitops/sched.h" 1
# 13 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/bitops/sched.h"
static inline __attribute__((always_inline)) int sched_find_first_bit(const unsigned long *b)
{

 if (__builtin_expect(!!(b[0]), 0))
  return __ffs(b[0]);
 if (__builtin_expect(!!(b[1]), 0))
  return __ffs(b[1]) + 64;
 return __ffs(b[2]) + 128;
# 34 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/bitops/sched.h"
}
# 354 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h" 2
# 363 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) int ffs(int x)
{
 int r;

 __asm__("bsfl %1,%0\n\t"
  "cmovzl %2,%0"
  : "=r" (r) : "rm" (x), "r" (-1));
 return r+1;
}







static __inline__ __attribute__((always_inline)) int fls64(__u64 x)
{
 if (x == 0)
  return 0;
 return __fls(x) + 1;
}







static __inline__ __attribute__((always_inline)) int fls(int x)
{
 int r;

 __asm__("bsrl %1,%0\n\t"
  "cmovzl %2,%0"
  : "=&r" (r) : "rm" (x), "rm" (-1));
 return r+1;
}

# 1 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/bitops/hweight.h" 1





extern unsigned int hweight32(unsigned int w);
extern unsigned int hweight16(unsigned int w);
extern unsigned int hweight8(unsigned int w);
extern unsigned long hweight64(__u64 w);
# 403 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h" 2





# 1 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/bitops/ext2-non-atomic.h" 1



# 1 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/bitops/le.h" 1




# 1 "/lib/modules/2.6.18-107chaos/build/include/asm/byteorder.h" 1
# 9 "/lib/modules/2.6.18-107chaos/build/include/asm/byteorder.h"
static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u64 ___arch__swab64(__u64 x)
{
 __asm__("bswapq %0" : "=r" (x) : "0" (x));
 return x;
}

static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u32 ___arch__swab32(__u32 x)
{
 __asm__("bswapl %0" : "=r" (x) : "0" (x));
 return x;
}
# 31 "/lib/modules/2.6.18-107chaos/build/include/asm/byteorder.h"
# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/little_endian.h" 1
# 12 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/little_endian.h"
# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/swab.h" 1
# 61 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/swab.h"
static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u16 ___swab16(__u16 x)
{
 return x<<8 | x>>8;
}
static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u32 ___swab32(__u32 x)
{
 return x<<24 | x>>24 |
  (x & (__u32)0x0000ff00UL)<<8 |
  (x & (__u32)0x00ff0000UL)>>8;
}
static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u64 ___swab64(__u64 x)
{
 return x<<56 | x>>56 |
  (x & (__u64)0x000000000000ff00ULL)<<40 |
  (x & (__u64)0x0000000000ff0000ULL)<<24 |
  (x & (__u64)0x00000000ff000000ULL)<< 8 |
  (x & (__u64)0x000000ff00000000ULL)>> 8 |
  (x & (__u64)0x0000ff0000000000ULL)>>24 |
  (x & (__u64)0x00ff000000000000ULL)>>40;
}
# 160 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/swab.h"
static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u16 __fswab16(__u16 x)
{
 return ___swab16(x);
}
static __inline__ __attribute__((always_inline)) __u16 __swab16p(const __u16 *x)
{
 return ___swab16(*(x));
}
static __inline__ __attribute__((always_inline)) void __swab16s(__u16 *addr)
{
 ((void)(*(addr) = ___swab16(*(addr))));
}

static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u32 __fswab32(__u32 x)
{
 return ___arch__swab32(x);
}
static __inline__ __attribute__((always_inline)) __u32 __swab32p(const __u32 *x)
{
 return ___arch__swab32(*(x));
}
static __inline__ __attribute__((always_inline)) void __swab32s(__u32 *addr)
{
 ((void)(*(addr) = ___arch__swab32(*(addr))));
}


static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u64 __fswab64(__u64 x)
{





 return ___arch__swab64(x);

}
static __inline__ __attribute__((always_inline)) __u64 __swab64p(const __u64 *x)
{
 return ___arch__swab64(*(x));
}
static __inline__ __attribute__((always_inline)) void __swab64s(__u64 *addr)
{
 ((void)(*(addr) = ___arch__swab64(*(addr))));
}
# 13 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/little_endian.h" 2
# 43 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/little_endian.h"
static inline __attribute__((always_inline)) __le64 __cpu_to_le64p(const __u64 *p)
{
 return ( __le64)*p;
}
static inline __attribute__((always_inline)) __u64 __le64_to_cpup(const __le64 *p)
{
 return ( __u64)*p;
}
static inline __attribute__((always_inline)) __le32 __cpu_to_le32p(const __u32 *p)
{
 return ( __le32)*p;
}
static inline __attribute__((always_inline)) __u32 __le32_to_cpup(const __le32 *p)
{
 return ( __u32)*p;
}
static inline __attribute__((always_inline)) __le16 __cpu_to_le16p(const __u16 *p)
{
 return ( __le16)*p;
}
static inline __attribute__((always_inline)) __u16 __le16_to_cpup(const __le16 *p)
{
 return ( __u16)*p;
}
static inline __attribute__((always_inline)) __be64 __cpu_to_be64p(const __u64 *p)
{
 return ( __be64)__swab64p(p);
}
static inline __attribute__((always_inline)) __u64 __be64_to_cpup(const __be64 *p)
{
 return __swab64p((__u64 *)p);
}
static inline __attribute__((always_inline)) __be32 __cpu_to_be32p(const __u32 *p)
{
 return ( __be32)__swab32p(p);
}
static inline __attribute__((always_inline)) __u32 __be32_to_cpup(const __be32 *p)
{
 return __swab32p((__u32 *)p);
}
static inline __attribute__((always_inline)) __be16 __cpu_to_be16p(const __u16 *p)
{
 return ( __be16)__swab16p(p);
}
static inline __attribute__((always_inline)) __u16 __be16_to_cpup(const __be16 *p)
{
 return __swab16p((__u16 *)p);
}
# 104 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/little_endian.h"
# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/generic.h" 1
# 154 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/generic.h"
extern __u32 ntohl(__be32);
extern __be32 htonl(__u32);
extern __u16 ntohs(__be16);
extern __be16 htons(__u16);
# 173 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/generic.h"
static inline __attribute__((always_inline)) void le16_add_cpu(__le16 *var, u16 val)
{
 *var = (( __le16)(__u16)((( __u16)(__le16)(*var)) + val));
}

static inline __attribute__((always_inline)) void le32_add_cpu(__le32 *var, u32 val)
{
 *var = (( __le32)(__u32)((( __u32)(__le32)(*var)) + val));
}


static inline __attribute__((always_inline)) void le64_add_cpu(__le64 *var, u64 val)
{
 *var = (( __le64)(__u64)((( __u64)(__le64)(*var)) + val));
}

static inline __attribute__((always_inline)) void be16_add_cpu(__be16 *var, u16 val)
{
 *var = (( __be16)(__builtin_constant_p((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)((( __u16)(__be16)(*var))) & (__u16)0x00ffU) << 8) | (((__u16)((( __u16)(__be16)(*var))) & (__u16)0xff00U) >> 8) )) : __fswab16((( __u16)(__be16)(*var)))) + val))) ? ((__u16)( (((__u16)((((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)((( __u16)(__be16)(*var))) & (__u16)0x00ffU) << 8) | (((__u16)((( __u16)(__be16)(*var))) & (__u16)0xff00U) >> 8) )) : __fswab16((( __u16)(__be16)(*var)))) + val))) & (__u16)0x00ffU) << 8) | (((__u16)((((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)((( __u16)(__be16)(*var))) & (__u16)0x00ffU) << 8) | (((__u16)((( __u16)(__be16)(*var))) & (__u16)0xff00U) >> 8) )) : __fswab16((( __u16)(__be16)(*var)))) + val))) & (__u16)0xff00U) >> 8) )) : __fswab16((((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)((( __u16)(__be16)(*var))) & (__u16)0x00ffU) << 8) | (((__u16)((( __u16)(__be16)(*var))) & (__u16)0xff00U) >> 8) )) : __fswab16((( __u16)(__be16)(*var)))) + val)))));
}

static inline __attribute__((always_inline)) void be32_add_cpu(__be32 *var, u32 val)
{
 *var = (( __be32)(__builtin_constant_p((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x000000ffUL) << 24) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x0000ff00UL) << 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0xff000000UL) >> 24) )) : __fswab32((( __u32)(__be32)(*var)))) + val))) ? ((__u32)( (((__u32)((((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x000000ffUL) << 24) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x0000ff00UL) << 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0xff000000UL) >> 24) )) : __fswab32((( __u32)(__be32)(*var)))) + val))) & (__u32)0x000000ffUL) << 24) | (((__u32)((((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x000000ffUL) << 24) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x0000ff00UL) << 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0xff000000UL) >> 24) )) : __fswab32((( __u32)(__be32)(*var)))) + val))) & (__u32)0x0000ff00UL) << 8) | (((__u32)((((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x000000ffUL) << 24) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x0000ff00UL) << 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0xff000000UL) >> 24) )) : __fswab32((( __u32)(__be32)(*var)))) + val))) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x000000ffUL) << 24) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x0000ff00UL) << 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0xff000000UL) >> 24) )) : __fswab32((( __u32)(__be32)(*var)))) + val))) & (__u32)0xff000000UL) >> 24) )) : __fswab32((((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x000000ffUL) << 24) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x0000ff00UL) << 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((( __u32)(__be32)(*var))) & (__u32)0xff000000UL) >> 24) )) : __fswab32((( __u32)(__be32)(*var)))) + val)))));
}

static inline __attribute__((always_inline)) void be64_add_cpu(__be64 *var, u64 val)
{
 *var = (( __be64)(__builtin_constant_p((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000000000ffULL) << 56) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000000000ff00ULL) << 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000000000ff0000ULL) << 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000ff000000ULL) << 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000ff00000000ULL) >> 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000ff0000000000ULL) >> 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00ff000000000000ULL) >> 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0xff00000000000000ULL) >> 56) )) : __fswab64((( __u64)(__be64)(*var)))) + val))) ? ((__u64)( (__u64)(((__u64)((((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000000000ffULL) << 56) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000000000ff00ULL) << 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000000000ff0000ULL) << 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000ff000000ULL) << 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000ff00000000ULL) >> 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000ff0000000000ULL) >> 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00ff000000000000ULL) >> 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0xff00000000000000ULL) >> 56) )) : __fswab64((( __u64)(__be64)(*var)))) + val))) & (__u64)0x00000000000000ffULL) << 56) | (__u64)(((__u64)((((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000000000ffULL) << 56) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000000000ff00ULL) << 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000000000ff0000ULL) << 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000ff000000ULL) << 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000ff00000000ULL) >> 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000ff0000000000ULL) >> 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00ff000000000000ULL) >> 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0xff00000000000000ULL) >> 56) )) : __fswab64((( __u64)(__be64)(*var)))) + val))) & (__u64)0x000000000000ff00ULL) << 40) | (__u64)(((__u64)((((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000000000ffULL) << 56) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000000000ff00ULL) << 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000000000ff0000ULL) << 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000ff000000ULL) << 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000ff00000000ULL) >> 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000ff0000000000ULL) >> 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00ff000000000000ULL) >> 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0xff00000000000000ULL) >> 56) )) : __fswab64((( __u64)(__be64)(*var)))) + val))) & (__u64)0x0000000000ff0000ULL) << 24) | (__u64)(((__u64)((((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000000000ffULL) << 56) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000000000ff00ULL) << 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000000000ff0000ULL) << 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000ff000000ULL) << 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000ff00000000ULL) >> 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000ff0000000000ULL) >> 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00ff000000000000ULL) >> 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0xff00000000000000ULL) >> 56) )) : __fswab64((( __u64)(__be64)(*var)))) + val))) & (__u64)0x00000000ff000000ULL) << 8) | (__u64)(((__u64)((((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000000000ffULL) << 56) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000000000ff00ULL) << 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000000000ff0000ULL) << 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000ff000000ULL) << 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000ff00000000ULL) >> 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000ff0000000000ULL) >> 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00ff000000000000ULL) >> 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0xff00000000000000ULL) >> 56) )) : __fswab64((( __u64)(__be64)(*var)))) + val))) & (__u64)0x000000ff00000000ULL) >> 8) | (__u64)(((__u64)((((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000000000ffULL) << 56) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000000000ff00ULL) << 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000000000ff0000ULL) << 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000ff000000ULL) << 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000ff00000000ULL) >> 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000ff0000000000ULL) >> 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00ff000000000000ULL) >> 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0xff00000000000000ULL) >> 56) )) : __fswab64((( __u64)(__be64)(*var)))) + val))) & (__u64)0x0000ff0000000000ULL) >> 24) | (__u64)(((__u64)((((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000000000ffULL) << 56) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000000000ff00ULL) << 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000000000ff0000ULL) << 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000ff000000ULL) << 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000ff00000000ULL) >> 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000ff0000000000ULL) >> 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00ff000000000000ULL) >> 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0xff00000000000000ULL) >> 56) )) : __fswab64((( __u64)(__be64)(*var)))) + val))) & (__u64)0x00ff000000000000ULL) >> 40) | (__u64)(((__u64)((((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000000000ffULL) << 56) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000000000ff00ULL) << 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000000000ff0000ULL) << 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000ff000000ULL) << 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000ff00000000ULL) >> 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000ff0000000000ULL) >> 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00ff000000000000ULL) >> 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0xff00000000000000ULL) >> 56) )) : __fswab64((( __u64)(__be64)(*var)))) + val))) & (__u64)0xff00000000000000ULL) >> 56) )) : __fswab64((((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000000000ffULL) << 56) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000000000ff00ULL) << 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000000000ff0000ULL) << 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00000000ff000000ULL) << 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x000000ff00000000ULL) >> 8) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x0000ff0000000000ULL) >> 24) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0x00ff000000000000ULL) >> 40) | (__u64)(((__u64)((( __u64)(__be64)(*var))) & (__u64)0xff00000000000000ULL) >> 56) )) : __fswab64((( __u64)(__be64)(*var)))) + val)))));
}
# 105 "/lib/modules/2.6.18-107chaos/build/include/linux/byteorder/little_endian.h" 2
# 32 "/lib/modules/2.6.18-107chaos/build/include/asm/byteorder.h" 2
# 6 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/bitops/le.h" 2
# 5 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/bitops/ext2-non-atomic.h" 2
# 409 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h" 2






# 1 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/bitops/minix.h" 1
# 416 "/lib/modules/2.6.18-107chaos/build/include/asm/bitops.h" 2
# 10 "/lib/modules/2.6.18-107chaos/build/include/linux/bitops.h" 2

static __inline__ __attribute__((always_inline)) int get_bitmask_order(unsigned int count)
{
 int order;

 order = fls(count);
 return order;
}

static __inline__ __attribute__((always_inline)) int get_count_order(unsigned int count)
{
 int order;

 order = fls(count) - 1;
 if (count & (count - 1))
  order++;
 return order;
}

static inline __attribute__((always_inline)) unsigned long hweight_long(unsigned long w)
{
 return sizeof(w) == 4 ? hweight32(w) : hweight64(w);
}







static inline __attribute__((always_inline)) __u32 rol32(__u32 word, unsigned int shift)
{
 return (word << shift) | (word >> (32 - shift));
}







static inline __attribute__((always_inline)) __u32 ror32(__u32 word, unsigned int shift)
{
 return (word >> shift) | (word << (32 - shift));
}






static inline __attribute__((always_inline)) __u16 rol16(__u16 word, unsigned int shift)
{
 return (word << shift) | (word >> (16 - shift));
}






static inline __attribute__((always_inline)) __u16 ror16(__u16 word, unsigned int shift)
{
 return (word >> shift) | (word << (16 - shift));
}






static inline __attribute__((always_inline)) __u8 rol8(__u8 word, unsigned int shift)
{
 return (word << shift) | (word >> (8 - shift));
}






static inline __attribute__((always_inline)) __u8 ror8(__u8 word, unsigned int shift)
{
 return (word >> shift) | (word << (8 - shift));
}

static inline __attribute__((always_inline)) unsigned fls_long(unsigned long l)
{
 if (sizeof(l) == 4)
  return fls(l);
 return fls64(l);
}

static inline __attribute__((always_inline)) int __ffs64(u64 n)
{





 return __ffs((unsigned long)n);
}
# 16 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h" 2
# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/log2.h" 1
# 21 "/lib/modules/2.6.18-107chaos/build/include/linux/log2.h"
extern __attribute__((const, noreturn))
int ____ilog2_NaN(void);
# 31 "/lib/modules/2.6.18-107chaos/build/include/linux/log2.h"
static inline __attribute__((always_inline)) __attribute__((const))
int __ilog2_u32(u32 n)
{
 return fls(n) - 1;
}



static inline __attribute__((always_inline)) __attribute__((const))
int __ilog2_u64(u64 n)
{
 return fls64(n) - 1;
}







static inline __attribute__((always_inline)) __attribute__((const))
bool is_power_of_2(unsigned long n)
{
 return (n != 0 && ((n & (n - 1)) == 0));
}




static inline __attribute__((always_inline)) __attribute__((const))
unsigned long __roundup_pow_of_two(unsigned long n)
{
 return 1UL << fls_long(n - 1);
}
# 17 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h" 2

# 1 "/lib/modules/2.6.18-107chaos/build/include/asm/bug.h" 1



# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/stringify.h" 1
# 5 "/lib/modules/2.6.18-107chaos/build/include/asm/bug.h" 2





struct bug_frame {
 unsigned char ud2[2];
 unsigned char push;
 signed int filename;
 unsigned char ret;
 unsigned short line;
} __attribute__((packed));
# 28 "/lib/modules/2.6.18-107chaos/build/include/asm/bug.h"
void out_of_line_bug(void);




# 1 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/bug.h" 1






extern const char *print_tainted(void);
# 34 "/lib/modules/2.6.18-107chaos/build/include/asm/bug.h" 2
# 19 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h" 2

extern const char linux_banner[];
# 78 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h"
extern int console_printk[];






struct completion;
struct pt_regs;
struct user;
# 100 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h"
extern int cond_resched(void);
# 126 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h"
extern struct atomic_notifier_head panic_notifier_list;
extern long (*panic_blink)(long time);
 void panic(const char * fmt, ...)
 __attribute__ ((noreturn, format (printf, 1, 2)));
extern void oops_enter(void);
extern void oops_exit(void);
extern int oops_may_print(void);
 void do_exit(long error_code)
 __attribute__((noreturn));
 void complete_and_exit(struct completion *, long)
 __attribute__((noreturn));
extern unsigned long simple_strtoul(const char *,char **,unsigned int);
extern long simple_strtol(const char *,char **,unsigned int);
extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
extern long long simple_strtoll(const char *,char **,unsigned int);
extern int strict_strtoul(const char *, unsigned int, unsigned long *);
extern int strict_strtol(const char *, unsigned int, long *);
extern int strict_strtoull(const char *, unsigned int, unsigned long long *);
extern int strict_strtoll(const char *, unsigned int, long long *);
extern int sprintf(char * buf, const char * fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int vsprintf(char *buf, const char *, va_list)
 __attribute__ ((format (printf, 2, 0)));
extern int snprintf(char * buf, size_t size, const char * fmt, ...)
 __attribute__ ((format (printf, 3, 4)));
extern int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
 __attribute__ ((format (printf, 3, 0)));
extern int scnprintf(char * buf, size_t size, const char * fmt, ...)
 __attribute__ ((format (printf, 3, 4)));
extern int vscnprintf(char *buf, size_t size, const char *fmt, va_list args)
 __attribute__ ((format (printf, 3, 0)));
extern char *kasprintf(gfp_t gfp, const char *fmt, ...)
 __attribute__ ((format (printf, 2, 3)));

extern int sscanf(const char *, const char *, ...)
 __attribute__ ((format (scanf, 2, 3)));
extern int vsscanf(const char *, const char *, va_list)
 __attribute__ ((format (scanf, 2, 0)));

extern int get_option(char **str, int *pint);
extern char *get_options(const char *str, int nints, int *ints);
extern unsigned long long memparse(char *ptr, char **retptr);

extern int core_kernel_text(unsigned long addr);
extern int __kernel_text_address(unsigned long addr);
extern int kernel_text_address(unsigned long addr);
extern int session_of_pgrp(int pgrp);

extern void dump_thread(struct pt_regs *regs, struct user *dump);


 int vprintk(const char *fmt, va_list args)
 __attribute__ ((format (printf, 1, 0)));
 int printk(const char * fmt, ...)
 __attribute__ ((format (printf, 1, 2)));
extern void log_buf_kexec_setup(void);
# 191 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h"
unsigned long int_sqrt(unsigned long);

static inline __attribute__((always_inline)) int __attribute__((pure)) long_log2(unsigned long x)
{
 int r = 0;
 for (x >>= 1; x > 0; x >>= 1)
  r++;
 return r;
}

extern int printk_ratelimit(void);
extern int __printk_ratelimit(int ratelimit_jiffies, int ratelimit_burst);

static inline __attribute__((always_inline)) void console_silent(void)
{
 (console_printk[0]) = 0;
}

static inline __attribute__((always_inline)) void console_verbose(void)
{
 if ((console_printk[0]))
  (console_printk[0]) = 15;
}

extern void bust_spinlocks(int yes);
extern int oops_in_progress;
extern int panic_timeout;
extern int panic_on_oops;
extern int panic_on_unrecovered_nmi;
extern int tainted;
extern const char *print_tainted(void);
extern void add_taint(unsigned);


extern enum system_states {
 SYSTEM_BOOTING,
 SYSTEM_RUNNING,
 SYSTEM_HALT,
 SYSTEM_POWER_OFF,
 SYSTEM_RESTART,
 SYSTEM_SUSPEND_DISK,
} system_state;
# 242 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h"
extern void dump_stack(void);

enum {
 DUMP_PREFIX_NONE,
 DUMP_PREFIX_ADDRESS,
 DUMP_PREFIX_OFFSET
};
extern void hex_dump_to_buffer(const void *buf, size_t len,
    int rowsize, int groupsize,
    char *linebuf, size_t linebuflen, bool ascii);
extern void print_hex_dump(const char *level, const char *prefix_str,
    int prefix_type, int rowsize, int groupsize,
    const void *buf, size_t len, bool ascii);
extern void print_hex_dump_bytes(const char *prefix_str, int prefix_type,
   const void *buf, size_t len);
# 426 "/lib/modules/2.6.18-107chaos/build/include/linux/kernel.h"
struct sysinfo {
 long uptime;
 unsigned long loads[3];
 unsigned long totalram;
 unsigned long freeram;
 unsigned long sharedram;
 unsigned long bufferram;
 unsigned long totalswap;
 unsigned long freeswap;
 unsigned short procs;
 unsigned short pad;
 unsigned long totalhigh;
 unsigned long freehigh;
 unsigned int mem_unit;
 char _f[20-2*sizeof(long)-sizeof(int)];
};
# 24 "/g/g0/bass6/ldiskfs/build/conftest.c" 2

# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/kmod.h" 1
# 23 "/lib/modules/2.6.18-107chaos/build/include/linux/kmod.h"
# 1 "/lib/modules/2.6.18-107chaos/build/include/linux/errno.h" 1



# 1 "/lib/modules/2.6.18-107chaos/build/include/asm/errno.h" 1



# 1 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/errno.h" 1



# 1 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/errno-base.h" 1
# 5 "/lib/modules/2.6.18-107chaos/build/include/asm-generic/errno.h" 2
# 5 "/lib/modules/2.6.18-107chaos/build/include/asm/errno.h" 2
# 5 "/lib/modules/2.6.18-107chaos/build/include/linux/errno.h" 2
# 24 "/lib/modules/2.6.18-107chaos/build/include/linux/kmod.h" 2







extern int request_module(const char * name, ...) __attribute__ ((format (printf, 1, 2)));






struct key;
extern int call_usermodehelper_keys(char *path, char *argv[], char *envp[],
        struct key *session_keyring, int wait);

static inline __attribute__((always_inline)) int
call_usermodehelper(char *path, char **argv, char **envp, int wait)
{
 return call_usermodehelper_keys(path, argv, envp, ((void *)0), wait);
}

extern void usermodehelper_init(void);
extern int __exec_usermodehelper(char *path, char **argv, char **envp,
     struct key *ring);

struct file;
extern int call_usermodehelper_pipe(char *path, char *argv[], char *envp[],
        struct file **filp);
# 26 "/g/g0/bass6/ldiskfs/build/conftest.c" 2

int
main (void)
{

        int myretval=38 ;
        return myretval;

  ;
  return 0;
}
