from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service

# Set Chrome options for headless mode
chrome_options = Options()
chrome_options.add_argument("--headless=new")  # Use headless mode
chrome_options.add_argument("--disable-gpu")  # Disable GPU acceleration (optional)
chrome_options.add_argument("--no-sandbox")  

# Set ChromeDriver service
webdriver_service = Service('/opt/chromedriver-linux64/chromedriver')

# Create WebDriver instance
driver = webdriver.Chrome(service=webdriver_service, options=chrome_options)

# Navigate to a webpage (replace with your target URL)
driver.get("https://www.example.com")

# Get page source or interact with elements as needed
page_source = driver.page_source
print(page_source)

# Close the browser
driver.quit()
