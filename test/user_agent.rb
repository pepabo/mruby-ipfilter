ua = IPFilter::UserAgent.new()
ua.permit = ['OKBot']
ua.deny = ['NGBot']

assert('IPFilter::UserAgent.permit?') do
  assert_true ua.permit?('OKBot')
  assert_false ua.permit?('NGBot')
end

assert('IPFilter::UserAgent.deny?') do
  assert_true ua.deny?('NGBot')
  assert_false ua.deny?('OKBot')
end
