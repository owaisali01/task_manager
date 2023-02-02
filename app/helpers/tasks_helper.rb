module TasksHelper
    def extract_name_from_email(user)
        user.email.split('@').first
    end
end
