class School < ActiveRecord::Base
  has_many    :orders
  before_save :set_slug

  def set_slug
    self.slug = name.gsub(/&(.)(acute|grave|circ|tilde|cedil|ring|slash);/,'\1').parameterize
  end
end