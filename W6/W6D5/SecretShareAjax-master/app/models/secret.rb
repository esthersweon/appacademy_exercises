class Secret < ActiveRecord::Base
  validates :tags, presence: true

  belongs_to :author, :class_name => "User"
  belongs_to :recipient, :class_name => "User"
  has_many :secret_taggings, inverse_of: :secret
  has_many :tags,
    through: :secret_taggings,
    source: :tag

  validates :author, :recipient, :title, :presence => true



end
