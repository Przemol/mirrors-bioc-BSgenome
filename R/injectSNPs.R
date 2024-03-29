### =========================================================================
### SNP injection
### -------------------------------------------------------------------------

installed.SNPs <- function()
{
    pkgs <- installed.packages()[ , "Package"]
    pkgs <- pkgs[substr(pkgs, 1, 8) == "SNPlocs."]
    names(pkgs) <- NULL
    return(pkgs)
}

available.SNPs <- function(type=getOption("pkgType"))
{
    url <- getDataAnnotationContribUrl(type)
    pkgs <- available.packages(url)[, "Package"]
    pkgs <- pkgs[substr(pkgs, 1, 8) == "SNPlocs."]
    names(pkgs) <- NULL
    return(pkgs)
}

setGeneric("injectSNPs", signature="x",
    function(x, SNPlocs_pkgname) standardGeneric("injectSNPs")
)

setMethod("injectSNPs", "BSgenome",
    function(x, SNPlocs_pkgname)
    {
        if (!is.null(SNPlocs_pkgname(x)))
            stop("SNPs were already injected in genome 'x'. ",
                 "Injecting from more than 1 package is not supported.")
        ans <- x
        ## We want the original sequence names, not the user sequence names,
        ## so we use 'seqnames(x@seqinfo)' instead of 'seqnames(x)'.
        ans@injectSNPs_handler <- InjectSNPsHandler(SNPlocs_pkgname,
                                                    x@pkgname,
                                                    seqnames(x@seqinfo))
        ans@.seqs_cache <- new.env(parent=emptyenv())
        ans@.link_counts <- new.env(parent=emptyenv())
        ans
    }
)

