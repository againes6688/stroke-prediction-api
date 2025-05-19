# Loading libraries
library(readr)
library(dplyr)
library(caret)
library(ROSE)

# Loading data
df <- read_csv("healthcare-dataset-stroke-data.csv")

# Droping 'id' column
df <- df %>% select(-id)

# Converting columns to factors
df <- df %>%
  mutate(
    gender = as.factor(gender),
    ever_married = as.factor(ever_married),
    work_type = as.factor(work_type),
    Residence_type = as.factor(Residence_type),
    smoking_status = as.factor(smoking_status),
    hypertension = as.factor(hypertension),
    heart_disease = as.factor(heart_disease),
    stroke = as.factor(stroke)
  )

# Handling missing BMI
df$bmi <- as.numeric(df$bmi)
df$bmi[is.na(df$bmi)] <- median(df$bmi, na.rm = TRUE)

# Filtering out missing stroke values
df <- df %>% filter(!is.na(stroke))

# Spliting the data into training and test sets
set.seed(123)
split <- createDataPartition(df$stroke, p = 0.8, list = FALSE)
train_data <- df[split, ]
test_data <- df[-split, ]

# Balancing the training data using ROSE (Random Over-Sampling Example)
train_balanced <- ROSE(stroke ~ ., data = train_data, seed = 1)$data

# Training the model
model <- train(
  stroke ~ ., data = train_balanced,
  method = "glm", family = "binomial"
)

# Saving the trained model
saveRDS(model, "stroke_model.rds")

# Evaluating the model on test data
preds <- predict(model, newdata = test_data)
conf_matrix <- confusionMatrix(preds, test_data$stroke)
print(conf_matrix)
