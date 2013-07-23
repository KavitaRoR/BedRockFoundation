class Material < ActiveRecord::Base
  has_many :material_uses
  has_many :jobs, :through => :material_uses


  def list_label
    "#{name} - #{dimensions} @ $#{price_per_pack} per #{qty_per_pack}"
  end

  def price_per_unit
    price_per_pack / qty_per_pack
  end

  def dimensions
    [width, length, height].select{|f| f.present? }.join(" &times; ")
  end 
end
