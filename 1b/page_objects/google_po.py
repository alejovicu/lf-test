from selenium.webdriver.common.by import By

class GooglePage(object):

    searchButton = (By.CSS_SELECTOR, 'input[name=q]')
    firstResult = (By.CSS_SELECTOR, 'div:nth-child(1) > div > div > div > div > div.r > a:nth-child(1)')
    