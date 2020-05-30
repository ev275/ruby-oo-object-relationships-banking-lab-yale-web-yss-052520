class Transfer
  # your code here
  require "pry"
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver    
    @amount = transfer_amount
    @status = "pending"
  end

  def valid?
    (@sender.valid? && @receiver.valid? && sender.balance >= @amount)
  end

  def execute_transaction
    # binding.pry
    if (self.valid? && (@status == "pending" || @status == "reversed"))
      @sender.deposit(-1 * @amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-1 * @amount)
      @status = "reversed"
    end      
  end
end
