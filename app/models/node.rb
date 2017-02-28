class Node < ApplicationRecord
  belongs_to :node, optional: true
  has_many :nodes, dependent: :destroy
end
