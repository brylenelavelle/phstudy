Rails.application.routes.draw do



  # Routes for the Test question resource:

  get("/", { :controller => "categories", :action => "index" })

  # CREATE
  post("/insert_test_question", { :controller => "test_questions", :action => "create" })
          
  # READ
  get("/test_questions", { :controller => "test_questions", :action => "index" })
  
  get("/test_questions/:path_id", { :controller => "test_questions", :action => "show" })
  
  # UPDATE
  post("/modify_test_question/:path_id", { :controller => "test_questions", :action => "submit_test" })
  
  # DELETE
  get("/delete_test_question/:path_id", { :controller => "test_questions", :action => "destroy" })

  #post("/test_questions/:path_id", { :controller => "test_questions", :action => "reset_test" })
  match '/reset_test', to: 'test_questions#reset_test', via: [:get, :post], as: 'reset_test'

  post '/submit_test', to: 'test_questions#submit_test'
  
  #------------------------------

  # Routes for the Source file resource:

  # CREATE
  post("/insert_source_file", { :controller => "source_files", :action => "create" })
          
  # READ
  get("/source_files", { :controller => "source_files", :action => "index" })
  
  get("/source_files/:path_id", { :controller => "source_files", :action => "show" })
  
  # UPDATE
  
  post("/modify_source_file/:path_id", { :controller => "source_files", :action => "update" })
  
  # DELETE
  get("/delete_source_file/:path_id", { :controller => "source_files", :action => "destroy" })

  #------------------------------

  # Routes for the Test resource:

  # CREATE
  post("/insert_test", { :controller => "tests", :action => "create" })
          
  # READ
  get("/tests", { :controller => "tests", :action => "index" })
  
  get("/tests/:path_id", { :controller => "tests", :action => "show" })
  
  # UPDATE
  
  post("/modify_test/:path_id", { :controller => "tests", :action => "update" })
  
  # DELETE
  get("/delete_test/:path_id", { :controller => "tests", :action => "destroy" })

  #------------------------------

  # Routes for the Category resource:

  # CREATE
  post("/insert_category", { :controller => "categories", :action => "create" })
          
  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  
  get("/categories/:path_id", { :controller => "categories", :action => "show" })
  
  # UPDATE
  
  post("/modify_category/:path_id", { :controller => "categories", :action => "update" })
  
  # DELETE
  get("/delete_category/:path_id", { :controller => "categories", :action => "destroy" })

  #------------------------------

  # Routes for the Question resource:

  # CREATE
  post("/insert_question", { :controller => "questions", :action => "create" })
          
  # READ
  get("/questions", { :controller => "questions", :action => "index" })
  
  get("/questions/:path_id", { :controller => "questions", :action => "show" })
  
  # UPDATE
  
  post("/modify_question/:path_id", { :controller => "questions", :action => "update" })
  
  # DELETE
  get("/delete_question/:path_id", { :controller => "questions", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
