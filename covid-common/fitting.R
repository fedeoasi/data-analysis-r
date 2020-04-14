fit_exp <- function(series, state) {
  rownumber = 1:length(series)
  data <- list(rownumber = rownumber, series = series)
  initial_model <- lm(log(series) ~ rownumber)
  start <- list(a = coef(initial_model)[[1]], b = coef(initial_model)[[2]])
  mod <- nls(series ~ exp(a + b * rownumber), data = data, start = start)
  return(mod)
}

growth_rate <- function(mod) { 
  return(exp(coef(mod)[["b"]]))
}

try_fit_exp <- function(series, state) {
  tryCatch(growth_rate(fit_exp(series, state)),
    error = function(c) {
      message(paste('Error while computing growth rate for state', state[[1]], c, sep = " "))
      return(0)
    },
    warning = function(c) {
      message(paste('Error while computing growth rate for state ', state[[1]], sep = " "))
      return(0)
    },
    message = function(c) {
      message(paste('Error while computing growth rate for state ', state[[1]], sep = " "))
      return(0)
    }
  )
}

round_growth <- function(growth) {
  return(round(growth, digits = 4))
}

growth_graph <- function(data, title, series, series_name) {
  model <- fit_exp(series, title)
  rownumber <- 1:length(data$date)
  pred <- predict(model, list(rownumber = rownumber))
  growth <- growth_rate(model)
  ggplot(data, aes(date, series, pred)) +
    geom_point(aes(y = series), stat="identity") +
    geom_line(aes(y = pred, color = blue), stat="identity", colour="blue") +
    ggtitle(label = paste(series_name, paste("(", round(growth, digits = 4), sep = ''), "growth)", sep = " "), subtitle = NULL) +
    labs(x = "Date", y = series_name) +
    scale_x_date(date_labels = "%b %d", date_breaks = "4 days") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1))
}

growth_side_by_side <- function(data, title) {
  positive <- growth_graph(data, title, data$positive, 'Positive')
  death <- growth_graph(data, title, data$death, 'Death')
  lay <- rbind(c(1,2), c(1,2))
  grid.arrange(positive, death, layout_matrix = lay, top = title)
}

fit_sigmoid <- function(series) {
  rownumber = 1:length(series)
  data <- list(rownumber = rownumber, series = series)
  model <- nls(series ~ SSlogis(rownumber, Asym, xmid, scal), data = data)
  pred <- predict(model, list(rownumber = rownumber))
  return(model)
}

sigmoid_graph <- function(data, title, series, series_name) {
  model <- fit_sigmoid(series)
  rownumber <- 1:length(data$date)
  pred_total <- round(predict(model, list(rownumber = 10000000))[[1]])
  pred <- predict(model, list(rownumber = rownumber))
  ggplot(data, aes(date, series, pred)) +
    geom_point(aes(y = series), stat="identity") +
    geom_line(aes(y = pred, color = blue), stat="identity", colour="blue") +
    ggtitle(label = paste(series_name, paste('(~', pred_total, sep = ''), 'expected)'), subtitle = NULL) +
    labs(x = "Date", y = series_name) +
    scale_x_date(date_labels = "%b %d", date_breaks = "4 days") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1), legend.title = element_blank())
}

sigmoid_side_by_side <- function(data, title) {
  positive <- sigmoid_graph(data, title, data$positive, 'Positive')
  death <- sigmoid_graph(data, title, data$death, 'Death')
  lay <- rbind(c(1,2), c(1,2))
  grid.arrange(positive, death, layout_matrix = lay, top = title)
}

growth_over_time_df <- function(data, series, title) {
  lists <- map(5:length(series - 1), function(n) {
    trimmed <- head(series, n = n)
    date <- max(head(data, n = n)$date)
    rate <- growth_rate(fit_exp(trimmed, title))
    list(date = format(date), rate = rate)
  })
  df <- setNames(do.call(rbind.data.frame, lists), c("date", "rate"))
  df$date <- ymd(df$date)
  return(df)
}

growth_change_plot <- function(data, title) {
  ggplot(data, aes(date, rate.x, rate.y)) +
    geom_line(aes(y = rate.x, color='Positive'), stat="identity") +
    geom_line(aes(y = rate.y, color='Deaths'), stat="identity") +
    ggtitle(label = title, subtitle = NULL) +
    #guides() +
    labs(x = "Date", y = "Growth Rates") +
    scale_x_date(date_labels = "%b %d", date_breaks = "2 days") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1), legend.title = element_blank()) +
    ylim(0.8, 1.6)
}

growth_change <- function(data, title) {
  df1 <- growth_over_time_df(data, data$death, title)
  df2 <- growth_over_time_df(data, data$positive, title)
  merged <- merge(df1, df2, by="date")
  growth_change_plot(merged, title)
}

show_state <- function(state_code) {
  for_state <- df %>%
    filter(state == state_code) %>%
    arrange(date)
  growth_side_by_side(for_state, state_code)
}

state_analysis <- function(df, state_code) {
  state_df <- filter(df, state == state_code)
  sigmoid_side_by_side(state_df, state_code)
  growth_change(state_df, state_code)
}

us_state_table <- function(df) {
  grouped <- df %>%
    group_by(state) %>%
    arrange(date) %>%
    summarise(
      death_growth = round_growth(try_fit_exp(death, state)),
      positive_growth = round_growth(try_fit_exp(positive, state)),
      deaths = max(death),
      positive = max(positive),
      tested = max(total)
    )
  
  sorted <- arrange(grouped, desc(death_growth))
  
  dt <- DT::datatable(
    sorted,
    width = '100%',
    colnames = c("State", "Death Growth", "Positive Growth", "Deaths", "Positive", "Tested"),
    extensions = c('FixedColumns',"FixedHeader"),
    options = list(scrollX = TRUE, paging=TRUE, fixedHeader=TRUE, sorting=TRUE))
  
  htmltools::as.tags(dt, standalone=TRUE)
}
