require_relative 'bank_account'
require 'pry'

class Transfer
  attr_reader :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if sender.valid? && receiver.valid? == true
      true
    else
      false
    end
  end
  
  def execute_transaction
    binding.pry
    if sender.balance < amount
      "Transaction rejected. Please check your account balance."
    else
      sender.balance -= amount
      receiver.balance += amount
      @status = 'complete'
      @amount -= amount
    end
  end
end
