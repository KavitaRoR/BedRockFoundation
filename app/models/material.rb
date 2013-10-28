class Material < ActiveRecord::Base
  has_many :material_uses
  has_many :jobs, :through => :material_uses


  def list_label
    "#{name} - #{dimensions} @ $#{price_per_pack} #{per}"
  end

  def list_label_no_price
    "#{name} - #{dimensions}"
  end

  def per
    if qty_per_pack == 1 || qty_per_pack == 0
      if quantity_label != "each"       
        "per #{quantity_label}"
      else
        "#{quantity_label}"
      end
    else
      "per #{qty_per_pack} #{quantity_label}"
    end
  end

  def price_per_unit 
    price_per_pack / qty_per_pack rescue 0
  end

  def dimensions
    [width, length, height].select{|f| f.present? }.join(" x ")
  end 
end
