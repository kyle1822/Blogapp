class Post < ApplicationRecord
  validates :title, :content, :category, presence: true
  has_many :line_items, inverse_of: :order
<%= render 'shared/error_messages' %>
end
