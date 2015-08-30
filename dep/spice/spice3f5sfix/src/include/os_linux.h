/*
 *	Linux/GNU 
 */

#include "os_unix.h"

#define HAS_POSIXTTY            /* <termios.h>                          */
#define HAS_SYSVDIRS            /* <dirent.h>                           */
#define HAS_STRCHR              /* strchr( ) instead of index( )        */
#define HAS_FLOAT_H
#define HAS_LIMITS_H
#define HAS_FTIME               /* ftime( ), <times.h>                  */
#define HAS_SYSVTIME
#define HAS_BSDRLIMIT
#define HAS_SYSVRUSAGE
#define HAS_ATRIGH              /* acosh( ), asinh( ), atanh( )         */
/*#define HAS_POW10*/
/*#define HAS_NO_IEEE_LOGB */
#define HAS_TERMCAP
#define HAS_STDLIB
#define HAS_BCOPY
#define HAS_BSDRANDOM           /* srandom( ) and random( )             */
#define HAS_BSDSOCKETS          /* <net/inet.h>, socket( ), etc.        */
#define HAS_DUP2
#define HAS_GETWD               /* getwd(buf)                           */
#define HAS_INTWAITSTATUS       /* wait(3)  takes an int *, not a union */
