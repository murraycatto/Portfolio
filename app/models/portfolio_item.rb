class PortfolioItem < ApplicationRecord
  friendly_id :name, use: :slugged
end
