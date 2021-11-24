ActiveAdmin.register Recruitment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :number_of_applicants, :event_title, :recruitment_condition, :introduction, :entries_count
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :number_of_applicants, :event_title, :recruitment_condition, :introduction, :entries_count]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :user_id, :number_of_applicants, :event_title, :recruitment_condition, :introduction
end
