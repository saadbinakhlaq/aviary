class Bird
  include Mongoid::Document
  field :name, type: String
  field :family, type: String
  field :continents, type: Array
  field :added, type: Date
  field :visible, type: Mongoid::Boolean, default: false

  before_create :set_added

  validates :name, presence: true
  validates :family, presence: true
  validates :continents, presence: true
  validates_with ContinentsValidator, fields: [:continents]

  scope :visible, -> { where(visible: true) }

  private

  def set_added
    self.added = Date.today
  end
end
