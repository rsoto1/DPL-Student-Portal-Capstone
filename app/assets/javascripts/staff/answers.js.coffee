$(".accepted_box").change ->
  $.ajax "<%= dashboard_assignment_answer_url %>",
    type: "PUT"
    data:
      accepted: $(this).val()

  return