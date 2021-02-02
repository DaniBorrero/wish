ActiveAdmin.register User do
  index do
    selectable_column
    id_column
    column :email
    column :events    
    actions
  end
  
end