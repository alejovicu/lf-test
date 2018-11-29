from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from page_objects.google_po import GooglePage

wait = None

@given('I go to google')
def step(context):
    global wait
    wait = WebDriverWait(context.browser, 1000)
    context.browser.get('https://www.google.com')


@when('I search for "{keyToFind}"')
def step(context, keyToFind):
    search = wait.until(
        EC.element_to_be_clickable(GooglePage.searchButton)
    )
    search.send_keys(keyToFind)
    search.send_keys(Keys.RETURN)


@then('the Lending Front site should be listed as first result')
def step(context):
    first_result = wait.until(
        EC.element_to_be_clickable(GooglePage.firstResult)
    )
    EC.visibility_of(first_result)
    first_result.click()
    assert context.browser.title == "LendingFront | Small business lending made simple"


@then('I expect to see some related results')
def step_impl(context):
    no_results_container = context.browser.find_element_by_css_selector('.med.card-section')
    assert EC.visibility_of(no_results_container) == False