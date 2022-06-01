# --Minimum Waiting Time--
# You're given a non-empty array of positive integers representing the amounts
# of time that specific queries take to execute. Only one query can be
# executed at a time, but the queries can be executed in any order.
#
# A query's waiting time is defined as the amount of time that it must wait
# before its execution starts. In other words, if a query is executed second,
# then its waiting time is the duration of the first query; if a query is
# executed third, then its waiting time is the sum of the duration of the
# first two queries.
#
# Write a function that returns the minimum amount of total waiting time for
# all of the queries. For example, if you're given the queries of durations
# [1, 4, 5], then the total waiting time if the queries were executed in the
# order of [5, 1, 4] would be (0) + (5) + (5 + 1) = 11. The first query of
# duration 5 would be executed immediately, so its waiting time would be 0 ,
# the second query of duration 1 would have to wait 5 seconds (the duration of
# the first query) to be executed, and the last query would have to wait the
# duration of the first two queries before being executed. Note: The example
# given is not the correct answer for this set of queries, it was an example
# for that arrangement of numbers, but a lower time could be achieved.

# minimum_waiting_time <- function(times) {
#   (times
#     |> sort()
#     |> cumsum()
#     |> head(-1)
#     |> sum())
# }

library(purrr)

minimum_waiting_time <- function(times) {
  accumulator <- \(acc, x) c(acc[1] + x, acc[2] + acc[1] + x)
  (times
    |> sort()
    |> head(-1)
    |> purrr::reduce(accumulator, .init = c(0, 0))
    |> tail(1))
}

testthat::test_that("Should find minimum wait times for examples...", {
  example1 <- c(3, 2, 1, 2, 6)
  example2 <- c(2, 1, 1, 1)
  example3 <- c(1, 2, 4, 5, 2, 1)
  example4 <- c(25, 30, 2, 1)

  minimum_waiting_time(example1) |> expect_equal(17)
  minimum_waiting_time(example2) |> expect_equal(6)
  minimum_waiting_time(example3) |> expect_equal(23)
  minimum_waiting_time(example4) |> expect_equal(32)
})
