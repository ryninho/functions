# TODO: turn this example into a function
# creating the "era" field is the key to turning event or on/off state data into time-to-event
df %>%
  arrange(driver_id, desc(snapshot_date)) %>%
  mutate(worked = ifelse(
    snapshot_date < shopper_created, NA, ifelse(!is.na(hours), 1, 0)
    )) %>% 
  group_by(driver_id) %>%
  mutate(era = cumsum(worked == 1)) %>% 
  group_by(driver_id, era) %>% 
  mutate(
    tte = ifelse(is.na(worked), NA, row_number() - 1),
    censored = ifelse(era == 0, 1, 0)
    )
