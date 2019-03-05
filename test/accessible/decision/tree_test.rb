require 'test_helper'

class Accessible::Decision::Tree::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Accessible::Decision::Tree
  end
end
