#read EAVS 2018 and 2020
eavs18 <- read_excel("C:/Users/Jose/Documents/RA DocsResearch/EAVS Data/EAVS_2018.xlsx")
view(eavs18)

eavs20 <- read_excel("C:/Users/Jose/Documents/RA DocsResearch/EAVS Data/EAVS_2020.xlsx")
view(eavs20)

#2018
eavs18 <- read_excel("C:/Users/Jose/Documents/RA DocsResearch/EAVS Data/EAVS_2018.xlsx", guess_max = 10000)
view(eavs18)

eavs18$C3a<- as.numeric(as.character(eavs18$C3a))
eavs18$C4a<- as.numeric(as.character(eavs18$C4a))
view(eavs18)
eavs18 <- eavs18 |> mutate(rejectionrates = C4a/C3a)
view(eavs18)

eavs18 <- select(eavs18, Jurisdiction_Name, State_Full, C3a, C4a, rejectionrates)
view(eavs18)
eavs18 <- filter(eavs18, rejectionrates >= .1)
view(eavs18)
eavs18 <- filter(eavs18, State_Full != "WISCONSIN")
view(eavs18)
eavs18 <- eavs18 |> filter((grepl("COUNTY", Jurisdiction_Name)))
view(eavs18)
eavs18 |> count(State_Full)

#2020
eavs20$C3a<- as.numeric(as.character(eavs20$C3a))
eavs20$C4a<- as.numeric(as.character(eavs20$C4a))
view(eavs18)
eavs20_new <- eavs20 |> mutate(rejectionrates = C4a/C3a)
view(eavs20)

#Colorado
eavs20 <- filter(eavs20, rejectionrates >= .1)
view(eavs20)
eavs20 <- filter(eavs20, State_Full == "COLORADO")
view(eavs20)
eavs20 <- eavs20 |> filter((grepl("COUNTY", Jurisdiction_Name)))
view(eavs20)
eavs20 |> count(State_Full)

eavs20_new2 <- eavs20_new |> 
  select(Jurisdiction_Name, State_Full, C3a, C4a, rejectionrates) |> 
  filter(State_Full == "COLORADO") |> 
  arrange(desc(rejectionrates))
view(eavs20_new2)