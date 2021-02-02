ActiveAdmin.register Event do
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :user
    column :lists do |i|
       i.lists.order('name ASC') do
        column do |list|
          list.name
        end
       end
    end
    actions
  end
  
end