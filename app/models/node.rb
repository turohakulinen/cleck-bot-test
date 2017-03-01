class Node < ApplicationRecord
  belongs_to :node, optional: true
  has_many :nodes, dependent: :nullify
  has_one :answer, dependent: :destroy
end
