import os
import selenium
from selenium import webdriver

from page_objects.google_po import GooglePage

def before_all(context):
  context.browser = webdriver.Remote(
    command_executor = 'http://127.0.0.1:4444/wd/hub',
    desired_capabilities = {
      'browserName': os.environ['BROWSER_TO_USE'],
      'javascriptEnabled': True
    })

def after_all(context):
  context.browser.quit()