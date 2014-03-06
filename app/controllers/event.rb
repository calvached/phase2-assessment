get '/all_events' do
  user = User.find(session[:user_id])
  @events = user.created_events
  erb :all_events
end

get '/create_event' do
  erb :create_event, layout: false
end

post '/create_event' do
  user = User.find(session[:user_id])
  user.created_events.create!(name: params[:name],
                              location: params[:location],
                              starts_at: params[:starts_at],
                              ends_at: params[:ends_at])
end

get '/event/:event_id/edit' do
  @event = Event.find(params[:event_id])
  erb :edit_event
end

post '/event/:event_id/edit' do
  event = Event.find(params[:event_id])
  event.update_attributes(name: params[:name],
                          location: params[:location],
                          starts_at: params[:starts_at],
                          ends_at: params[:ends_at])
  event.save

  redirect '/all_events'
end

get '/event/:event_id/destroy' do
  event = Event.find(params[:event_id])
  event.destroy
  redirect '/all_events'
end


# User can create many events
# Events belong to one creator
# Users can attend many events
# Events can have many attendees
