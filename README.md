# 🧠 Stroke Prediction API (R + Plumber)

A machine learning project to predict stroke risk using real-world healthcare data — deployed as an HTTP API in R using the `plumber` package.

---

## 📦 Project Overview

This project trains a logistic regression model on the [Stroke Prediction Dataset](https://www.coursera.org/learn/showcase-build-and-deploy-a-stroke-prediction-model-with-r), balances the data using `ROSE`, and wraps the model in a RESTful API built with `plumber`.

> ✅ Purpose: Predict stroke likelihood for patients based on health and lifestyle features (like age, BMI, glucose levels, etc.).

---

## 🚀 Tech Stack

- **R**
  - `caret` (modeling)
  - `ROSE` (handling class imbalance)
  - `plumber` (API)
  - `httr` (testing the API)
- **Tooling**
  - Visual Studio Code (with R extension)
  - Postman / Swagger UI for testing

---

## 📁 Project Structure

stroke-prediction-api/
│
├── stroke_model.R # Trains the model and saves artifacts
├── api.r # Defines the REST API with Plumber
├── run_api.R # Runs the API on port 8000
├── test_api.r # Sends a test POST request to the API
├── healthcare-dataset-stroke-data.csv # Input dataset (Coursera)
└── README.md


---

## 🔍 Features Used

- `gender`
- `age`
- `hypertension`
- `heart_disease`
- `ever_married`
- `work_type`
- `Residence_type`
- `avg_glucose_level`
- `bmi`
- `smoking_status`

---

## 🧪 Running the Project

### 1️⃣ Train the Model

```r
source("stroke_model.R")

This will:

Load and clean the dataset

Balance the training data

Train a logistic regression model

Save: stroke_model.rds

2️⃣ Run the API

```r
source("run_api.R")
The API will be available at:
http://127.0.0.1:8000/__docs__/
You can test it in Swagger or Postman.

3️⃣ Test the API
r
Copy
Edit
source("test_api.r")
This script sends a sample input to the /predict endpoint and prints the result.

📈 Sample Prediction Response
json
Copy
Edit
{
  "prediction": ["1"]
}
1 = High risk of stroke
0 = Low risk of stroke

📚 Dataset Reference
Healthcare Stroke Prediction Dataset – Coursera

📌 Author
👩‍💻 Alexis Gaines
🔗 www.linkedin.com/in/alexis-gaines-069414122
