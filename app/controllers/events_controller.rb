class EventsController < ApplicationController
    include SimpleCalendar

    def index
        @events = MealEvent.all + ShoppingRun.all
    end
end
