# language:pt

class DeleteEmployeesPage < SitePrism::Page
  element :message_success, '.alert.alert-success'
  element :message_notavailable, 'td[class="dataTables_empty"]'

  def text_msg_success
    message_success.text
  end

  def text_msg_not_available
    message_notavailable.text
  end
end