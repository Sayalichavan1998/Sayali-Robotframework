from selenium import webdriver
options= webdriver.ChromeOptions()
options.add_experimental_option("detach",True)
options = webdriver.ChromeOptions()
driver = webdriver.Edge(service=s, options=options)