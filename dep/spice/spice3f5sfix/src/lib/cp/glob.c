/**********
Copyright 1990 Regents of the University of California.  All rights reserved.
Author: 1985 Wayne A. Christopher, U. C. Berkeley CAD Group
**********/

/*
 * Expand global characters.
 */

#include "spice.h"
#include "misc.h"
#include "cpdefs.h"

#ifdef HAS_BSDDIRS
#include <sys/types.h>
#include <sys/dir.h>
#else

#ifdef HAS_SYSVDIRS
#include <sys/types.h>
#include <dirent.h>
#ifndef direct
#define direct dirent
#endif
#endif

#endif

#ifdef HAS_GETPW
#include <pwd.h>
#endif

#include "suffix.h"

static bool noglobs();

char cp_comma = ',';
char cp_til = '~';

/* For each word, go through two steps: expand the {}'s, and then do ?*[]
 * globbing in them. Sort after the second phase but not the first...
 */

/* MW. Now only tilde is supportef, {}*? don't work */

wordlist *
cp_doglob(wlist)
    wordlist *wlist;
{
    wordlist *wl, *w, *nwl;
    char *s;


    /* Do tilde expansion. */

    for (wl = wlist; wl; wl = wl->wl_next)
        if (*wl->wl_word == cp_til) {
            s = cp_tildexpand(wl->wl_word);
            if (!s)
                *wl->wl_word = '\0';	/* MW. We Con't touch malloc addres */
            else
		wl->wl_word = s;
        }

    return (wlist);
}

/* Expand tildes. */

char *
cp_tildexpand(string)
    char *string;
{
    char	*result;

    result = tilde_expand(string);

    if (!result) {
	if (cp_nonomatch) {
	    return copy(string);
	} else {
	    return NULL;
	}
    }
    return result;
}


/* Say whether the pattern p can match the string s. */

/* MW. Now simply compare strings */

bool
cp_globmatch(p, s)
    char *p, *s;
{
    return(!(strcmp(p, s)));
}

