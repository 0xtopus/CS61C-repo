#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    /* your code here */
	if(head == NULL) {
		return 0;
	}
    node *hare = head;
    node *tortoise = head;
    while(1) {
	    if((hare->next == NULL || hare->next->next == NULL)) {
		    return 0;
	    } else {
		    hare = (hare->next)->next;
		    tortoise = tortoise->next;
	    }
	    if(tortoise == hare) {
		    return 1;
	    }
	}

}
