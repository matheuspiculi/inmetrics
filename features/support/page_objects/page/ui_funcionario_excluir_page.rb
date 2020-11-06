# encoding: utf-8
# language:pt

class DeleteEmployeesPage < SitePrism::Page
    
    element :message_success, '.alert.alert-success'
    element :message_notavailable, 'td[class="dataTables_empty"]'

    def getTextMsgSucess
        message_success.text
    end

    def getTextMsgNotAvailable
        message_notavailable.text
    end

end