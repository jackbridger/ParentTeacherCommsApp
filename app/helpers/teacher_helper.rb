module TeacherHelper


def students_by_logins
    pie_chart @all_students.group(:sign_in_count).count, height: '300px', width: '300px', library: {
      title: {text: 'How often parents have logged in', x: -20},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'number of parents'
         }
      },
      xAxis: {
         title: {
             text: 'number of logins'
         }
      }
    }
  end

end
