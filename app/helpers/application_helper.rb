module ApplicationHelper
	def flash_class(type)
		case type
		when :alert
			"alert-error"
		when :notice
			"alert-success"
		else
			""
		end
	end

  # Generates a set of checkboxes for a HABTM assignment in a form. Labels are properly assigned
  # to the checkboxes and markup is valid HTML.
  #
  # habtm_checkboxes(@organizer, :event_ids, @events, :name)
  #
  # <%= hidden_field_tag "organizer[event_ids][]", "" %>
  # <% @events.each do |event| -%>
  # <%= check_box_tag "organizer[event_ids][]", event.id, @organizer.event_ids.include?(event.id), :id => "organizer_events_id_#{event.id}" %>
  # <%= label_tag "organizer_events_id_#{event.id}", h(event.name) %>
  # <% end -%>
end