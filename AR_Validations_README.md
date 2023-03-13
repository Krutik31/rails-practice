
# Active Record Validations Practical

### Task 1: Create CRUD on Student Model.



### Task 2: Create CRUD on Faculty Model.



### Task 3: first_name and last_name of faculty must be present.

```
>>> validates :first_name, :last_name, presence: true

```


### Task 4: first_name and last_name of student must be present.

```
>>> validates :first_name, :last_name, presence: true

```


### Task 5: faculty's phone number length should be 10 and must be the number.

```
>>> validates :phone_number, length: {is: 10}, numericality: true

```


### Task 6: faculty's email id must be present and unique.

```
>>> validates :email, presence: true, uniqueness: true

```


### Task 7: Faculty or student's birthdate must be past date otherwise it should display the error message 'birthdate can't be in future.

```
>>> validate :validate_date_of_birth, if: :check_date?

    private

    def validate_date_of_birth
        errors.add(:dob, "birthdate can't be in future.")
    end

    def check_date?
        return if (self.dob.blank?)
        (Date.parse(self.dob.to_s) > Date.today)
    end

```


### Task 8: student's department must be in "IT" or "CE", otherwise it must display the message 'department can't be THE_VALUE_INSERTED'.

```
>>> validates :department, inclusion: {in: ["IT", "CE"], message: "can't be %{value}."}

```


### Task 9: Faculty's designation must not be any of these options "HOD" and "Sr. Prof." also designation should be one in "Ass. Prof." or "Prof" otherwise display the proper message.

```
>>> validates :designation, inclusion: {in: ["Ass. Prof.", "Prof"], message: "can't be %{value}."}, exclusion: {in: ["HOD", "Sr. Prof."], message: "%{value} is not allowed."}

```


### Task 10: Student should agree on the terms_of_usage, otherwise display the error message 'You cannot proceed without accepting Terms of Usage'.

```
>>> validates :terms_of_usage, acceptance: { message: "You cannot proceed without accepting Terms of Usage" }

```