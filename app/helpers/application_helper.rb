module ApplicationHelper
    # Show formatted names of all users in a collection
    def show_users(ids)
        ids.map{ |id| User.find_by_id(id).name }.join(', ')
    end

    # Insert dropdown menu for adding a meal event to a shopping run. Should only be called when signed in!
    def add_to_shopping_run_menu(meal_event)
        html = ""
        html << "<ul id='dropdown' class='dropdown-menu'>"
        if is_admin?
            shopping_runs = ShoppingRun.all
        else
            shopping_runs = current_user.shopping_runs
        end
        shopping_runs.each do |shopping_run|
            html << "<li > #{ link_to ('buy on ' + shopping_run.date.to_s), new_shopping_request_path({:meal_event => meal_event.id, :shopping_run => shopping_run.id}) } </li>"
        end
        html << "<li > #{ link_to 'new shopping run', new_shopping_run_path(:request => meal_event.id) } </li>"
        html << "</ul>"
    end
end
