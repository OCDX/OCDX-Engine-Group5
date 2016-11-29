class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :json, JsonUploader
  mount_uploader :file, FileUploader
  mount_uploader :filetwo, FileTwoUploader
  mount_uploader :filethree, FileThreeUploader
  mount_uploader :filefour, FileFourUploader
  mount_uploader :filefive, FileFiveUploader
  def self.search(search)  
  where("title iLIKE ?", "%#{search}%")
  where("tags iLIKE ?", "%#{search}%")
  end
end
