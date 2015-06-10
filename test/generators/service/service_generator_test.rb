require 'test_helper'
require 'generators/service/service_generator'

class ServiceGeneratorTest < Rails::Generators::TestCase
  tests ServiceGenerator

  destination File.join(Rails.root)
  teardown :cleanup

  test 'correct file is generated' do
    run_generator %w(find_match)

    assert_file 'app/services/find_match_service.rb'
  end

  test 'correct spec file is generated' do
    run_generator %w(find_match)

    assert_file 'spec/services/find_match_service_spec.rb'
  end

  def cleanup
    FileUtils.rm_rf(File.join(Rails.root, 'app/services'))
    FileUtils.rm_rf(File.join(Rails.root, 'spec/services'))
  end
end