class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :title, presence: true, allow_nil: true
  validates :image, presence: true, allow_nil: true
  validate :image_size

  private

    # アップロードされた画像のサイズをバリデーションする
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "画像のサイズが大きすぎます")
      end
    end

end
