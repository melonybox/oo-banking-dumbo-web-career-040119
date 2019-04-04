require_relative 'bank_account'
require 'pry'

class Transfer
  attr_reader :sender, :receiver, :status, :amount
  @amount_history = 0
  
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @amount_history = amount
  end
  
  def valid?
    if sender.valid? && receiver.valid? == true
      true
    else
      false
    end
  end
  
  def execute_transaction
    if sender.balance < amount
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    else
      sender.balance -= amount
      receiver.balance += amount
      @status = 'complete'
      @amount -= amount
    end
  end
  
  def reverse_transfer
    sender.balance += @amount_history
    receiver.balance -= @amount_history
  end
end
