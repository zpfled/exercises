class Loan < ActiveRecord::Base
  has_many :payments

  def serialize
    return
  end

  def outstanding_balance
    funded_amount - payments_total
  end

  def as_json(options = {})
    super(methods: :outstanding_balance)
  end

private

  def payments_total
    total = BigDecimal.new('0')
    payments.map { |payment| total += payment.amount }
    return total
  end
end
