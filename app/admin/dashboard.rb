ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    
    columns do
        column do
            panel "Últimas actividades agregadas" do
                ul do
                    Activity.last(5).map do |activity|
                    li link_to(activity.name, admin_activity_path(activity))
                    end
                end
            end
        end
            column do
                 panel "Usuarios" do
                     ul do
                     li "Usuarios registrados: #{User.count}"
                     li "Administradores registrados: #{AdminUser.count}"
                     end
                 end
             end
         column do
             panel "Actividades" do
                 ul do
                 li "Actividades creadas: #{Activity.count}"
                 
                 end
             end
         end
     end


    panel "Actividades creadas" do
        render 'admin_user/chart'
    end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
