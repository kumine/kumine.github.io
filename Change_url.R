infile="bio123_1.md"
ofile="bio123.md"


library(stringr)
library(Ropt)
library(magrittr)

x=readLines(infile,encoding = "UTF-8")
m=str_match_all(x,"\\[.+?\\]\\(.+?\\)") %>% unlist
i=m[1]
rp=sapply(m, function(i){
  text=str_extract(i,"\\[.+?\\]") %>% gsub("\\[|\\]","",.)
  href=str_extract(i,"\\(.+?\\)") %>% gsub("\\(|\\)","",.)
  tag=qq("<a href='{href}' target='_blank' >{text}</a>")
 tag
})
for(i in m){
  x=sub(i,rp[i],x,fixed = T)
}

cat(x,file=ofile,sep="\n")

