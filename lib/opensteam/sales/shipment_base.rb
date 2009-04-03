#	openSteam - http://www.opensteam.net
#  Copyright (C) 2009  DiamondDogs Webconsulting
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; version 2 of the License.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License along
#  with this program; if not, write to the Free Software Foundation, Inc.,
#  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

module Opensteam::Sales


  # Module for the Shipment Logic, included into a Shipment model.
  module ShipmentBase


    # available States for an Shipment-Instance
    module States

    end

    def self.included(base) #:nodoc:
      
      Opensteam::Dependencies.set_shipment_model( base )
      
      
      base.send( :extend, ClassMethods )
      base.send( :include, InstanceMethods )
      
      base.class_eval do
        include Opensteam::StateMachine
      
        belongs_to :order, :class_name => 'Opensteam::Models::Order'
        belongs_to :customer, :class_name => 'User'
        belongs_to :address, :class_name => 'Opensteam::Models::Address'
      
        has_many :items, :class_name => 'Opensteam::Container::Item'
        alias :order_items :items
            
        named_scope :by_order, lambda { |order_id| { :include => :order, :conditions => { :order_id => order_id } } }
        
      end
    end


    module ClassMethods #:nodoc:
    end


    module InstanceMethods #:nodoc:
      
      def initialize(*args) #:nodoc:
        super

        if order
          self.address = order.shipping_address
          self.customer = order.customer
        end
      end

    end
    
  end

end
