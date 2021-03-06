module FitgemOauth2
  class Client

    def hearrate_on_date(date)
      get_call("1/user/#{@user_id}/activities/heart/date/#{format_date(date)}.json")
    end

    def hearrate_in_period(date, period)
      periods = %w("1d" "7d" "30d" "1w" "1m")
      unless period && periods.include?(period)
        raise InvalidArgumentError, "period should be one of #{periods}"
      end
      get_call("1/user/#{@user_id}/activities/heart/date/#{format_date(date)}/#{period}.json")
    end

    def hearrate_in_range(start_date, start_range)
      get_call("1/user/#{@user_id}/activities/heart/date/#{format_date(start_date)}/#{format_date(end_date)}.json")
    end

    def heartrate_series_in_range(start_date, end_date, detail_level)
      detail_levels = %w("1sec" "1min")
      unless detail_level && detail_levels.include?(detail_level)
        raise InvalidArgumentError, "detail level should be one of #{detail_levels}"
      end
      get_call("/1/user/#{@user_id}/activities/heart/date/#{format_date(start_date)}/#{format_date(end_date)}/#{detail_level}.json")
    end

    def heartrate_series_in_range_time(start_date, end_date, detail_level, start_time, end_time)
      detail_levels = %w("1sec" "1min")
      unless detail_level && detail_levels.include?(detail_level)
        raise InvalidArgumentError, "detail level should be one of #{detail_levels}"
      end
      get_call("1/user/#{@user_id}/activities/heart/date/#{format_date(start_date)}/#{format_date(end_date)}/#{detail_level}/time/#{start_time}/#{end_time}.json")
    end

    def hearrate_daily_series_in_range(start_date, detail_level)
      detail_levels = %w("1sec" "1min")
      unless detail_level && detail_levels.include?(detail_level)
        raise InvalidArgumentError, "detail level should be one of #{detail_levels}"
      end
      get_call("1/user/#{@user_id}/activities/heart/date/#{format_date(start_date)}/1d/#{detail_level}.json")
    end

    def heartrate_daily_series_in_range_time(start_date, detail_level, start_time, end_time)
      detail_levels = %w("1sec" "1min")
      unless detail_level && detail_levels.include?(detail_level)
        raise InvalidArgumentError, "detail level should be one of #{detail_levels}"
      end
      get_call("1/user/#{@user_id}/activities/heart/date/#{format_date(start_date)}/1d/#{detail_level}/time/#{start_time}/#{end_time}.json")
    end

  end
end
