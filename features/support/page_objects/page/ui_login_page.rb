# encoding: utf-8
# language:pt

class LoginPage < SitePrism::Page
  
  element :title_page, '.login100-form-title'
  element :username, 'input[name="username"]'
  element :usernameInvalid, 'div.container-login100 > div > form div:nth-child(5)'
  element :password, 'input[name="pass"]'
  element :passwordInvalid, 'div.container-login100 > div > form div:nth-child(7)'
  element :link_register, '.txt2.bo1'
  element :btn_enter, '.login100-form-btn'
  element :link_register_header, 'li.nav-item a[href*="signup"]'
  element :link_login_header, 'li.nav-item a[href*="login"]'
  element :message_alert, '.alert-danger'
  element :btnSair, 'a[href*="logout"]'

  def home
    visit "/accounts/login/"
  end

  def logout
    click_link 'Sair'
  end

  def click_link_register_header
    link_register_header.click
  end

  def click_link_login_header
    link_login_header.click
  end

  def login_user(dataui)
    username.set(dataui["email"])
    password.set(dataui["password"])
  end

  def click_enter
    btn_enter.click
  end

  def click_register
    link_register.click
  end

  def getclassUsernameField
    usernameInvalid[:class]
  end

  def getclassPasswordField
    passwordInvalid[:class]
  end

  def findbtnSair
    btnSair
  end
  
end