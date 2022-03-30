library(readr)
library(tidyverse)
library(party)
library(dplyr)
library(ggplot2)
library(tau)
library(data.table)
library(igraph)
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(knitr)
library(caret)

df.sample = read.csv("/df_sample.csv")

df.split = data.frame(matrix(ncol = 4, nrow = 0))
colnames(df.split) <- c('text', 'text_tag', 'author', 'label')

for(row in 1:nrow(df.sample)){
  row_text = df.sample[row,1]
  row_tag = df.sample[row,2]
  row_author = df.sample[row,3]
  row_factor = df.sample[row,4]
  row_length = str_count(row_text, '\\w+') + 2
  row_list = str_split_fixed(row_text, " ", row_length)

  for(i in length(row_list):1){
    if(row_list[i] == ""){
      row_list = row_list[-i]
    }
  }

  for(i in 1:length(row_list)){
    df.split[nrow(df.split) + 1,1] = row_list[i]
    df.split[nrow(df.split),2] = row_tag
    df.split[nrow(df.split),3] = row_author
    df.split[nrow(df.split),4] = row_factor

  }
}

as_tibble(df.split)
