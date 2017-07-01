class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  # default_scope データベースから要素を取得したときの、デフォルトの順序を指定するメソッド
  mount_uploader :picture, PictureUploader
  # picture_uploader.rbというファイルでPictureUploaderクラスが定義されている
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
