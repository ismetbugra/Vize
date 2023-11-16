library(testthat)

test_that("Workspace'teki tüm değişkenleri silme", {
  rm(list = ls())
  expect_equal(length(ls()), 0)
})

test_that("Eğer mevcut ise veri setini silme", {
  if ("MapsThatChangedOurWorld_StoryMap_Data.csv" %in% list.files()) {
    file.remove("MapsThatChangedOurWorld_StoryMap_Data.csv")
  }
  expect_equal("MapsThatChangedOurWorld_StoryMap_Data.csv" %in% list.files(), FALSE)
})

current_dir <- getwd()
relative_path <- file.path(current_dir,"Labex1_Q1_210401053_ismetbugra_topyurt.R")
source(relative_path)

test_that("Test : MapsThatChangedOurWorld_StoryMap_Data.csv adlı dosya belirtilen dizinde mevcuttur.", {
  file_path <- file.path(current_dir,"MapsThatChangedOurWorld_StoryMap_Data.csv")
  expect_true(file.exists(file_path), info = "Dosya mevcut değil.")
})

test_that("Test : maps adlı değişken Global Workspace’de mevcuttur.", {
  expect_true(exists("maps", envir = .GlobalEnv), info = "maps adlı değişken mevcut değil.")
})

test_that("Test : maps nesnesi bir data.frame'dir.", {
  expect_is(maps, "data.frame", info = "maps nesnesi bir data.frame değil.")
})