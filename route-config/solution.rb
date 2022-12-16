=begin
The essential part of any Ruby on rails application is routing.
This defines how incoming requests are dispatched to controllers and actions to which
the application responds.

Your task is to define the routes for an application which exposes an API for commenting on cars
and looking up VIN numbers

The required routes are as follows
(route - controller action pair - expected parameters)

* GET /api/cars/car/A/comments - Api::CommentsController#index
* GET /api/cars/car/A/comments - Api::CommentsController#index
* POST /api/cars/car/A/comments - Api::CommentsController#create
* DELETE/api/cars/car/A/comments/0 - Api::CommentsController#destroy
* PUT /api/cars/car/A/comments/0 - Api::CommentsController#update
* PATCH /api/cars/car/A/comments/0 - Api::CommentsController#update
* POST /api/cars/car/A/comments/0/attachments - Api::AttachmentsController#create
* DELETE /api/cars/car/A/comments/0/attachments/1 - Api::AttachmentsController#destroy
* PUT /api/cars/car/A/comments/0/like - Api::CommentsController#like
* PATCH /api/cars/car/A/comments/0/like - Api::CommentsController#like
* PUT /api/cars/car/A/comments/0/ulike - Api::CommentsController#unlike
* PATCH /api/cars/car/A/comments/0/unlike - Api::CommentsController#unlike
* GET /api/cars/car/A/comments/top - Api::CommentsController#top
* GET /api/lookups/:vin - Api::Lookups#new - The route should allow the parameter :vin to have 17 alphanumeric characters only
* GET /reviews - Should redirect to /
* GET / - ReviewsController#index

=end


Rails.application.routes.draw do
# GET /api/cars/car/A/comments
get '/api/cars/car/:id/comments', to: 'api/comments#index', as: 'api_comments'

# POST /api/cars/car/A/comments
post '/api/cars/car/:id/comments', to: 'api/comments#create', as: 'create_api_comments'

# DELETE /api/cars/car/A/comments/0
delete '/api/cars/car/:id/comments/:comment_id', to: 'api/comments#destroy', as: 'destroy_api_comments'

# PUT /api/cars/car/A/comments/0
# PATCH /api/cars/car/A/comments/0
put '/api/cars/car/:id/comments/:comment_id', to: 'api/comments#update'
patch '/api/cars/car/:id/comments/:comment_id', to: 'api/comments#update'

# POST /api/cars/car/A/comments/0/attachments
post '/api/cars/car/:id/comments/:comment_id/attachments', to: 'api/attachments#create', as: 'create_api_attachments'

# DELETE /api/cars/car/A/comments/0/attachments/1
delete '/api/cars/car/:id/comments/:comment_id/attachments/:attachment_id', to: 'api/attachments#destroy', as: 'destroy_api_attachments'

# PUT /api/cars/car/A/comments/0/like
# PATCH /api/cars/car/A/comments/0/like
put '/api/cars/car/:id/comments/:comment_id/like', to: 'api/comments#like'
patch '/api/cars/car/:id/comments/:comment_id/like', to: 'api/comments#like'

# PUT /api/cars/car/A/comments/0/unlike
# PATCH /api/cars/car/A/comments/0/unlike
put '/api/cars/car/:id/comments/:comment_id/unlike', to: 'api/comments#unlike'
patch '/api/cars/car/:id/comments/:comment_id/unlike', to: 'api/comments#unlike'

# GET /api/cars/car/A/comments/top
get '/api/cars/car/:id/comments/top', to: 'api/comments#top', as: 'top_api_comments'

# GET /api/lookups/:vin - The route should allow the parameter :vin to have 17 alphanumeric characters only
get '/api/lookups/:vin', to: 'api/lookups#new', as: 'new_api_lookup', constraints: { vin: /[A-Za-z0-9]{17}/ }

# GET /reviews - Should redirect to /
get '/reviews', to: redirect('/')
get '', to: 'reviews#index'
end
