class Transporter < ApplicationRecord
    validates :code, :name, :address, :contact_phone, presence: true
    validates :code, uniqueness: true
end
