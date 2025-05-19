# Loading required packages
library(plumber)
library(caret)

# Loading model artifacts
model <- readRDS("stroke_model.rds")

#* @apiTitle Stroke Prediction API

#* Predict stroke
#* @param gender Gender (Male, Female, Other)
#* @param age Age of the person
#* @param bmi BMI
#* @param hypertension 0 or 1
#* @param heart_disease 0 or 1
#* @param ever_married Yes or No
#* @param work_type Type of work
#* @param Residence_type Urban or Rural
#* @param avg_glucose_level Glucose level
#* @param smoking_status Smoking status
#* @post /predict
function(gender, age, bmi, hypertension, heart_disease, ever_married, work_type,
         Residence_type, avg_glucose_level, smoking_status) {
  
  tryCatch({
    input <- data.frame(
      gender = as.factor(gender),
      age = as.numeric(age),
      bmi = as.numeric(bmi),
      hypertension = as.factor(as.integer(hypertension)),
      heart_disease = as.factor(as.integer(heart_disease)),
      ever_married = as.factor(ever_married),
      work_type = as.factor(work_type),
      Residence_type = as.factor(Residence_type),
      avg_glucose_level = as.numeric(avg_glucose_level),
      smoking_status = as.factor(smoking_status)
    )

    print("Input data:")
    print(input)

    # Making a prediction
    prediction <- predict(model, newdata = input)
    print("Prediction:")
    print(prediction)

    return(list(prediction = as.character(prediction)))

  }, error = function(e) {
    print(paste("Error:", e$message))
    return(list(error = e$message))
  })
}
