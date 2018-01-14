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

  end

  def duplicate?
    @@all.include?(self)
  end



end
