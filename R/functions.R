#'@title Crawl Webpage for all links. Requires installation of lynx Browser
#'
#'@description This function returns a tibble of linked URLs from a source URL.
#'@param url A full URL in the form of a string.
#'@keywords weblinks
#'@export
#'@examples
#'links <- get_links("https://cnn.com")


get_links <- function(url){
  message("Note: this function requires an available installation of Lynx browser:\nhttps://lynx.browser.org/")
  require(dplyr)
  require(stringr)
  require(magrittr)
  require(tidyr)
  require(readr)
  url_to_parse <- url
  temp_file <- paste0("temp", round(runif(1, min = 1, max = 100000),0),".txt") #generates randomly numbered tempfile name.
    system(command = paste0("lynx \"",url_to_parse,"\" ","-dump -listonly >",temp_file ))
    url_list <- read_csv(temp_file) %>%
      dplyr::filter(!(References %in% c("Visible links:", "Hidden links:"))) %>%
      tidyr::separate(References, into = c("number", "link"), sep = "[\\. ]", extra = "merge") %>%
      dplyr::mutate(out_link = stringr::str_trim(link, side = "both")) %>%
      dplyr::distinct(out_link) %>%
      dplyr::filter(stringr::str_detect(out_link, "mailto:", negate = TRUE) &
                      stringr::str_detect(out_link, "\\?", negate = TRUE) &
                      stringr::str_detect(out_link, "feed", negate = TRUE)&
                      stringr::str_detect(out_link, "json", negate = TRUE)) %>%
      dplyr::mutate(source_url = url_to_parse) %>%
      dplyr::relocate(source_url)

    file.remove(temp_file) ##delete tempfile
        return(url_list)
}

