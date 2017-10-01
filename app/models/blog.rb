class Blog < ActiveRecord::Base
    validates :content, presence: true
    validates :content, length: { maximum: 140 }

    belongs_to :user
    has_many :comments, dependent: :destroy
end
