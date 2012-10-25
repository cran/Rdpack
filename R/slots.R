inspect_slots <- function(rdo, final=TRUE){
    fullname <- .get.name_content(rdo)$name     # name of the class with '-class' suffix
    cur <- .capture_promptAny(fullname, final=final)
    curnames <- .get_top_labels(cur, "Slots")   # current slots

    rdonames <- .get_top_labels(rdo, "Slots")   # slots in rdo

    icmp <- .asym_compare(rdonames, curnames)   # compare; get fields $i_new,  $i_rem, $i_com

    if(length(icmp$i_new)>0){
        cat("Undocumented slots:", icmp$i_new, "\n")
        cat("\tAdding items for them.\n")
                                                           # todo: insert in particular order?
        cnt_newslots <- .get_top_items(cur, "Slots", icmp$i_new)
        dindx <- .locate_top_tag(rdo, "Slots")
        rdo <- append_to_Rd_list(rdo, cnt_newslots, dindx)
    }

    if(length(icmp$i_removed)>0){             # todo: maybe put this note in a section in rdo?
        cat("Slots:", icmp$i_removed, "\n")
        cat("are no longer present. Please remove their descriptions manually.\n")
    }
    rdo
}
