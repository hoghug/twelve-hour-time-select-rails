$('body').on('change', '.custom-time-select--wrapper select', function() {
  var wrapper = $(this).parent('.custom-time-select--wrapper');
  var timeInput = wrapper.find('.custom-time-select--input');

  var hoursVal = parseInt(wrapper.find('.custom-time-select--hours').val()) || 0;
  var minutesVal = wrapper.find('.custom-time-select--minutes').val() || '00';
  var ampmVal = wrapper.find('.custom-time-select--ampm').val();

  if (ampmVal == 'AM' && hoursVal == 12) {
    var hoursMod = 0;
  } else if (ampmVal == 'PM') {
    var hoursMod = hoursVal + 12;
  } else {
    var hoursMod = hoursVal;
  };

  timeInput.val(hoursMod + ':' + minutesVal + ':00')
});