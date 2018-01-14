class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all << self
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && duplicate? == false
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
    else
      "Transaction rejected. Please check your account balance."
  end

  def duplicate?
    @@all.include?(self)
  end



end
