class User < ApplicationRecord
    has_secure_password

    has_many :albums

    validates :first_name, presence: { message: "First name field is empty."}
    validates :last_name, presence: { message: "Last name field is empty."}
    validates :email, presence: { message: "Email field is empty." }, uniqueness: { message: "This email is already registered."}
end
