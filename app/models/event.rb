class Event < ApplicationRecord
  validates :name, presence: true

  has_many :attendees
  has_many :event_groupships
  has_many :groups, :through => :event_groupships
  has_one :location
  belongs_to :category

  delegate :name, :to => :category, :prefix => true, :allow_nil => true
  #需修改寫法
  accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank
  #待了解寫法
end
