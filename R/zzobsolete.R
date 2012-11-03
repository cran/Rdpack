
#                                                    # urdo - usage from Rdo file/object;
# compare_sig1 <- function(urdo, ucur){              # ucur -       generated from actual object
#
#     # browser()
#     # 2011-11-12 commenting out as both should be quoted
#     # urdo$defaults <- gsub("\"","", urdo$defaults) # krapka; todo: elements may have embedded
#     # ucur$defaults <- gsub("\"","", ucur$defaults) # quotes; need to investigate where to put
#     status <- identical(urdo, ucur)               # the blame happens
#     status
#
#     # Note: commented out the rest since currently only the truth value is used.
#     #
#     # obj_removed <- is.null(ucur) || is.na(ucur)
#     # obj_added   <- is.null(urdo) || is.na(urdo)
#     #
#     # if(obj_removed || obj_added)
#     #     return( structure( status, details = list( obj_removed = obj_removed
#     #                                              , obj_added   = obj_added
#     #                                              , rdo_usage               = urdo
#     #                                              , cur_usage               = ucur
#     #                                )) )
#     #
#     # identical_names <- urdo$name == ucur$name
#     #
#     # identical_argnames <- identical(urdo$argnames, ucur$argnames)
#     # identical_defaults <- identical(urdo$defaults, ucur$defaults)
#     # identical_formals <- identical_argnames & identical_defaults
#     #
#     # added_argnames <- ucur$argnames[ !(ucur$argnames %in% urdo$argnames) ]
#     # removed_argnames <- urdo$argnames[ !(urdo$argnames %in% ucur$argnames) ]
#     #
#     #                                     # note: !!! intersect() is binary operation
#     # s <- intersect( intersect(names(urdo$argnames), names(ucur$argnames)),
#     #                 intersect(names(urdo$defaults), names(ucur$defaults)) )
#     #
#     # unchanged_defaults <- urdo$defaults[ ucur$defaults[s] == urdo$defaults[s] ]
#     #
#     # names_unchanged_defaults <- names(unchanged_defaults)[unchanged_defaults]
#     #
#     # # todo: more details for the case when !identical, e.g. equal up to reordering,
#     # #       added/removed defaults
#     #
#     # structure( status, details = list( identical_names          = identical_names
#     #                                  , obj_removed              = obj_removed
#     #                                  , obj_added                = obj_added
#     #                                  , identical_argnames       = identical_argnames
#     #                                  , identical_defaults       = identical_defaults
#     #                                  , identical_formals        = identical_formals
#     #                                  , added_argnames           = added_argnames
#     #                                  , removed_argnames         = removed_argnames
#     #                                  , names_unchanged_defaults = names_unchanged_defaults
#     #                                  , rdo_usage                = urdo
#     #                                  , cur_usage                = ucur
#     #                    ))
# }

# # note: todo: !!! is.pairlist(NULL) gives TRUE, so NULL indeed is a pairlist with zero elem.
# #             but inherits(NULL, "pairlist") gives FALSE
# #
# # this function is probably redundant and is called only by get_usage (and with one element,
# #  so the return in the first `if' below is invoked (todo: check and remove if so!)
# pairlist2f_usage <- function(x, nams, S3class = "", S4sig = "", infix = FALSE, fu  = TRUE,
#                              verbose = TRUE){
#                                 # 2012-09-27 !!! smenyam inherits(x, "pairlist") s is.pairlist
#     if(is.pairlist(x)){   # TRUE also when x is NULL
#         return(pairlist2f_usage1(x, name = if(missing(nams)) "fun_1" else nams,
#                                  S3class = S3class, S4sig=S4sig, infix = infix, fu = fu))
#     }
#     if(missing(nams))
#        nams <- names(x)
#     if(is.null(nams)  &&  length(x) > 0){
#         if(verbose)
#             cat("Argument 'x' is not named, supplying dummy function name(s).\n")
#         nams <- paste("fun_", seq_along(x), sep="")
#     }
#
#     if(is.null(names(x)))          # note: S3class below needs to have the same length as nams
#         names(x) <- nams
#     mapply("pairlist2f_usage1", x, nams, S3class, S4sig, infix, fu)
# }

