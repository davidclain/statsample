$:.unshift(File.dirname(__FILE__)+'/../lib/')
require 'statsample'
require 'test/unit'
class StatsampleGSLTestCase < Test::Unit::TestCase
  def test_matrix_to_gsl
    if HAS_GSL
      a=[1,2,3,4,20].to_vector(:scale)
      b=[3,2,3,4,50].to_vector(:scale)
      c=[6,2,3,4,3].to_vector(:scale)
      ds={'a'=>a,'b'=>b,'c'=>c}.to_dataset
      gsl=ds.to_matrix.to_gsl
      assert_equal(5,gsl.size1)
      assert_equal(3,gsl.size2)
      matrix=gsl.to_matrix
      assert_equal(5,matrix.row_size)
      assert_equal(3,matrix.column_size)
    end
  end
end


