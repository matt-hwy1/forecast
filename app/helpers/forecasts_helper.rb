module ForecastsHelper
  def format_date_time(date_time)
    date_time.to_formatted_s(:long_ordinal)
  end

  def format_date_time_ago(date_time)
    interval = (DateTime.current.to_i - date_time.to_i)
    Time.at(interval).utc.strftime('%M minutes, %S seconds')
  end
end
