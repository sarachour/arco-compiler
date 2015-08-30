





































































































     extern double acos();
     extern double asin();
     extern double atan();
     extern double atan2();
     extern double cos();
     extern double sin();
     extern double tan();


     extern double acosd();
     extern double asind();
     extern double atand();
     extern double atan2d(); 
     extern double cosd();
     extern double sind();
     extern double tand();

     extern double cosh();
     extern double sinh();
     extern double tanh();

     extern double acosh();
     extern double asinh();
     extern double atanh();

     extern double exp();
     extern double frexp();
     extern double ldexp();
     extern double log();
     extern double log10();

     extern double log2();

     extern double modf();
     extern double pow();
     extern double sqrt();
     extern double ceil();
     extern double fabs();
     extern double floor();
     extern double fmod();


     extern double rint();
     extern int    finite();
     extern double copysign();
     extern double scalb();
     extern int    logb();
     extern double drem();
























     extern double erf();
     extern double erfc();
     extern double gamma();
     extern double lgamma();
     extern int    isnan();
     extern int    isinf();                
     extern double hypot();
     extern double j0();
     extern double j1();
     extern double jn();
     extern double y0();
     extern double y1();
     extern double yn();


   extern int signgam;









     typedef struct {
       unsigned int word1, word2, word3, word4;
     } long_double;


   struct exception {
	int type;
	char *name;
	double arg1;
	double arg2;
	double retval;
   };

   extern int errno;




     extern int matherr();
     extern double cabs();


       extern double atof();










































     extern int fpclassify(); 
     extern int isnan();








typedef long fp_control;
typedef int fp_except;
typedef enum {
    FP_RZ=0,
    FP_RN,
    FP_RP,
    FP_RM 
    } fp_rnd;


extern fp_rnd fpgetround();
extern fp_rnd fpsetround();










                             
extern fp_except fpgetmask();


extern fp_except fpgetmask();
extern fp_except fpsetmask();
extern fp_except fpgetsticky();
extern fp_except fpsetsticky();  

                        










extern void       fpsetdefaults();
extern int        fpgetfastmode();
extern int        fpsetfastmode(); 
extern fp_control fpgetcontrol();
extern fp_control fpsetcontrol();





































































































				














































































































































































































































extern char *Spice_Exec_Dir;
extern char *Spice_Lib_Dir;
extern char Spice_OptChar;
extern char *Def_Editor;
extern char *Bug_Addr;
extern int AsciiRawFile;
extern char *Spice_Host;
extern char *Spiced_Log;

extern char Spice_Notice[ ];
extern char Spice_Version[ ];
extern char Spice_Build_Date[ ];

