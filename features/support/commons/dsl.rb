module Common

    def load_data_test(param)
        YAML.load_file(File.join(Dir.pwd, "/features/support/data/#{param}_data.yaml"))
    end

    def load_config_env
        YAML.load_file(File.join(Dir.pwd, "/features/support/config/config.yaml"))
    end

    def add_screenshot
        file_path = 'log/screenshot.png'
        page.driver.browser.save_screenshot(file_path)
        image = open(file_path, 'rb', &:read)
        encoded_image = Base64.encode64(image)
        embed(encoded_image, 'image/png;base64', 'SCREENSHOT')
    end

    def getTagScenario(tags)
        variavelTemp = tags[2]
        tag = variavelTemp[/(?<=\@)(.*?)$/]
        return tag
    end

    def getTextAlertBox
        page.driver.browser.switch_to.alert.text
    end

    def acceptAlertBox
        page.driver.browser.switch_to.alert.accept
    end
    
end