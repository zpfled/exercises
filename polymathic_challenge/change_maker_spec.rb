require_relative 'change_maker'

describe ChangeMaker do

  describe '#make_change' do
    it 'returns a hash with default values that reflect minimum coins to make change' do
      change_maker = ChangeMaker.new
      expect(change_maker.make_change(1, [1, 8, 10])).to match_array [1]

      change_maker = ChangeMaker.new
      expect(change_maker.make_change(10, [1, 8, 10])).to match_array [10]
      expect(change_maker.make_change(16, [1, 8, 10])).to match_array [8, 8]
      expect(change_maker.make_change(17, [1, 8, 10])).to match_array [1, 8, 8]
    end
  end
end