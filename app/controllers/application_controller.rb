class ApplicationController < ActionController::API
  before_action :parse_request

  private
     def parse_request
       begin
         @json = JSON.parse(request.body)
       rescue
          @json = nil
       end
     end
end
