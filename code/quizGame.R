# Sample Questions Data Frame
questions_df <- data.frame(
    Question = c("What is the fastest land animal?",
                 "Which mammal has the longest gestation period?",
                 "Which bird is known for its impressive mimicry skills?",
                 "What is the largest type of ‘big cat’ in the world?",
                 "Which animal is known to spend 90% of its day sleeping?"),
    Options = c("A: Cheetah; B: Lion; C: Greyhound",
                "A: Elephant; B: Whale; C: Human",
                "A: Parrot; B: Lyrebird; C: Crow",
                "A: Lion; B: Tiger; C: Jaguar",
                "A: Sloth; B: Koala; C: Panda"),
    CorrectAnswer = c("A", "A", "B", "B", "B"),
    stringsAsFactors = FALSE
)


ask_question <- function(question, options) {
    cat("\nQuestion:\n")
    cat(question, "\n\n")
    options_list <- strsplit(options, ";")[[1]]
    cat("Options:\n")
    for (option in options_list) {
        cat(option, "\n")
    }
    cat("\n")
}


get_user_input <- function() {
    user_input <- readline(prompt = "Your answer: ")
    return(toupper(user_input))  # Convert to upper case for consistency
}

calculate_score <- function(user_input, correct_answer) {
    if (user_input == correct_answer) {
        return(1)
    } else {
        return(0)
    }
}

display_final_message <- function(score, total) {
    cat("\nQuiz Completed!\n")
    cat("Your total score is: ", score, "/", total, "\n\n")
    
    if (score == total) {
        cat("Amazing! You're a true animal facts expert!\n")
    } else if (score > total * 0.5) {
        cat("Great job! You have a good knowledge of animal facts.\n")
    } else {
        cat("Good effort! Keep learning and you'll be an expert in no time!\n")
    }
}

runQuiz <- function(){
    # Welcome and Instructions
    cat("Welcome to the Animal Facts Quiz!\n")
    cat("Instructions: Answer each question by typing the letter corresponding to your choice (A, B, or C) and press Enter.\n\n")
    
    # Quiz Loop
    total_score <- 0
    
    for (i in 1:nrow(questions_df)) {
        ask_question(questions_df$Question[i], questions_df$Options[i])
        user_input <- get_user_input()
        
        # Score calculation and feedback
        score <- calculate_score(user_input, questions_df$CorrectAnswer[i])
        total_score <- total_score + score
        
        if (score == 1) {
            cat("Correct!\n")
        } else {
            cat("Wrong. The correct answer was ", questions_df$CorrectAnswer[i], "\n")
        }
    }
    
    # Final Message
    display_final_message(total_score, nrow(questions_df))
    
}

