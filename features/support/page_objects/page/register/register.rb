# encoding: utf-8
# language:pt

class RegisterPage < SitePrism::Page
  
  element  :title_page, '.login100-form-title'
  element  :username, 'input[name="username"]'
  element  :password, 'input[name="pass"]'
  element  :confirm_password, 'input[name="confirmpass"]'
  element  :register_modal, '.wrap-login100'
  element  :btn_register, '.login100-form-btn'
  elements :alert_message, '.alert-validate'
  element  :error_message, '.p-t-13 .m-t-17'
  element  :invalid_name,  '.p-t-10 .m-t-17'
  elements :error_message_user, '.p-b-1 span.txt1 .m-t-17'
    
  def home
    visit "/accounts/signup/"
  end

  def fill_form_user
    name = Faker::Name.name
    username.set(name.gsub!(" ",""))
    password.set("123456")
    confirm_password.set("123456")
    btn_register.click
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

  def fill_name_register(name_register)
    username.set(name_register)
    password.set("123456")
    confirm_password.set("123456")
    btn_register.click
  end

  def click_btn_register
    btn_register.click
  end

  def fill_form_user_existent(name)
    username.set(name)
    password.set("123456")
    confirm_password.set("123456")
    btn_register.click
  end
end
