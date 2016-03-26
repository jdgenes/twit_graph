RAILS_ENV="production"

require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork

 every(1.week, 'delete.product', :at => 'Monday 00:00') {
   Tweet.delete_all
 }

end
