class Product < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :price , :line_items
  validates :title , :description ,:image_url , :presence => true
  validates :title , :uniqueness => true
  default_scope  :order => 'title'
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private

  	#ensuring that ther r no line item 
  	def ensure_not_referenced_by_any_line_item
  		if line_items.empty?
  			return true
  		else
  			errors.add(:base , 'Line Items Present')
  			return false
  		end
  	end

end
  