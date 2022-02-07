class Host < ApplicationRecord
    validates :interval, length: {minimum: 2}
    validates :interval, numericality: true
end
