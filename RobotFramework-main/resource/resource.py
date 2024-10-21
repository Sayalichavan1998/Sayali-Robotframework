from selenium import webdriver
import os

def test_keep_browser_open():
    options = webdriver.ChromeOptions()
    options.add_experimental_option("detach", True)
    driver = webdriver.Chrome(options=options)
    driver.get('http://selenium.dev')
    driver.quit()