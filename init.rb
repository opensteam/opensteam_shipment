# Include hook code here

require File.join( File.dirname(__FILE__), "lib", "states", "finished")
require File.join( File.dirname(__FILE__), "lib", "states", "pending")


Opensteam::Extension.register :order => :shipments do
  backend :sales
  
#  description "Extension for Order Invoices"
end

Opensteam::Models::Order.send( :include, OrderShipmentExtension )
