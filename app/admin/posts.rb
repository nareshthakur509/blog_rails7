ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :content
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # index do
  #   selectable_column
  #   id_column
  #   column :title
  #   column :content
  # end  



  permit_params :title, :content, comment_ids: []
  index do
    selectable_column
    id_column
    column :title
    column :content
    column :comments do |post|
      table_for post.comments.order('created_at ASC') do
        column do |comment|
          comment.content
        end
      end
    end
    actions
  end



  show do
    attributes_table do
      row :title
      row :content
      table_for post.comments.order('content ASC') do
        column "Comments" do |comment|
          comment.content
        end
      end
    end
  end
  
  form do |f|
    f.inputs "Add/Edit Post" do
      f.input :title
      f.input :content
      f.input :comments
    end
    actions
  end
end
