class ApplicationController < ActionController::API
  before_action :parse_request

  private
     def parse_request
       begin
         @json = JSON.parse(request.body.string)
       rescue
          @json = nil
       end
     end

     def validate_json schema_path, json
       path_schema = "#{Rails.root}/app/schemas/json/#{schema_path}"
       JSON::Validator.validate path_schema, json
     end

     def error_response message="", status
       if status == :bad_json
         render json: {"error": "Bad json"}, status: :bad_request
       elsif status == :conflict
         render json: {"error": "The resource already exists"}, status: :conflict
       else
         render json: {"error": message}, status: status
       end
     end
end
