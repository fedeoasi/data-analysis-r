load_us_states_df <- function(as_of) {
  df <- read.csv('http://covidtracking.com/api/states/daily.csv')
  df$date <- ymd(df$date)
  df <- filter(df, !is.na(death) & death > 0 & date < as_of)
  df <- rev(df)
  return(df)
}

load_us_df <- function(as_of) {
  us_df <- read.csv('https://covidtracking.com/api/us/daily.csv')
  us_df$date <-ymd(us_df$date)
  us_df <- filter(arrange(us_df, date), date < as_of)
  return(us_df)
}

preprocess_it <- function(data, as_of) {
  data$date <- ymd(substring(data$data, first = 0, last = 10))
  data <- filter(data, date < as_of)
  data$death <- data$deceduti
  data$positive <- data$totale_positivi
  return(data)
}

load_it_df <- function(as_of) {
  it_df <- read.csv('https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv')
  return(preprocess_it(it_df, as_of))
}

load_it_regions_df <- function(as_of) {
  it_reg <- read.csv("https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni.csv")
  return(preprocess_it(it_reg, as_of))
}



