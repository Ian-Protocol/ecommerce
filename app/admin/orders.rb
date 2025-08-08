ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :status, :subtotal, :tax, :total, :address_id, :tracking, :ship_company, :ship_type
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :status, :subtotal, :tax, :total, :address_id, :tracking, :ship_company, :ship_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
