# encoding: utf-8
# language:pt

class RegisterPage < SitePrism::Page
  
  element :title_page, '.login100-form-title'
  element :username, 'input[name="username"]'
  element :password, 'input[name="pass"]'
  element :confirm_password, 'input[name="confirmpass"]'
  element :errorUsername, 'form > div:nth-child(4)'
  element :errorPassword, 'form > div:nth-child(6)'
  element :errorConfirmPassword, 'form > div:nth-child(8)'
  element :register_modal, '.wrap-login100'
  element :btn_register, '.login100-form-btn'
  element :btn_login, '.p-t-20'
  element :alert_message, '.alert-validate'
  element :error_message, '.p-t-13 .m-t-17'
  element :invalid_name,  '.p-t-10 .m-t-17'
  element :error_message_user, '.p-b-1 span.txt1 .m-t-17'
    
  def home
    visit "/accounts/signup/"
  end

  def fill_form_user
    fill_name
    fill_password("123456")
    fill_confirm_password("123456")
    click_btn_register
  end

  def fill_name_register(name_register)
    username.set(name_register)
    fill_password("123456")
    fill_confirm_password("123456")
    click_btn_register
  end

  def fill_form_user_existent(name)
    username.set(name)
    fill_password("123456")
    fill_confirm_password("123456")
    click_btn_register
  end

  def fill_name
    name = Faker::Name.name
    username.set(name.gsub!(" ",""))
  end

  def fill_password(password01)
    password.set(password01)
  end

  def fill_confirm_password(password02)
    confirm_password.set(password02)
  end

  def getUsarnameValue
    username.value
  end

  def getPasswordValue
    password.value
  end

  def getConfirmPassawordValue
    confirm_password.value
  end

  def getUsernameClass
    errorUsername[:class]
  end

  def getPasswordClass
    errorPassword[:class]
  end

  def getConfirmPasswordClass
    errorConfirmPassword[:class]
  end

  def geterrorInvalidName
    invalid_name.text
  end

  def click_btn_register
    btn_register.click
  end

  def click_btn_login
    btn_login.click
  end

end
