# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ForecastsHelper. For example:
#
# describe ForecastsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ForecastsHelper, type: :helper do
  it '#format_date_time' do
    result = helper.format_date_time(DateTime.new(2019, 8, 10, 4, 10, 9))
    expect(result).to eq 'August 10th, 2019 04:10'
  end

  it '#format_date_time_ago' do
    start_time = DateTime.new(2019, 8, 10, 4, 10, 9)
    older_time = DateTime.new(2019, 8, 10, 4, 8, 0)
    result = helper.format_date_time_ago(older_time, start_time)
    expect(result).to eq '02 minutes, 09 seconds'
  end
end
