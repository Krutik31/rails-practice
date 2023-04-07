class Employee < ApplicationRecord
  FILTERS = {
    "All Employees": '0',
    "Having age between 20 & 40 years": '1',
    "Full time available": '2',
    "Having 5 orders & age > 25": '3',
    "Created before today": '4',
    "Having 5 orders OR age < 25": '5',
    "Descending order by age": '6',
    "Ascending order by number of orders": '7',
    "Having salary > 45000": '8',
    "Having no_of_order > 5": '9',
    "Having 5 orders and salary > 70000 (unscope & only)": '10',
    "Descending order by id (reorder & reverse_order)": '11'
  }.freeze
end
