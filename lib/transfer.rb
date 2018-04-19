class Transfer
  
  require 'pry'
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end
  
  def execute_transaction
    until @status == 'complete'
      if valid?
        sender.balance -= amount
        receiver.balance += amount
        @status = 'complete'
      end
  end
  
end
