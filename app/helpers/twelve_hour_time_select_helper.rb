module TwelveHourTimeSelect
  def twelve_hour_time_select_fields(minute_start = 0, minute_end = 59, minute_step = 1, form_object, column)
    default_hours, default_minutes, default_ampm = '01', '00', 'PM'
    if form_object.object[column].present?
      time_arr = form_object.object[column].strftime('%I %M %p').split(' ')
      default_hours, default_minutes, default_ampm = time_arr[0], time_arr[1], time_arr[2]
    end

    arr = [
      '<div class="custom-time-select--wrapper">',
      form_object.hidden_field(column, class: 'custom-time-select--input'),
      select_tag('', options_for_select((1..12).to_a.map { |x| sprintf('%02d', x) }, default_hours), class: 'custom-time-select--hours'), 
      select_tag('', options_for_select((minute_start..minute_end).step(minute_step).to_a.map { |x| sprintf('%02d', x) }, default_minutes), class: 'custom-time-select--minutes'),
      select_tag('', options_for_select(['AM', 'PM'], default_ampm), class: 'custom-time-select--ampm'),
      '</div>'
    ]
    return arr.join('').html_safe
  end
end