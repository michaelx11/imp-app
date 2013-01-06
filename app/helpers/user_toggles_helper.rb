module UserTogglesHelper
    def toggle_admin_text
        return 'Toggle normal user' if is_admin?
        'Toggle admin'
    end

    def user_toggle
        if is_admin?
            cookies.delete(:admin)
        else
            cookies.permanent[:admin] = 'true'
        end
    end
end

