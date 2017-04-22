Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      scope '/users' do
        get '/'    => 'user#get'
        post '/'   => 'user#create'

        scope '/tokens' do
          post '/get'   =>  'user#get_token'
        end

        scope '/todos' do
          get '/'    => 'todo#index'
          post '/'   => 'todo#create'
          scope '/:todo' do
            get '/'      => 'todo#get'
            delete '/'   => 'todo#delete'
            put '/'   => 'todo#change'
          end
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
