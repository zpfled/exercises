# Returns an array of the least amount of coins required to get to 'amount'
# **Assumption** Change can always be made - BONUS POINTS - raise an error if
# change can not be made
# Params:
# +amount+:: The amount to make change for
# +denominations+:: An array containing the denominations that can be used.
#                   Defaults to standard US coin denominations

class ChangeMaker
  attr_accessor :change

  def initialize
    @change = []
  end

  def make_change(amount, denominations = [1, 5, 10, 25])
    optimal_change =
      Hash.new do |hash, key|
        if key < amount
          []
        elsif denominations.include?(key)
          [key]
        else
          # denominations...
      end
  end








end

class ChangeError < StandardError; end