class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource_or_scope)
    if resource.is_a?(Admin)
      admin_customers_path  # admin login先
    else
      user_path(current_customer) # customer login先
    end
  end
    
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path  #admin logout先
    else
      root_path # customer logout先
    end
  end
  
end