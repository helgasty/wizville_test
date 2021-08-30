class Link < ApplicationRecord

  validates :base_url, presence: true
  validates :base_url, uniqueness: true
  validates_length_of :base_url, maximum: 250

  has_many :stats, dependent: :delete_all
  before_validation :generate_identifier

  def short
    Rails.application.routes.url_helpers.short_url(identifier: self.identifier)
  end

  private
  def generate_identifier
    self.identifier = SecureRandom.uuid[0..5]
  end
end