extern char *News_File;
extern char *Default_MFB_Cap;
extern char *Spice_Path;
extern char *Help_Path;
extern char *Lib_Path;
extern int  Patch_Level;


















   typedef struct {
	int		 __cnt;
	unsigned char	*__ptr;
	unsigned char	*__base;
	unsigned short	 __flag;
	unsigned char 	 __fileL;		
	unsigned char 	 __fileH;		
   } FILE;

   typedef struct {
	int		 __cnt;
	unsigned char	*__ptr;
	unsigned char	*__base;
	unsigned short	 __flag;
	unsigned char 	 __fileL;		
	unsigned char 	 __fileH;		
	unsigned char	*__bufendp;	
	unsigned char	 __smbuf[8]; 
   } _FILEX;
























     typedef unsigned int size_t;


   typedef long int fpos_t;




     typedef double *__va_list;























   




   extern FILE __iob[];


     extern int remove();
     extern int rename();
     extern FILE *tmpfile();
     extern char *tmpnam();
     extern int fclose();
     extern int fflush();
     extern FILE *fopen();
     extern FILE *freopen();
     extern int setbuf();
     extern int setvbuf();
     extern int fprintf();
     extern int fscanf();
     extern int printf();
     extern int scanf();
     extern int sprintf();
     extern int sscanf();
     extern int vprintf();
     extern int vfprintf();
     extern int vsprintf();
     extern int fgetc();
     extern char *fgets();
     extern int fputc();
     extern int fputs();
     extern int getc();
     extern int getchar();
     extern char *gets();
     extern int putc();
     extern int putchar();
     extern int puts();
     extern int ungetc();
     extern int fgetpos();
     extern int fseek();
     extern int fsetpos();
     extern long int ftell();
     extern int rewind();
     extern int clearerr();
     extern int feof();
     extern int ferror();
     extern int perror();




       extern size_t fread();
       extern size_t fwrite();











     extern int __flsbuf();
     extern int __filbuf();

  






















     extern char *ctermid();
     extern int fileno();
     extern FILE *fdopen();











         typedef double *va_list;



     extern char *optarg;
     extern int opterr;
     extern int optind;
     extern int optopt;


       extern int getopt();
       extern char *cuserid();








     extern int getw();
     extern int putw();
     extern int pclose();
     extern FILE *popen();
     extern char *tempnam();









     extern int vscanf();
     extern int vfscanf();
     extern int vsscanf();


   extern unsigned char *__bufendtab[];












































     extern int isalnum();
     extern int isalpha();
     extern int iscntrl();
     extern int isdigit();
     extern int isgraph();
     extern int islower();
     extern int isprint();
     extern int ispunct();
     extern int isspace();
     extern int isupper();
     extern int isxdigit();
     extern int tolower();
     extern int toupper();

















     extern unsigned char 		*__ctype;
     extern unsigned char               *__ctype2;
     extern int                         __alnum;

     extern unsigned char		*__upshift;
     extern unsigned char		*__downshift;




















     extern int isascii();
     extern int toascii();










































     extern int memcmp();
     extern int *memmove();
     extern char *strcpy();
     extern char *strncpy();
     extern char *strcat();
     extern char *strncat();
     extern int strcmp();
     extern int strncmp();
     extern int strcoll();
     extern size_t strxfrm();
     extern char *strchr();
     extern char *strpbrk();
     extern char *strrchr();
     extern char *strstr();
     extern char *strtok();
     extern char *strerror();




       extern int *memcpy();
       extern int *memchr();
       extern int *memset();
       extern size_t strcspn();
       extern size_t strspn();
       extern size_t strlen();







       extern int *memccpy();










     extern char *strrstr();
     extern int strcasecmp();
     extern int strncasecmp();
     extern char *strdup();
     extern int nl_strcmp();
     extern int nl_strncmp();








extern char *tmalloc();
extern char *trealloc();
extern int txfree();





extern char *copy();
extern char *gettok();
extern int appendc();
extern int scannum();
extern int prefix();
extern int ciprefix();
extern int cieq();
extern int strtolower();
extern int substring();
extern char *tilde_expand( );
extern int cp_printword();

extern char *datestring();
extern double seconds();

extern char *smktemp();










extern char *calloc();
extern char *malloc();
extern char *realloc();
extern char *getenv();
extern int errno;
extern char *sys_errlist[];
extern char *getenv();
extern char *getwd();
extern int rand();
extern int srand();
extern int atoi();
extern int kill();
extern int getpid();
extern int qsort();



extern char *getcwd( );







extern int bzero();


extern int bcopy();





extern char *strchr();
extern char *strrchr();
















extern int perror();






extern char *sbrk();














double logb(x)
	double	x;
{
	double	y = 0.0;

	if (x != 0.0) {
		if (x < 0.0)
			x = - x;
		while (x > 2.0) {
			y += 1.0;
			x /= 2.0;
		}
		while (x < 1.0) {
			y -= 1.0;
			x *= 2.0;
		}
	} else
		y = 0.0;

	return y;
}

double
scalb(x, n)
	double	x;
	int	n;
{
	double	y, z = 1.0, k = 2.0;

	if (n < 0) {
		n = -n;
		k = 0.5;
	}

	if (x != 0.0)
		for (y = 1.0; n; n >>= 1) {
			y *= k;
			if (n & 1)
				z *= y;
		}

	return x * z;
}








