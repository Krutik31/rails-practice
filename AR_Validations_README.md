
# Active Record Validations Practical

### Task 1: Create CRUD on Student Model.

![Screenshot from 2023-03-13 16-40-06](https://user-images.githubusercontent.com/124874665/224690001-1ae88c60-9b1e-4f16-95b3-2d6c61db0a9f.png)

![Screenshot from 2023-03-13 16-40-33](https://user-images.githubusercontent.com/124874665/224690056-03f13237-549a-4f04-b70d-0fca2762d80f.png)

![Screenshot from 2023-03-13 16-40-42](https://user-images.githubusercontent.com/124874665/224690069-6b4cffcf-cc67-427e-80c3-19ee2c28039d.png)

![Screenshot from 2023-03-13 16-41-04](https://user-images.githubusercontent.com/124874665/224690087-570740bd-22c6-4c72-8c66-50a0992c2988.png)

![Screenshot from 2023-03-13 16-41-23](https://user-images.githubusercontent.com/124874665/224690103-514daf55-137d-4c70-ab34-43db220ec37f.png)


### Task 2: Create CRUD on Faculty Model.

![Screenshot from 2023-03-13 16-52-05](https://user-images.githubusercontent.com/124874665/224690148-23a60db8-a08e-4a70-923b-d91fb402693b.png)

![Screenshot from 2023-03-13 16-52-41](https://user-images.githubusercontent.com/124874665/224690163-6b7cd4b0-8dae-456e-825f-76691db73e85.png)

![Screenshot from 2023-03-13 16-52-48](https://user-images.githubusercontent.com/124874665/224690178-0362db5c-9926-4fe9-9e35-0226761c4701.png)

![Screenshot from 2023-03-13 16-52-58](https://user-images.githubusercontent.com/124874665/224690199-f6486c5c-8803-4471-8b21-e9f640a57a03.png)

![Screenshot from 2023-03-13 16-53-10](https://user-images.githubusercontent.com/124874665/224690213-f533b8ba-0ed3-4ea5-9b63-56dc6cb53f73.png)

![Screenshot from 2023-03-13 16-53-21](https://user-images.githubusercontent.com/124874665/224690234-bb953e0d-3bd8-43c7-aaf0-1eca00590b5d.png)


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

![Screenshot from 2023-03-13 17-04-12](https://user-images.githubusercontent.com/124874665/224690575-47aff080-94bb-475d-8b45-8c72c04d7c56.png)

![Screenshot from 2023-03-13 17-04-48](https://user-images.githubusercontent.com/124874665/224690708-876ccbe0-9f06-410a-acbd-81590fee3d82.png)
