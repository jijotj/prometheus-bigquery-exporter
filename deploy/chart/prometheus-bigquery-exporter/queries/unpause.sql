SELECT
  app_info.id as app_info,
  app_info.version as app_info_version,
  COUNT(DISTINCT user_id) AS value_count_2h
FROM
  `hellofresh-android.analytics_153903593.events_intraday_*`
WHERE
  event_name = 'Unpause_Submit'
  AND TIMESTAMP_MICROS(event_timestamp) > TIMESTAMP_ADD(CURRENT_TIMESTAMP(), INTERVAL -120 MINUTE)
GROUP BY
  app_info,
  app_info_version
