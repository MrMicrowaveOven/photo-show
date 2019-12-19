class Folder < ApplicationRecord
  belongs_to :client
  has_many :images
end
