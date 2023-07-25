install.packages("readxl")
bacterial_stocks <- readxl::read_excel("/Users/keziadobson/Downloads/Hesselberth Lab Quartzy.xlsx", sheet = 1)
yeast_stocks <- readxl::read_excel("/Users/keziadobson/Downloads/Hesselberth Lab Quartzy.xlsx", sheet = 5)

# Looking up a culture by multiple features
(hit1 <- grep("trl1∆", yeast_stocks$`Item Name *`))
(hit2 <- grep("10x", yeast_stocks$`Item Name *`))

(multiple_hits <- intersect(hit1, hit2))

options <- yeast_stocks$`Item Name *`[multiple_hits]

(options_by_row <- c())
for (i in 1:length(multiple_hits)) {
  combined <- c(options[i], multiple_hits[i])
  options_by_row <- append(options_by_row, combined)
}

options_by_row

desired_stock_number <- 129
(desired_stock <- options_by_row[desired_stock_number])

desired_row_number <- as.integer(options_by_row[desired_stock_number + 1])
(stock_location <- yeast_stocks$`Systematic Name`[desired_row_number])

x <- grep("Jay Hesselberth", yeast_stocks$Owner)
length(x)



# Looking up a culture by multiple features
(hit1 <- grep("10x", bacterial_stocks$`Item Name`))
(hit2 <- grep("425", bacterial_stocks$`Item Name`))

(multiple_hits <- intersect(hit1, hit2))

options <- bacterial_stocks$`Item Name`[multiple_hits]

(options_by_row <- c())
for (i in 1:length(multiple_hits)) {
  combined <- c(options[i], multiple_hits[i])
  options_by_row <- append(options_by_row, combined)
}

options_by_row

desired_stock_number <- 1
(desired_stock <- options_by_row[desired_stock_number])

desired_row_number <- as.integer(options_by_row[desired_stock_number + 1])
(stock_location <- bacterial_stocks$`Systematic Name`[desired_row_number])

