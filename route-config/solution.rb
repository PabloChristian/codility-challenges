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
  get 'cars/car/:id/comments', to: 'comments#index'
  post 'cars/car/:id/comments', to: 'comments#create'
  delete 'cars/car/:id/comments/:id', to: 'comments#destroy'
  put 'cars/car/:id/comments/:id', to: 'comments#update'
  patch 'cars/car/:id/comments/:id', to: 'comments#update'

  post 'cars/car/:id/comments/attachments', to: 'attachments#create'
  delete 'cars/car/:id/comments/:id/attachments/:id', to: 'attachments#destroy'

  put 'cars/car/:id/comments/:id/like', to: 'comments#update'
  patch 'cars/car/:id/comments/:id/like', to: 'comments#update'

  put 'cars/car/:id/comments/:id/unlike', to: 'comments#update'
  patch 'cars/car/:id/comments/:id/unlike', to: 'comments#update'

  get 'cars/car/:id/comments/top', to: 'comments#top'

  match 'lookups/:vin' => "lookups#new", :constraints => {:vin => /.+?\-\d+/}

  get 'reviews', to: '/'
  get '', to: 'reviews#index'
end
