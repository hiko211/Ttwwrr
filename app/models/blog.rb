class Blog < ActiveRecord::Base
    validates_presence_of :content, :title
    validates :content, length: { maximum: 140 }

    belongs_to :user
    has_many :comments, dependent: :destroy
end
