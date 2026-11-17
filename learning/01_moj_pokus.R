hodiny <- c(1,2,3)
length (hodiny)
class (hodiny)
mix <- c(1, "2", 3)
class(mix)
sum(mix)
sum(hodiny)
dni <- c("pondelok","utorok","streda")
class(dni)
length(dni)
ucenie <- data.frame(dni,hodiny)
class(ucenie)
str(ucenie)
sum(ucenie$hodiny)  
ucenie$hodiny > 1
ucenie[ucenie$hodiny > 1,]
ucenie[ucenie$hodiny >= 1,]
dlhsie_ucenie <- ucenie[ucenie$hodiny >= 2,]
sum(dlhsie_ucenie$hodiny)
mean(dlhsie_ucenie$hodiny)
kratke_ucenie <- ucenie[ucenie$hodiny < 3, ]
mean(kratke_ucenie$hodiny)
dni_citania <- c("pondelok", "utorok", "streda", "stvrtok")
strany <- c(10,0,15,5)
class(dni_citania)
class(strany)
length(dni_citania)
length(strany)
citanie <- data.frame(dni_citania,strany)
aktivne_dni <- citanie[citanie$strany > 0,]
mean(citanie$strany)
mean(aktivne_dni$strany)
strany_neuplne <- c(10, NA, 15, 5)
mean(strany_neuplne)
mean(strany_neuplne,na.rm =TRUE)     
is.na(strany_neuplne)
sum(!is.na(strany_neuplne))
sum(is.na(strany_neuplne))/length(strany_neuplne)
sum(!is.na(strany_neuplne))/length(strany_neuplne)*100
citanie_neuplne <- data.frame(dni_citania,strany_neuplne)
citanie_neuplne
citanie_neuplne[is.na(citanie_neuplne$strany_neuplne),]
citanie_zname<- citanie_neuplne[!is.na(citanie_neuplne$strany_neuplne),]
citanie_zname
nrow(citanie_zname)
ncol(citanie_zname)
mean(citanie_zname$strany_neuplne)
