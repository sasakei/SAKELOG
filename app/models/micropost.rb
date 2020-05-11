class Micropost < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :title, presence: true
  validates :image, presence: true
  validate :image_size
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  private

    # アップロードされた画像のサイズをバリデーションする
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "画像のサイズが大きすぎます")
      end
    end



end
