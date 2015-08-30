/* Michael Widlok 		2 Jun 1999 */

/* New commands for unloading circuits */

#include "spice.h"
#include "cpdefs.h"
#include "ftedefs.h"
#include "ftedev.h"
#include "ftedebug.h"
#include "ftedata.h"
#include "suffix.h"

extern FILE *rawfileFp;
extern bool rawfileBinary;
extern struct dbcomm *dbs;

/* Clears ckt and removes current circ. form database */
 
void
com_removecirc(wl)
    wordlist *wl;
{
    struct variable *v, *next;
    struct circ *ct;
    
    if (ft_curckt == NULL) {
        fprintf(cp_err, "Error: there is no circuit loaded.\n");
        return;
    }

	ct = ft_curckt; 
    
    if_cktfree(ct->ci_ckt, ct->ci_symtab);
    for (v = ct->ci_vars; v; v = next) {
	next = v->va_next;
	tfree(v);
    }
    
    ct->ci_vars = NULL;


    return;
}

