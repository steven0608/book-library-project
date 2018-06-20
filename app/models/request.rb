class Request < ApplicationRecord
  belongs_to :library
  belongs_to :user

   def self.pending_requests
     self.all.select do |request|
      request.completed? == false
     end
   end
end
