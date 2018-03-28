cip = IPFilter::CountryFromIP.new('./build/maxminddb-fixtures/GeoLite2-City.mmdb')
cip.permit = ['US', 'JP']
cip.deny = ['KR']

assert('IPFilter::CountryFromIP.permit?') do
  assert_true cip.permit?('8.8.8.8')
  assert_false cip.permit?('58.65.64.0')
end

assert('IPFilter::CountryFromIP.deny?') do
  assert_true cip.deny?('58.65.64.0')
  assert_false cip.deny?('8.8.8.8')
end
