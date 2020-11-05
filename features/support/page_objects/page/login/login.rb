# encoding: utf-8
# language:pt

class LoginPage < SitePrism::Page
  
  element :title_page, '.login100-form-title'
  element :username, 'input[name="username"]'
  element :password, 'input[name="pass"]'
  element :link_register, '.txt2.bo1'
  element :btn_enter, '.login100-form-btn'
  element :link_register_header, 'li.nav-item a[href*="signup"]'
  element :link_login_header, 'li.nav-item a[href*="login"]'
  element :message_alert, '.alert-danger'
  
  def home
    visit "/accounts/login/"
  end

  def click_link_register_header
    link_register_header.click
  end

  def click_link_login_header
    link_login_header.click
  end

  def login_user(user_login)
    username.set(user_login["email"])
    password.set(user_login["password"])
  end

  def click_enter
    btn_enter.click
  end

  def click_register
    link_register.click
  end

end