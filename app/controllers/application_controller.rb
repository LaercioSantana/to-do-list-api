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

     def validate_json schema_path, json
       path_schema = "#{Rails.root}/app/schemas/json/#{schema_path}"
       JSON::Validator.validate path_schema, json
     end
end
