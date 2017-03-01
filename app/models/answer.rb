class Answer < ApplicationRecord
  belongs_to :node
  def to_message
    raise 'this method should be overriden and return message hash'
  end
end
