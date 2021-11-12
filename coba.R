library(readr)  #Membaca data
library(dplyr)  #Data processing
library(DT)     #Menampilkan tabel agar mudah dilihat di browser

asean_data <- read_csv("datasets/asean_demografi.csv")
asean_data <- asean_data[c(3,5,7,8,9), ] #Memilih 5 negara : Indonesia, Malaysia, Filipina, Singapura, dan Thailand.
datatable(asean_data, caption = "Indikator Demografi Negara ASEAN 2015")

data_standardized <- scale(asean_data[,2:5]) #Hanya memilih kolom/variabel yang berisikan indikator kelahiran dan kematian

d <- dist(x = data_standardized, method = "euclidean")
d
hc_single <- hclust(d = d, method = "single")
plot(hc_single, hang = -1) #Menampilkan Dendogram
abline(h = 2, col = 'red')
