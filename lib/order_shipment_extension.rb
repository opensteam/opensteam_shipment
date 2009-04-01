module OrderShipmentExtension

  def self.included(base)
    base.class_eval do
      has_many :shipments, :class_name => "Shipment", :extend => Opensteam::Sales::OrderBase::OrderExtension
    end
  end

end
