Rails.application.routes.draw do
  # Routes for the Course resource:

  # CREATE
  get("/courses/new", { :controller => "courses", :action => "new_form" })
  post("/create_course", { :controller => "courses", :action => "create_row" })

  # READ
  get("/courses", { :controller => "courses", :action => "index" })
  get("/courses/:id_to_display", { :controller => "courses", :action => "show" })

  # UPDATE
  get("/courses/:prefill_with_id/edit", { :controller => "courses", :action => "edit_form" })
  post("/update_course/:id_to_modify", { :controller => "courses", :action => "update_row" })

  # DELETE
  get("/delete_course/:id_to_remove", { :controller => "courses", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
