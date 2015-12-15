class Cosmetic < ActiveRecord::Base
    belongs_to :category
    mount_uploader :picture, PictureUploader
    
    def self.search(search)
   joins(:category).where("
   cosmetics.name LIKE ? 
   OR cosmetics.description LIKE ? 
   OR categories.name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    end
end   

