class RemindersController < ApplicationController
  def index
    @reminders = Reminder.all
  end

  def show
    @reminder = Reminder.find(params[:id])
  end

  def new
    @reminder = Reminder.new
  end

  def edit
    @reminder = Reminder.find(params[:id])
  end

  def create
    unless signed_in?
        return
    end

    @reminder = Reminder.new(params[:reminder])
    @reminder.save
    end
  end

  def update
    unless signed_in?
        return
    end

    @reminder = Reminder.find(params[:id])
    @reminder.update_attributes(params[:reminder])
    @reminder.save
  end

  def destroy
    unless signed_in?
        return
    end

    @reminder = Reminder.find(params[:id])
    @reminder.destroy
  end
end
