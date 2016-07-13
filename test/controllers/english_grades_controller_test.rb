require 'test_helper'

class EnglishGradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @english_grade = english_grades(:one)
  end

  test "should get index" do
    get english_grades_url
    assert_response :success
  end

  test "should get new" do
    get new_english_grade_url
    assert_response :success
  end

  test "should create english_grade" do
    assert_difference('EnglishGrade.count') do
      post english_grades_url, params: { english_grade: { feedback: @english_grade.feedback, grade_date: @english_grade.grade_date, performance_grade: @english_grade.performance_grade, student_id: @english_grade.student_id, subcategory: @english_grade.subcategory, teacher_id: @english_grade.teacher_id, title: @english_grade.title } }
    end

    assert_redirected_to english_grade_url(EnglishGrade.last)
  end

  test "should show english_grade" do
    get english_grade_url(@english_grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_english_grade_url(@english_grade)
    assert_response :success
  end

  test "should update english_grade" do
    patch english_grade_url(@english_grade), params: { english_grade: { feedback: @english_grade.feedback, grade_date: @english_grade.grade_date, performance_grade: @english_grade.performance_grade, student_id: @english_grade.student_id, subcategory: @english_grade.subcategory, teacher_id: @english_grade.teacher_id, title: @english_grade.title } }
    assert_redirected_to english_grade_url(@english_grade)
  end

  test "should destroy english_grade" do
    assert_difference('EnglishGrade.count', -1) do
      delete english_grade_url(@english_grade)
    end

    assert_redirected_to english_grades_url
  end
end
