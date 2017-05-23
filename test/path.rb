path = IPFilter::Path.new()
path.permit = ['okfile.php']
path.deny = ['ngfile.php']

assert('IPFilter::Path.permit?') do
  assert_true path.permit?('okfile.php')
  assert_false path.permit?('ngfile.php')
end

assert('IPFilter::Path.deny?') do
  assert_true path.deny?('ngfile.php')
  assert_false path.deny?('okfile.php')
end
