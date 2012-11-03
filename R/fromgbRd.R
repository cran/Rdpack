
strRd <- function(rdo, indent = "\t", verbose_blanks = FALSE, omit_blanks = FALSE){
    n <- length(rdo)
    if(n==0)
        return("Empty list")

    tags <- tools:::RdTags(rdo)

    res <- character(0)
    for(i in 1:n){
        if(is.list(rdo[[i]])){
            wrk <- Recall(rdo[[i]], indent = indent
                          , verbose_blanks = verbose_blanks
                          , omit_blanks = omit_blanks
                          )
            res <- c(res, tags[i], paste(indent, wrk, sep="") )
                                                            # if(is.null(tags[[i]])) browser()
        }else{
            wrk <- if(is.null(tags[[i]])){      "_ No Rd_tag"
                   }else if(length(rdo[[i]])==1 && rdo[[i]] == "\n"){    # note: new lines are
                       if(omit_blanks)          NULL                     # not only in "TEXT"
                       else if(verbose_blanks)  "NEWLINE:"
                       else                     rdo[[i]]
                   }else if( length(grep("^[[:space:]]+$", rdo[[i]])) == 1 ){
                       if(omit_blanks)          NULL
                       else if(verbose_blanks)  paste("BLANK:", rdo[[i]])
                       else                     rdo[[i]]
                   }else                        paste("", rdo[[i]])

            if(!is.null(wrk))
                res <- c(res, paste(tags[i], ":", wrk, sep=""))
        }
    }
    res
}

compare_attributes <- function(x,y, nams){                                  # todo: not tested
    xattr <- attributes(x)
    yattr <- attributes(y)
    if(identical(xattr,yattr))   # is this comparison meaningful?
        return(TRUE)

    if(missing(nams))
        nams <- unique(c(names(xattr), names(yattr)))

    tbl <- matrix(NA, ncol = 3, nrow = length(nams))
    rownames(tbl) <- nams
    colnames(tbl) <- c("x","y", "compare")
    tbl[,1] <- nams %in% names(xattr)
    tbl[,2] <- nams %in% names(yattr)

    tbl[,3] <- sapply(nams, function(x) if(tbl[x,1] && tbl[x,2])
                                             identical(xattr[[x]], yattr[[x]])
                                        else FALSE)
    structure(FALSE, details = tbl)
}

.compareRdo_elem <- function(xrdo, yrdo){
    list( list(xrdo, yrdo) )
}

.compareRdo_core <- function(xrdo, yrdo){
    if(identical(xrdo,yrdo))
        res <- return( structure(TRUE, Rd_tag = attr(xrdo,"Rd_tag")) )

    if( is.character(xrdo) && is.character(yrdo)){
        if( xrdo == yrdo ) {             # todo: ignoring attributes for now
            res <- TRUE
            attr(res,"Rd_tag") <- attr(xrdo,"Rd_tag")
        }else
            res <- .compareRdo_elem(xrdo, yrdo)  # todo: refine! if both are non-lists
        return(res)                          #       the values may be the same,
    }                                        #       and only the attributes different.

    if( !all(c(is.list(xrdo),is.list(yrdo))) ){
        res <- .compareRdo_elem(xrdo, yrdo)  # todo: refine! if both are non-lists
        return(res)                          #       the values may be the same,
    }                                        #       and only the attributes different.
    # xrdo and yrdo are lists below

    xattr <- attributes(xrdo)
    yattr <- attributes(yrdo)
    same_attr <- identical( xattr, yattr)

    # if(!same_attr) browser()

    xn <- length(xrdo)
    yn <- length(yrdo)

    # todo: zero xn or yn

    res <- vector(max(xn,yn), mode="list")  # todo: better handling!
    attr(res,"Rd_tag") <- attr(xrdo,"Rd_tag")

    attributes(res) <- attributes(xrdo)
    if( identical(class(res),"Rd") )
        class(res) <- "cmpRd"     # "list"

    attr(res, ".compare_attr") <- same_attr   # todo: needs better handling.

    if(xn >= yn) xc <- yc <- 1:yn
    else         xc <- yc <- 1:xn

    if(xn == yn) xindmore <- yindmore <- integer(0)
    else         xindmore <- yindmore <- (min(xn,yn)+1) : max(xn,yn)

    for( i in seq_along(xc) ){
        res[[i]] <- Recall(xrdo[[ xc[i] ]], yrdo[[ yc[i] ]])
    }

    for( i in seq_along(xindmore) ){
        if(xindmore[i] > xn)
            res[[i]] <- .compareRdo_elem( NA, yindmore[i])
        else if(yindmore[i] > yn)
            res[[i]] <- .compareRdo_elem( xindmore[i], NA)
        #else{ # this should not occur
        #    res[[i]] <- Recall(xrdo[[ xc[i] ]], yrdo[[ yc[i] ]])
        #}
    }

    res
}

# todo:   obrabotka na blanks i new lines i pri sravnenieto (?)
#         obrabotka na comments?
#     !!! option da vrasta samo "leaves" koito ne sa ednakvi.
#     !!! da pechata i indeksite (optional?)
#     !!! obrabotka na attributes ( v momenta prosto gi sravnyava s identical)
#
strcmpRd <- function(rdo, indent = "\t", verbose_blanks = FALSE, omit_blanks = FALSE){
    n <- length(rdo)
    if(n==0)
        return("Empty list")

    tags <- tools:::RdTags(rdo)              # note: tags is usually a character vector
    if(is.list(tags))                        # but it can be a list if some elements are NULL.
        tags <- sapply(tags,
                       function(x){
                           if(length(x)>1) stop("Tags must be of length 1.")
                           if(!is.null(x) && length(x)==0)
                                           stop("Tags cannot be of length 0 (unless NULL.")
                           if(is.character(x)) return(x)
                           if(is.null(x)  ||
                              is.list(x) && length(x)==1 && is.null(x[[1]]))
                                              return("NULLTAG")
                           x[[1]]})

    if(!is.character(tags)){
        print("tags is not a character vector!")
        browser()
    }

    # tags[is.null(tags)] <- "None"
    # tags[tags==""] <- "Ouch"

    if(n==1  &&  is.logical(rdo[[1]])){
        res <- rdo[[1]]
        return(res)
    }

    res <- character(0)
    for(i in 1:n){
        if(is.list(rdo[[i]])){
            wrk <- Recall(rdo[[i]], indent = indent
                          , verbose_blanks = verbose_blanks
                          , omit_blanks = omit_blanks
                          )
            if(is.logical(wrk))
                res <- c(res, paste(if(is.null(tags[[i]])) "None1" else tags[[i]],
                                    ":", wrk, sep="") )
            else
                res <- c(res, tags[[i]], paste(indent, wrk, sep="") )

        }else if(is.logical(rdo[[i]])){
            wrktag <- if(is.null(tags[[i]])) "None2" else tags[[i]]
            res <- c(res, paste( wrktag,      ":", rdo[[i]], sep="") )

        }else if(is.character(rdo[[i]])){
            res <- c(res, tags[[i]], paste(indent, rdo[[i]], sep="") )

        }else{
            res <- c(res, tags[[i]], paste(indent, rdo[[i]], sep="") )
        }
    }
    res
}

print.cmpRd <- function(x,...){
    if(isTRUE(x))
        print(x)
    else
        cat(unlist(strcmpRd(x,...)), sep="\n")
    invisible(x)
}
