class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if @sender.valid? && duplicate? == false
      @@all << self
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def duplicate?
    @@all.include?(self)
  end



end
