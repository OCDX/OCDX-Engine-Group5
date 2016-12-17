class Post < ActiveRecord::Base
    require 'json'
#    require 'httparty' 
  belongs_to :user
  has_many :authors
  accepts_nested_attributes_for :authors, allow_destroy: true
  mount_uploader :json, JsonUploader
  mount_uploader :file, FileUploader
  mount_uploader :filetwo, FileTwoUploader
  mount_uploader :filethree, FileThreeUploader
  mount_uploader :filefour, FileFourUploader
  mount_uploader :filefive, FileFiveUploader
  def self.search(search)  
  where("title iLIKE ? OR tags iLIKE ?", "%#{search}%", "%#{search}%")
  end

  def get_json
string = '{"post":{"title":"titles parsed"}}'
parsed = JSON.parse(string)
p parsed["post"]["title"]

#ap JSON.parse HTTParty.get('http://ec2-35-160-28-84.us-west-2.compute.amazonaws.com:3000/uploads/post/json/1/manifest.json').response.body
#  source = Dir.chdir(File.dirname(__FILE__))
  end
end

