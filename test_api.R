# This script will test the API by sending a POST request to the local API endpoint

library(httr)

# Defining the API URL (Local server running on port 8000)
api_url <- "http://127.0.0.1:8000/predict"

# Sending a test POST request to the API with all parameters
response <- POST(api_url,
  body = list(
    gender = "Male",
    age = 67,
    bmi = 36.6,
    hypertension = 0,
    heart_disease = 1,
    ever_married = "Yes",
    work_type = "Private",
    Residence_type = "Urban",
    avg_glucose_level = 229,
    smoking_status = "formerly smoked"
  ), 
  encode = "json"  # Encode the body as JSON
)

# Printing the response from the API
print(content(response, "text"))
