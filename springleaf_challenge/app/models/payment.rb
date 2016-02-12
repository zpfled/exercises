class Payment < ActiveRecord::Base

  belongs_to :loan

  validates_presence_of :loan_id
  validates :loan, :associated => true

  validate :valid_amount

  def valid_amount
    if amount > loan.outstanding_balance
      fail
    end
  rescue
    errors.add(
      :error,
      'Payment must be less than the outstanding balance of its loan'
    )
  end
end