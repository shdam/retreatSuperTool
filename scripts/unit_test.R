# Import the functions you want to test here
# Or simply paste them in this script for examples sake - Do not do this in practice!

some_function <- function(input) {
  parts <- strsplit(input, "_")[[1]]
  return(paste("output", parts[length(parts)], sep = "_"))
}

# Modify this function to test your functions.
test_some_function <- function(inputs = c("input_1", "input_2", "input_3"),
                               expected_outputs = c("output_1", "output_2", "output_3")) {
  for (i in 1:length(inputs)) {
    result <- some_function(inputs[i])
    expected <- expected_outputs[i]
    stopifnot(result == expected)
  }
  print("All awsome tests passed")
}

# Execute the test function
test_some_function()